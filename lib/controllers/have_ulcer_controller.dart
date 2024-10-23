import 'dart:developer';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/ulcer/have_ulcer_model.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/screens/dash_board/treatement/ulcer/images/upload_ulcer_photos_guide_popup.dart';
import 'package:drfootapp/screens/dash_board/treatement/ulcer/yes/have_ulcer_upload_document_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
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

  List getPickedImages() {
    List list = [];
    if (xfile != null) list.add(xfile);
    if (xfile2 != null) list.add(xfile2);
    if (xfile3 != null) list.add(xfile3);
    return list;
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

  uploadHaveUlcerImages() async {
    try {
      _updateLoading(true);
      HaveUlcerModel haveUlcerModel = HaveUlcerModel();
      List images = await FirebaseStorageController().uploadImagesToFirebase(
          directoryName: haveUcler ? storageYesUlcer : storageNoUlcer,
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
            type: filePicker.FileType.any,
            dialogTitle: Utility.enumToString(ulcerDocumentType));

    Utility.stateAlertDialog(
        // ignore: use_build_context_synchronously
        context: context,
        title: 'Upload Successful',
        description: "",
        buttonText: ulcerDocumentType == UlcerDocumentType.dischargeSummary
            ? "Next"
            : "Upload Ulcer Pictures",
        image: AssetsConstants.done_image,
        color: AppColors.successColor,
        onDone: () {
          Get.back();
          if (ulcerDocumentType == UlcerDocumentType.dischargeSummary) {
            Get.to(
                () => const HaveUlcerUploadDocumentScreen(
                      ulcerDocumentType: UlcerDocumentType.consultationDocument,
                    ),
                preventDuplicates: false);
          } else if (ulcerDocumentType ==
              UlcerDocumentType.consultationDocument) {
            uploadUlcerPictures();
          }
        });
  }

  uploadUlcerPictures() {
    Get.put(HaveUlcerController()).reset();
    Get.defaultDialog(title: "", content: UploadUlcerPhotosGuidePopup());
  }
}
