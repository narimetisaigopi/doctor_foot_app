import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/nurse/nurse_auth_controller.dart';
import 'package:drfootapp/models/foot_service_appointment_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:get/get.dart';

class NurseController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<FootServiceAppointmentModel?> footServiceAppointmentModel =
      FootServiceAppointmentModel().obs;

  fetchAndAssignOrder() async {
    footServiceAppointmentModel.value = null;
    var snapshot = await footServicesAppointmentsCollectionReference.get();
    if (snapshot.docs.isNotEmpty) {
      var document = snapshot.docs.first; // Get the first document
      footServiceAppointmentModel.value =
          FootServiceAppointmentModel.fromSnapshot(document.data() as Map);
    } else {}
  }

  goOnlineOrOffiline(bool status) async {
    try {
      isLoading.value = true;
      await partnersCollectionReference
          .doc(loginPartnerModel.docId)
          .update({"isOnline": status, "onlineTimestamp": Timestamp.now()});
      loginPartnerModel.isOnline = status;
      loginPartnerModel.onlineTimestamp = Timestamp.now();
      Utility.toast(status ? "You are in online." : "You are in offline.");
    } catch (e) {
      logger("goOnlineOrOffiline $e");
      Utility.toast("Something went worng,please try again");
    } finally {
      isLoading.value = false;
    }
  }
}
