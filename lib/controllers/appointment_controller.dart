import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/admin_model.dart';
import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/book_appointement/appointment_confirm_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  DateTime selectedDateTime = DateTime.now();
  bool isDateSelected = false;
  bool isLoading = false;
  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }
  String selectedDate = "";

  selectDate(String date) {
    selectedDate = date;
    update();
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

  createAppointment() async {
    try {
      int appointmentId = await _generatePaymentId();
      _updateLoading(true);
      DocumentReference documentReference =
          appointmentsCollectionReference.doc();
      AppointmentModel appointmentModel = AppointmentModel();
      appointmentModel.appointmentTimestamp =
          Timestamp.fromDate(selectedDateTime);
      appointmentModel.timestamp = Timestamp.now();
      appointmentModel.uid = Utility().getCurrentUserId();
      appointmentModel.docId = documentReference.id;
      appointmentModel.appointmentId = appointmentId;
      appointmentModel.timestamp = Timestamp.now();
      appointmentModel.appointmentStatus = AppointmentStatus.booked;
      await documentReference.set(appointmentModel.toMap());
      isDateSelected = false;
      Get.to(() => AppointmentConfirmScreen(
            appointmentModel: appointmentModel,
          ));
    } catch (e, stack) {
      logger("createAppointment ${e.toString()}");
      logger("createAppointment stack ${stack.toString()}");
    } finally {
      _updateLoading(false);
    }
  }
}
