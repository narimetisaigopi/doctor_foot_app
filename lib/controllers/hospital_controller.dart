import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/article_model.dart';
import 'package:drfootapp/models/hospital_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';

class HospitalController extends GetxController {
  XFile? xFile;
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  doUpdate(bool status) {
    isLoading = status;
    update();
  }

  Future<void> pickFile() async {
    xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  createHospital() async {
    try {
      doUpdate(true);
      HospitalModel hospitalModel = HospitalModel();
      if (xFile != null) {
        String url = await FirebaseStorageController().uploadImageToFirebase(
            directoryName: storageArticlesBlogs, uploadFile: xFile!);
        hospitalModel.image = url;
      }

      hospitalModel.title = titleTextEditingController.text;
      hospitalModel.address = addressTextEditingController.text;
      DocumentReference documentReference = hospitalsCollectionReference.doc();
      hospitalModel.uid = documentReference.id;
      hospitalModel.timestamp = DateTime.now();
      hospitalModel.isActive = true;
      await documentReference.set(hospitalModel.toJson());
      Utility.toast("Created successfully.");
      Get.back();
    } catch (e) {
      Utility.toast("Failed to create $e");
    } finally {
      doUpdate(false);
    }
  }
}
