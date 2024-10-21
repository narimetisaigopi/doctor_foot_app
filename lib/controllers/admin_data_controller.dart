import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/admin_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:get/get.dart';

class AdminDataController extends GetxController {
  AdminModel adminModel = AdminModel();
  @override
  void onInit() {
    getAdminData();
    super.onInit();
  }

  Future<AdminModel> getAdminData() async {
    DocumentSnapshot documentSnapshot = await adminDocumentReference.get();
    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      adminModel = AdminModel.fromSnapshot(documentSnapshot);
    } else {
      // if not existed we are adding new data
      await adminDocumentReference.set(adminModel.toMap());
    }
    return adminModel;
  }
}
