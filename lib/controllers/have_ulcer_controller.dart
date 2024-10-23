import 'dart:developer';

import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/ulcer/have_ulcer_model.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/screens/dash_board/treatement/ulcer/upload_ulcer_photos_guide_popup.dart';
import 'package:drfootapp/screens/dash_board/treatement/ulcer/yes/have_ulcer_upload_document_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/constants/firebase_constants.dart';

class HaveUlcerController extends GetxController {
  bool isLoading = false;
  XFile? xfile, xfile2, xfile3;
  int currentPosition = 1;
  bool haveUcler = false;

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  Future<XFile?> pickFile(int pos) async {
    currentPosition = pos;
    XFile? xFileLocal =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (currentPosition == 1) {
      xfile = xFileLocal;
    } else if (currentPosition == 2) {
      xfile2 = xFileLocal;
    } else if (currentPosition == 3) {
      xfile3 = xFileLocal;
    }
    update();
    return xFileLocal;
  }

  XFile? getImage(int position) {
    log("getImage position: $position");
    if (position == 1) {
      return xfile;
    } else if (position == 2) {
      return xfile2;
    } else if (position == 3) {
      return xfile3;
    }
    return null;
  }

  reset() {
    xfile = null;
    xfile2 = null;
    xfile3 = null;
    currentPosition = 0;
  }

  bool isAll3ImagesUploaded() {
    if (xfile != null && xfile2 != null && xfile3 != null) {
      return true;
    }
    return false;
  }

  uploadNoUlcerImages() async {
    try {
      _updateLoading(true);
      HaveUlcerModel haveUlcerModel = HaveUlcerModel();
      List images = await FirebaseStorageController().uploadImagesToFirebase(
          directoryName: storageNoUlcer,
          uploadFiles: [xfile!, xfile2!, xfile3!]);
      haveUlcerModel.docId = Utility().getCurrentUserId();
      haveUlcerModel.uid = Utility().getCurrentUserId();
      haveUlcerModel.haveUlcer = haveUcler;
      if (haveUcler) haveUlcerModel.yesImages = images;
      if (!haveUcler) haveUlcerModel.noImages = images;
      haveUlcerModel.timestamp = DateTime.now();
      await haveUlcerCollectionReference
          .doc(Utility().getCurrentUserId())
          .set(haveUlcerModel.toJson());
      Utility.toast("Uploaded successfully.");
      reset();
      Get.offAll(() => const DashBoardScreen());
    } catch (e) {
      logger(e);
      Utility.toast("Failed to upload");
    } finally {
      _updateLoading(false);
    }
  }

  haveUlcerYesUploadDocument(
      BuildContext context, UlcerDocumentType ulcerDocumentType) async {
    filePicker.FilePickerResult? result = await filePicker.FilePicker.platform
        .pickFiles(
            allowMultiple: false,
            type: filePicker.FileType.custom,
            dialogTitle: Utility.enumToString(ulcerDocumentType));

    if (ulcerDocumentType == UlcerDocumentType.dischargeSummary) {
      Utility().successAlertDialog(
          context: context,
          title: 'Upload Successful',
          description: "",
          onUploadPressed: () {
            Get.to(() => const HaveUlcerUploadDocumentScreen(
                  ulcerDocumentType: UlcerDocumentType.dischargeSummary,
                ));
          });
    } else if (ulcerDocumentType == UlcerDocumentType.consultationDocument) {
      Utility().successAlertDialog(
          context: context,
          title: 'Upload Ulcer Pictures',
          description: "",
          onUploadPressed: () {
            Get.back();
            uploadUlcerPictures();
          });
    }
  }

  uploadUlcerPictures() {
    Get.put(HaveUlcerController()).reset();
    Get.defaultDialog(title: "", content: UploadUlcerPhotosGuidePopup());
  }
}
