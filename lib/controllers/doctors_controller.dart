import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/models/hospital_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DoctorsController extends GetxController {
  XFile? xFile;
  bool isLoading = false;
  final formKey = GlobalKey<FormBuilderState>();
  HospitalModel? selectedHospitalModel;
  TextEditingController educationTextEditingController =
      TextEditingController();
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
      // Start the loading indicator
      doUpdate(true);
      // checking mobile number or email already in use or not
      if (doctorModel == null) {
        DoctorModel doctorModelMobile = await getDoctorDataByMobileNumber(
            mobileNumberTextEditingController.text);
        if (doctorModelMobile.docId.isNotEmpty) {
          Utility.toast("Account already existed with this mobile number.");
          doUpdate(false);
          return;
        }
        DoctorModel doctorModelEmail =
            await getDoctorDataByEmail(emailTextEditingController.text);
        if (doctorModelEmail.docId.isNotEmpty) {
          Utility.toast("Account already existed with this email.");
          doUpdate(false);
          return;
        }
      }
      // If editing, use the passed doctorModel, else create a new one
      DoctorModel newDoctorModel = doctorModel ?? DoctorModel();

      // If a new image is picked, upload it and update the image URL
      if (xFile != null) {
        String url = await FirebaseStorageController().uploadImageToFirebase(
            directoryName: storageDoctors, uploadFile: xFile!);
        newDoctorModel.image = url;
      }
      // Update the model with form data
      newDoctorModel.education = educationTextEditingController.text;
      newDoctorModel.address = addressTextEditingController.text;
      newDoctorModel.name = nameTextEditingController.text;
      newDoctorModel.mobileNumber = mobileNumberTextEditingController.text;
      newDoctorModel.email = emailTextEditingController.text;
      newDoctorModel.about = aboutTextEditingController.text;
      newDoctorModel.yearsOfExperiance =
          double.parse(yearsOfExperienceTextEditingController.text);
      newDoctorModel.actualPrice =
          int.parse(actualPriceTextEditingController.text);
      newDoctorModel.offerPrice =
          int.parse(offerPriceTextEditingController.text);
      if (doctorModel == null) {
        // Creating a new doctor
        DocumentReference documentReference = doctorsCollectionReference.doc();
        newDoctorModel.docId = documentReference.id;
        newDoctorModel.timestamp = DateTime.now();
        newDoctorModel.isActive = true;
        // Save the new doctor to Firestore
        await documentReference.set(newDoctorModel.toJson());
        Utility.toast("Created successfully.");
      } else {
        // Updating an existing doctor
        newDoctorModel.modifiedAt = DateTime.now();
        // Update the doctor in Firestore
        await doctorsCollectionReference
            .doc(newDoctorModel.docId)
            .update(newDoctorModel.toJson());
        Utility.toast("Updated successfully.");
      }
      resetFields();
      // Navigate back after successful operation
      Get.back();
    } catch (e) {
      // Display error message
      Utility.toast("Failed to create or update doctor: $e");
    } finally {
      // Stop the loading indicator
      doUpdate(false);
    }
  }

  Future<DoctorModel> getDoctorDetailsByUid(String uid) async {
    DocumentSnapshot documentSnapshot =
        await doctorsCollectionReference.doc(uid).get();
    DoctorModel doctorModel = DoctorModel();
    if (documentSnapshot.exists) {
      doctorModel = DoctorModel.fromMap(documentSnapshot.data() as Map);
    }
    return doctorModel;
  }

  Future<DoctorModel> getDoctorDataByMobileNumber(String mobileNumber) async {
    QuerySnapshot querySnapshot = await doctorsCollectionReference
        .where("mobileNumber", isEqualTo: mobileNumber)
        .get();
    DoctorModel doctorModel = DoctorModel();
    if (querySnapshot.docs.isNotEmpty) {
      doctorModel = DoctorModel.fromMap(querySnapshot.docs.first.data() as Map);
    }
    return doctorModel;
  }

  Future<DoctorModel> getDoctorDataByEmail(String email) async {
    QuerySnapshot querySnapshot =
        await doctorsCollectionReference.where("email", isEqualTo: email).get();
    DoctorModel doctorModel = DoctorModel();
    if (querySnapshot.docs.isNotEmpty) {
      doctorModel = DoctorModel.fromMap(querySnapshot.docs.first.data() as Map);
    }
    return doctorModel;
  }

  resetFields() {
    // Clear all text fields
    educationTextEditingController.clear();
    addressTextEditingController.clear();
    nameTextEditingController.clear();
    mobileNumberTextEditingController.clear();
    emailTextEditingController.clear();
    aboutTextEditingController.clear();
    yearsOfExperienceTextEditingController.clear();
    actualPriceTextEditingController.clear();
    offerPriceTextEditingController.clear();
    selectedHospitalModel = null;
    formKey.currentState?.reset();
  }

  updateActivieStatus(DoctorModel doctorModel, bool status) async {
    await doctorsCollectionReference
        .doc(doctorModel.docId)
        .update({"isActive": status, "modifiedAt": DateTime.now()});
    Utility.toast("Updated successfully.");
  }

  updateDoctorNoOfPatientsCount(String docId) async {
    logger("docId$docId");
    await doctorsCollectionReference
        .doc(docId)
        .update({"noOfPatients": FieldValue.increment(1)});
  }
}
