import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/address_controller.dart';
import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/controllers/payment_controller.dart';
import 'package:drfootapp/models/admin_model.dart';
import 'package:drfootapp/models/foot_service_appointment_model.dart';
import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/models/patient_model.dart';
import 'package:drfootapp/models/payment_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/book_appointement/appointment_success_screen.dart';
import 'package:drfootapp/screens/payments/razorpay_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class FootServiceAppointmentController extends GetxController {
  DateTime selectedDateTime = DateTime.now();
  bool isDateSelected = false;
  bool isLoading = false;
  AppointmentType appointmentType = AppointmentType.consultYourDoctor;
  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  TextEditingController dateTextEditingController = TextEditingController();
  TextEditingController applyCouponController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController mobileNumberTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  String? gender;
  String bookingForWhom = "Others";
  String selectedDate = "", selectedTime = "";

  int billTotalAmount = 0, discountAmount = 0;

  // coupon
  TextEditingController searchCouponCodeController = TextEditingController();

  int getPayableAmount() {
    return billTotalAmount - discountAmount;
  }

  int getDiscountAmount({required int actualPrice, required int offerPrice}) {
    discountAmount = actualPrice - offerPrice;
    return discountAmount;
  }

  selectWhomBooking(String value) {
    bookingForWhom = value;
    if (bookingForWhom == "Self") {
      setSelfData();
    } else {
      setOthersData();
    }
    update();
  }

  selectGender(String value) {
    gender = value;
    update();
  }

  onSelectDate(String date) {
    selectedDate = date;
    dateTextEditingController.text = date;
    update();
  }

  onSelectTime(String date) {
    selectedTime = date;
    update();
  }

  setSelfData() {
    nameTextController.text = loginUserModel.userName;
    mobileNumberTextController.text = loginUserModel.mobileNumber;
    gender = loginUserModel.gender;
  }

  setOthersData() {
    nameTextController.clear();
    ageTextController.clear();
    mobileNumberTextController.clear();
    gender = null;
    bookingForWhom = "Others";
  }

  bool isDateAndTimeSelected() {
    if (selectedDate.isNotEmpty && selectedTime.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<int> _generatePaymentId() async {
    DocumentSnapshot documentSnapshot =
        await adminCollectionReference.doc("admin").get();
    int appointmentId = 1;
    AdminModel adminModel = AdminModel();
    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      adminModel = AdminModel.fromSnapshot(documentSnapshot);
      await documentReference
          .update({"footServiceAppointmentId": FieldValue.increment(1)});
    } else {
      await documentReference.set(adminModel.toMap());
    }
    return appointmentId;
  }

  onDateSelection(DateTime dateTime) {
    isDateSelected = true;
    selectedDateTime = dateTime;
    _updateLoading(false);
  }

  proceedToPayment(FootServiceModel footServiceModel) {
    RazorPayScreen().startPayment(
        amount: getPayableAmount().toDouble(),
        description: "Home services",
        onSuccess: (PaymentSuccessResponse paymentSuccessResponse) async {
          await createAppointment(footServiceModel);
        },
        onError: (PaymentFailureResponse paymentFailureResponse) {
          Utility.toast(
              "Payment failed due to  ${paymentFailureResponse.message}");
          _updateLoading(false);
        },
        onExternalWallet:
            (ExternalWalletResponse externalWalletResponse) async {
          Utility.toast(
              "onExternalWallet: payment failed due to  ${externalWalletResponse.walletName}");
          await createAppointment(footServiceModel);
        });
  }

  createAppointment(FootServiceModel footServiceModel) async {
    try {
      _updateLoading(true); // Show loading at the start
      int appointmentId = await _generatePaymentId();
      DocumentReference appointmentDocumentReference =
          footServicesAppointmentsCollectionReference.doc();
      late FootServiceAppointmentModel appointmentModel;
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Create Appointment Model
        appointmentModel = FootServiceAppointmentModel(
          appointmentDate: selectedDate,
          appointmentTime: selectedTime,
          doctorId: "",
          appointmentType: appointmentType,
          timestamp: Timestamp.now(),
          uid: Utility().getCurrentUserId(),
          docId: appointmentDocumentReference.id,
          appointmentId: appointmentId,
          appointmentStatus: AppointmentStatus.booked,
          footServiceModel: footServiceModel,
          addressModel: Get.put(AddressesController()).selectedAddressModel,
          patientModel: PatientModel(
            name: nameTextController.text,
            age: 0,
            mobileNumber: mobileNumberTextController.text,
            gender: gender ?? "",
            bookingForWhom: bookingForWhom,
          ),
        );

        // Save appointment in transaction
        transaction.set(appointmentDocumentReference, appointmentModel.toMap());
        // Payment transaction creation
        PaymentModel paymentModel =
            await Get.put(PaymentController()).addPaymentTransaction(
          totalAmount: getDiscountAmount(
                  offerPrice: footServiceModel.offerPrice,
                  actualPrice: footServiceModel.actualPrice)
              .toDouble(),
          paidAmount: getPayableAmount().toDouble(),
          subscriptionId: appointmentModel.docId,
          paymentStatus: PaymentStatus.completed,
          paymentServiceType: PaymentServiceType.homeService,
        );
        // Update appointment with payment id in transaction
        transaction.update(
            appointmentDocumentReference, {"paymentId": paymentModel.docId});
      });

      // Resetting selection
      isDateSelected = false;
      // Navigate to confirmation screen after the transaction succeeds
      Get.to(() => AppointmentSuccessScreen(
            footServiceAppointmentModel: appointmentModel,
          ));
    } catch (e, stack) {
      logger("createAppointment Transaction Error: ${e.toString()}");
      logger("createAppointment Stack Trace: ${stack.toString()}");
      Utility.toast("appointment failed due to $e");
    } finally {
      _updateLoading(false); // Ensure loading is hidden at the end
    }
  }

  Future cancelAppointment(FootServiceAppointmentModel appointmentModel) async {
    await footServicesAppointmentsCollectionReference
        .doc(appointmentModel.docId)
        .update({
      "appointmentStatus": AppointmentStatus.cancelledByUser.index,
      "modifiedAt": DateTime.now()
    });
    await paymentsCollectionReference.doc(appointmentModel.paymentId).update({
      "paymentStatus": PaymentStatus.cancelled.index,
      "modifiedAt": DateTime.now(),
      "refundStatus": PaymentStatus.pending.index,
      "refundModifiedAt": DateTime.now(),
      "refundTimestamp": DateTime.now(),
    });
    Utility.toast("Appointment cancelled successfully.");
  }
}
