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
      {required String directoryName, required XFile uploadFile}) async {
    String filePath =
        '$directoryName/${DateTime.now().microsecondsSinceEpoch}__${pppp.basename(uploadFile.path)}';
    File file = File(uploadFile.path);
    String url = "";
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
      url = await uploadTask.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      logger(e.toString());
    } catch (e, stack) {
      logger("uploadImageToFirebase ${e.toString()}");
      logger("uploadImageToFirebase ${stack.toString()}");
    } finally {}
    return url;
  }

  deleteImage(String url) async {
    if (url.isNotEmpty) {
      await firebase_storage.FirebaseStorage.instance.refFromURL(url).delete();
    }
  }
}
