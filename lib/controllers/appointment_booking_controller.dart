import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/controllers/payment_controller.dart';
import 'package:drfootapp/models/admin_model.dart';
import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/models/payment_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/book_appointement/appointment_confirm_screen.dart';
import 'package:drfootapp/screens/payments/razorpay_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AppointmentBookingController extends GetxController {
  DateTime selectedDateTime = DateTime.now();
  bool isDateSelected = false;
  bool isLoading = false;
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

  int getPayableAmount() {
    return billTotalAmount - discountAmount;
  }

  int getDiscountAmount(DoctorModel doctorModel) {
    discountAmount = doctorModel.actualPrice - doctorModel.offerPrice;
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

  selectDate(String date) {
    selectedDate = date;
    dateTextEditingController.text = date;
    update();
  }

  selectTime(String date) {
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
      appointmentId = adminModel.appointmentId + 1;
      await adminCollectionReference
          .doc("admin")
          .update({"appointmentId": appointmentId});
    } else {
      await adminCollectionReference.doc("admin").set(adminModel.toMap());
    }
    return appointmentId;
  }

  onDateSelection(DateTime dateTime) {
    isDateSelected = true;
    selectedDateTime = dateTime;
    _updateLoading(false);
  }

  proceedToPayment(DoctorModel doctorModel) {
    RazorPayScreen().startPayment(
        amount: getPayableAmount().toDouble(),
        description: "Home services",
        onSuccess: (PaymentSuccessResponse paymentSuccessResponse) async {
          await createAppointment(doctorModel);
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
          await createAppointment(doctorModel);
        });
  }

  createAppointment(DoctorModel doctorModel) async {
    try {
      _updateLoading(true); // Show loading at the start
      int appointmentId = await _generatePaymentId();
      DocumentReference appointmentDocumentReference =
          appointmentsCollectionReference.doc();
      late AppointmentModel appointmentModel;
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Create Appointment Model
        appointmentModel = AppointmentModel(
          appointmentDate: selectedDate,
          appointmentTime: selectedTime,
          doctorId: doctorModel.docId,
          timestamp: Timestamp.now(),
          uid: Utility().getCurrentUserId(),
          docId: appointmentDocumentReference.id,
          appointmentId: appointmentId,
          appointmentStatus: AppointmentStatus.booked,
          patientModel: PatientModel(
            name: nameTextController.text,
            age: int.parse(ageTextController.text),
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
          totalAmount: getDiscountAmount(doctorModel).toDouble(),
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
      Get.to(
          () => AppointmentConfirmScreen(appointmentModel: appointmentModel));
    } catch (e, stack) {
      logger("createAppointment Transaction Error: ${e.toString()}");
      logger("createAppointment Stack Trace: ${stack.toString()}");
    } finally {
      _updateLoading(false); // Ensure loading is hidden at the end
    }
  }

  Future cancelAppointment(AppointmentModel appointmentModel) async {
    await appointmentsCollectionReference.doc(appointmentModel.docId).update({
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
