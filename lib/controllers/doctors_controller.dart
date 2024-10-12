import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DoctorsController extends GetxController {
  XFile? xFile;
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController aboutTextEditingController = TextEditingController();
  TextEditingController yearsOfExperienceTextEditingController =
      TextEditingController();
  TextEditingController actualPriceTextEditingController =
      TextEditingController();
  TextEditingController offerPriceTextEditingController =
      TextEditingController();

  doUpdate(bool status) {
    isLoading = status;
    update();
  }

  Future<void> pickFile() async {
    xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  createDoctor({DoctorModel? doctorModel}) async {
    try {
      doUpdate(true);
      // If editing, use the passed HospitalModel, else create a new one
      DoctorModel newDoctorModel = doctorModel ?? DoctorModel();
      // If a new image is picked, upload it and update the image URL
      if (xFile != null) {
        String url = await FirebaseStorageController().uploadImageToFirebase(
            directoryName: storageDoctors, uploadFile: xFile!);
        newDoctorModel.image = url;
      }
      // Update the model with form data
      newDoctorModel.title = titleTextEditingController.text;
      newDoctorModel.address = addressTextEditingController.text;
      if (doctorModel == null) {
        // Creating a new hospital
        DocumentReference documentReference = doctorsCollectionReference.doc();
        newDoctorModel.uid = documentReference.id;
        newDoctorModel.timestamp = DateTime.now();
        newDoctorModel.isActive = true;
        // Save new hospital to Firestore
        await documentReference.set(newDoctorModel.toJson());
        Utility.toast("Created successfully.");
      } else {
        // Updating an existing hospital
        newDoctorModel.modifiedAt = DateTime.now();
        // Update hospital in Firestore
        await doctorsCollectionReference
            .doc(newDoctorModel.uid)
            .update(newDoctorModel.toJson());
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

  updateActivieStatus(DoctorModel doctorModel, bool status) async {
    await doctorsCollectionReference
        .doc(doctorModel.uid)
        .update({"isActive": status, "modifiedAt": DateTime.now()});
    Utility.toast("Updated successfully.");
  }
}
