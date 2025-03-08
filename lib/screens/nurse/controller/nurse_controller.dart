import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/nurse/nurse_auth_controller.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:get/get.dart';

class NurseController extends GetxController {
  RxBool isLoading = false.obs;
  goOnlineOrOffiline(bool status) async {
    isLoading.value = true;
    await partnersCollectionReference
        .doc(loginPartnerModel.docId)
        .update({"isOnline": status, "onlineTimestamp": Timestamp.now()});
    loginPartnerModel.isOnline = status;
    loginPartnerModel.onlineTimestamp = Timestamp.now();
    Utility.toast(status ? "You are in online." : "You are in offline.");
    isLoading.value = false;
  }
}
