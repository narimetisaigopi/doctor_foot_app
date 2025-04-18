import 'dart:io';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as pppp;

class FirebaseStorageController extends GetxController {
  Future<String> uploadImageToFirebase(
      {required String directoryName,
      String fileName = "",
      required XFile uploadFile}) async {
    List<String> urls = await uploadImagesToFirebase(
        directoryName: directoryName,
        filesNamesList: fileName.isNotEmpty ? [fileName] : [],
        uploadFiles: [uploadFile]);
    if (urls.isNotEmpty) {
      return urls.first;
    }
    return "";
  }

  Future<List<String>> uploadImagesToFirebase(
      {required String directoryName,
      List filesNamesList = const [],
      required List<XFile> uploadFiles}) async {
    List<String> urls = [];
    for (int i = 0; i < uploadFiles.length; i++) {
      XFile uploadFile = uploadFiles[i];
      String fileName = ""; // Get name from the filesNamesList
      if (filesNamesList.isNotEmpty) {
        String fileExtension = pppp.extension(uploadFile.path);
        fileName = "${filesNamesList[i]}.$fileExtension";
      } else {
        fileName =
            "${DateTime.now().microsecondsSinceEpoch}__${pppp.basename(uploadFile.path)}";
      }

      String filePath = '$directoryName/$fileName';
      File file = File(uploadFile.path);
      try {
        late TaskSnapshot uploadTask;
        if (kIsWeb) {
          Uint8List uint8list = await uploadFile.readAsBytes();
          uploadTask = await firebase_storage.FirebaseStorage.instance
              .ref(filePath)
              .putData(uint8list);
        } else {
          uploadTask = await firebase_storage.FirebaseStorage.instance
              .ref(filePath)
              .putFile(file);
        }
        String url = await uploadTask.ref.getDownloadURL();
        urls.add(url);
      } on FirebaseException catch (e) {
        logger(e.toString());
      } catch (e, stack) {
        logger("uploadImageToFirebase ${e.toString()}");
        logger("uploadImageToFirebase ${stack.toString()}");
      } finally {}
    }
    return urls;
  }

  deleteImage(String url) async {
    if (url.isNotEmpty) {
      await firebase_storage.FirebaseStorage.instance.refFromURL(url).delete();
    }
  }
}
