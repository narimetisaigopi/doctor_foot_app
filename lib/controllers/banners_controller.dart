import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/banner_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'firebase_storage_controller.dart';

class BannersController extends GetxController {
  XFile? xFile;
  bool isLoading = false;
  final formKey = GlobalKey<FormBuilderState>();
  final PageController bannersPageController = PageController();

  List<BannerModel> bannersList = [];

  // TextEditingControllers for Banner fields
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  TextEditingController navigationLinkTextEditingController =
      TextEditingController();

  // Method to update loading status
  doUpdate(bool status) {
    isLoading = status;
    update();
  }

  // Method to pick an image file
  Future<void> pickFile() async {
    xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  fetchBanners() async {
    // Fetch hospitals from Firestore
    QuerySnapshot querySnapshot = await bannersCollectionReference.get();
    bannersList = querySnapshot.docs
        .map((doc) => BannerModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    update();
  }

  // Method to create or update a banner
  createBanner({BannerModel? bannerModel}) async {
    try {
      // Start the loading indicator
      doUpdate(true);

      // If editing, use the passed BannerModel, else create a new one
      BannerModel newBannerModel = bannerModel ?? BannerModel();

      // If a new image is picked, upload it and update the image URL
      if (xFile != null) {
        String url = await FirebaseStorageController().uploadImageToFirebase(
            directoryName: storageBanners, uploadFile: xFile!);
        newBannerModel.image = url;
      }

      // Update the model with form data
      newBannerModel.descrition = descriptionTextEditingController.text;
      newBannerModel.navigationLink = navigationLinkTextEditingController.text;

      if (bannerModel == null) {
        // Creating a new banner
        DocumentReference documentReference = bannersCollectionReference.doc();
        newBannerModel.docId = documentReference.id;
        newBannerModel.timestamp = DateTime.now();
        newBannerModel.isActive = true;
        // Save the new banner to Firestore
        await documentReference.set(newBannerModel.toJson());
        Utility.toast("Banner created successfully.");
      } else {
        // Updating an existing banner
        newBannerModel.modifiedAt = DateTime.now();

        // Update the banner in Firestore
        await bannersCollectionReference
            .doc(newBannerModel.docId)
            .update(newBannerModel.toJson());
        Utility.toast("Banner updated successfully.");
      }

      // Reset the form fields after creation/update
      resetFields();

      // Navigate back after successful operation
      Get.back();
    } catch (e) {
      // Display error message
      Utility.toast("Failed to create or update banner: $e");
    } finally {
      // Stop the loading indicator
      doUpdate(false);
    }
  }

  // Method to reset all fields in the form
  resetFields() {
    // Clear all text fields
    descriptionTextEditingController.clear();
    navigationLinkTextEditingController.clear();
    xFile = null;
    formKey.currentState?.reset();
  }

  // Method to update the active status of a banner
  updateActiveStatus(BannerModel bannerModel, bool status) async {
    await bannersCollectionReference
        .doc(bannerModel.docId)
        .update({"isActive": status, "modifiedAt": DateTime.now()});
    Utility.toast("Banner status updated successfully.");
  }
}
