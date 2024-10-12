import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/article_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';

class ArticlesController extends GetxController {
  XFile? xFile;
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();

  HtmlEditorController htmlEditorController = HtmlEditorController();

  doUpdate(bool status) {
    isLoading = status;
    update();
  }

  Future<void> pickFile() async {
    xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  createArticle() async {
    try {
      doUpdate(true);
      ArticleModel articleModel = ArticleModel();
      if (xFile != null) {
        String url = await FirebaseStorageController().uploadImageToFirebase(
            directoryName: storageArticlesBlogs, uploadFile: xFile!);
        articleModel.image = url;
      }

      articleModel.title = titleTextEditingController.text;
      articleModel.description = await htmlEditorController.getText();
      DocumentReference documentReference =
          articlesAndBlogsCollectionReference.doc();
      articleModel.uid = documentReference.id;
      articleModel.timestamp = DateTime.now();
      articleModel.isActive = true;
      await documentReference.set(articleModel.toJson());
      Utility.toast("Posted successfully.");
    } catch (e) {
      Utility.toast("Failed to create $e");
    } finally {
      doUpdate(false);
    }
  }
}
