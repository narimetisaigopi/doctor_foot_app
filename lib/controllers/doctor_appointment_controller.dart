import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/admin_data_controller.dart';
import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/controllers/doctors_controller.dart';
import 'package:drfootapp/controllers/payment_controller.dart';
import 'package:drfootapp/models/admin_model.dart';
import 'package:drfootapp/models/appointment_models/doctor_appointment_model.dart';
import 'package:drfootapp/models/check_your_feet_data_model.dart';
import 'package:drfootapp/models/doctor_model.dart';
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

import '../models/patient_model.dart';

class DoctorAppointmentController extends GetxController {
  DateTime selectedDateTime = DateTime.now();
  bool isDateSelected = false;
  bool isLoading = false;
  DoctorAppointmentType _doctorAppointmentType =
      DoctorAppointmentType.consultYourDoctor;

  setDoctorAppointmentType(DoctorAppointmentType doctorAppointmentType) {
    _doctorAppointmentType = doctorAppointmentType;
  }

  CheckYourFeetDataModel? selectedCheckYourFeetDataModel;

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

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
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

  resetAllFields() {
    nameTextController.clear();
    ageTextController.clear();
    mobileNumberTextController.clear();
    gender = null;
    bookingForWhom = "Others";
    selectedCheckYourFeetDataModel = null;
    _doctorAppointmentType = DoctorAppointmentType.consultYourDoctor;
    selectedDate = "";
    selectedTime = "";
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
    AdminModel adminModel = await Get.put(AdminDataController()).getAdminData();
    return int.parse(
        "${Utility.getAppointmentTodayId()}${adminModel.doctorAppointmentId}");
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

      DocumentReference appointmentDocumentReference =
          doctorsAppointmentsCollectionReference.doc();
      late DoctorAppointmentModel appointmentModel;
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        int appointmentId = await _generatePaymentId();
        // Create Appointment Model
        appointmentModel = DoctorAppointmentModel(
          appointmentDate: selectedDate,
          appointmentTime: selectedTime,
          doctorId: doctorModel.docId,
          appointmentType: _doctorAppointmentType,
          timestamp: Timestamp.now(),
          uid: Utility().getCurrentUserId(),
          checkYourFeetDataModel: selectedCheckYourFeetDataModel,
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
          totalAmount: discountAmount.toDouble(),
          paidAmount: getPayableAmount().toDouble(),
          subscriptionId: appointmentModel.docId,
          paymentStatus: PaymentStatus.completed,
          paymentServiceType: PaymentServiceType.homeService,
        );
        // Update appointment with payment id in transaction
        transaction.update(
            appointmentDocumentReference, {"paymentId": paymentModel.docId});
        transaction.update(adminDocumentReference,
            {"doctorAppointmentId": FieldValue.increment(1)});
        await Get.put(DoctorsController())
            .updateDoctorNoOfPatientsCount(doctorModel.docId);
      });
      // Resetting selection
      isDateSelected = false;
      // Navigate to confirmation screen after the transaction succeeds
      resetAllFields();
      Get.to(() =>
          AppointmentSuccessScreen(doctorAppointmentModel: appointmentModel));
    } catch (e, stack) {
      logger("createAppointment Transaction Error: ${e.toString()}");
      logger("createAppointment Stack Trace: ${stack.toString()}");
      Utility.toast("appointment failed due to $e");
    } finally {
      _updateLoading(false); // Ensure loading is hidden at the end
    }
  }

  Future cancelAppointment(DoctorAppointmentModel appointmentModel) async {
    await doctorsAppointmentsCollectionReference
        .doc(appointmentModel.docId)
        .update({
      "appointmentStatus": AppointmentStatus.cancelled.index,
      "modifiedAt": DateTime.now(),
      "cancelledByUid": Utility().getCurrentUserId()
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
