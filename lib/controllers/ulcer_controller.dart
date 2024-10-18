import 'dart:developer';

import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/ulcer/have_no_ulcer_model.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/constants/firebase_constants.dart';

class UlcerController extends GetxController {
  bool isLoading = false;
  XFile? xfile, xfile2, xfile3;
  int currentPosition = 1;

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
      HaveNoUlcerModel haveNoUlcerModel = HaveNoUlcerModel();
      List images = await FirebaseStorageController().uploadImagesToFirebase(
          directoryName: storageNoUlcer,
          uploadFiles: [xfile!, xfile2!, xfile3!]);
      haveNoUlcerModel.docId = Utility().getCurrentUserId();
      haveNoUlcerModel.uid = Utility().getCurrentUserId();
      haveNoUlcerModel.images = images;
      haveNoUlcerModel.timestamp = DateTime.now();
      await noUlcerCollectionReference
          .doc(Utility().getCurrentUserId())
          .set(haveNoUlcerModel.toJson());
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
}
