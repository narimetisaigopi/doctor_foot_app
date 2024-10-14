import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/hospital_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HospitalsController extends GetxController {
  XFile? xFile;
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();

  List<HospitalModel> hospitalList = [];

  doUpdate(bool status) {
    isLoading = status;
    update();
  }

  Future<void> pickFile() async {
    xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  createHospital({HospitalModel? hospitalModel}) async {
    try {
      doUpdate(true);
      // If editing, use the passed HospitalModel, else create a new one
      HospitalModel newHospitalModel = hospitalModel ?? HospitalModel();
      // If a new image is picked, upload it and update the image URL
      if (xFile != null) {
        String url = await FirebaseStorageController().uploadImageToFirebase(
            directoryName: storageHospitals, uploadFile: xFile!);
        newHospitalModel.image = url;
      }
      // Update the model with form data
      newHospitalModel.title = titleTextEditingController.text;
      newHospitalModel.address = addressTextEditingController.text;
      if (hospitalModel == null) {
        // Creating a new hospital
        DocumentReference documentReference =
            hospitalsCollectionReference.doc();
        newHospitalModel.docId = documentReference.id;
        newHospitalModel.timestamp = DateTime.now();
        newHospitalModel.isActive = true;
        // Save new hospital to Firestore
        await documentReference.set(newHospitalModel.toJson());
        Utility.toast("Created successfully.");
      } else {
        // Updating an existing hospital
        newHospitalModel.modifiedAt = DateTime.now();
        // Update hospital in Firestore
        await hospitalsCollectionReference
            .doc(newHospitalModel.docId)
            .update(newHospitalModel.toJson());
        Utility.toast("Updated successfully.");
      }
      Get.back();
    } catch (e) {
      Utility.toast("Failed to create or update: $e");
    } finally {
      doUpdate(false);
    }
  }

  resetFields() {
    xFile = null;
    titleTextEditingController.clear();
    addressTextEditingController.clear();
  }

  updateActivieStatus(HospitalModel hospitalModel, bool status) async {
    await hospitalsCollectionReference
        .doc(hospitalModel.docId)
        .update({"isActive": status, "modifiedAt": DateTime.now()});
    Utility.toast("Updated successfully.");
  }

  fetchHospitals() async {
    // Fetch hospitals from Firestore
    QuerySnapshot querySnapshot = await hospitalsCollectionReference.get();
    hospitalList = querySnapshot.docs
        .map((doc) => HospitalModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    update();
  }
}
