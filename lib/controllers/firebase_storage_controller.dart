import 'dart:io';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageController extends GetxController {
  Future<String> uploadImageToFirebase(
      {required String directoryName, required File uploadFile}) async {
    String filePath = '$directoryName/${uploadFile.path.split("/").last}';
    File file = File(uploadFile.path);
    String url = "";
    try {
      TaskSnapshot uploadTask = await firebase_storage.FirebaseStorage.instance
          .ref(filePath)
          .putFile(file);
      url = await uploadTask.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      logger(e.toString());
    } catch (e, stack) {
      logger("uploadImageToFirebase ${e.toString()}");
      logger("uploadImageToFirebase ${stack.toString()}");
    } finally {}
    return url;
  }
}
