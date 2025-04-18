import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DietChartController extends GetxController {
  TextEditingController slotTitleController = TextEditingController();
  TextEditingController dietDescriptionController = TextEditingController();
  List weeksList = [];
  bool isDiaryProduct = false;
  bool isLoading = false;
  XFile? xFile;
  DietType? dietType;

  List<DietChartModel> dietChartModelList = [];

  @override
  void onInit() {
    selectedDietWeek = Utility.getCurrentWeekDayName();
    super.onInit();
  }

  // Method to pick an image file
  Future<void> pickFile() async {
    xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  String selectedDietWeek = "";

  onWeekSelection(String week) {
    selectedDietWeek = week;
    update();
  }

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  getAllDietsFromServer() async {
    if (dietChartModelList.isNotEmpty) {
      return;
    }
    QuerySnapshot querySnapshot = await dietCollectionReference.get();
    dietChartModelList = querySnapshot.docs
        .map((e) => DietChartModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    update();
  }

  List<DietChartModel> getDietBasedOnFilter(String timeSlot) {
    List<DietChartModel> list = dietChartModelList
        .where((e) => e.weeksList.contains(selectedDietWeek))
        .toList();
    if (timeSlot == Strings.morningNoonText) {
      list = list
          .where((e) =>
              e.slotTitle == earlyMorning ||
              e.slotTitle == breakfast ||
              e.slotTitle == midMorningSnack)
          .toList();
    } else if (timeSlot == Strings.afternoonEveningText) {
      list = list
          .where((e) => e.slotTitle == lunch || e.slotTitle == eveningSnack)
          .toList();
    } else if (timeSlot == Strings.eveningBedTimeText) {
      list = list
          .where((e) => e.slotTitle == dinner || e.slotTitle == beforeBedtime)
          .toList();
    }
    return list;
  }

  addNewDiet({DietChartModel? dietChartModel}) async {
    try {
      _updateLoading(true);
      DietChartModel newDietChartModel = dietChartModel ?? DietChartModel();
      if (xFile != null) {
        String imageUrl = await Get.put(FirebaseStorageController())
            .uploadImageToFirebase(
                directoryName: storageDietChart, uploadFile: xFile!);
        newDietChartModel.image = imageUrl;
      }
      newDietChartModel.slotTitle = slotTitleController.text;
      newDietChartModel.description = dietDescriptionController.text;
      newDietChartModel.weeksList = weeksList;
      newDietChartModel.isDiaryProduct = isDiaryProduct;
      newDietChartModel.dietType = dietType!;
      if (dietChartModel == null) {
        DocumentReference documentReference = dietCollectionReference.doc();
        newDietChartModel.docId = documentReference.id;
        await documentReference.set(newDietChartModel.toMap());
        Utility.toast("Added sucessfully.");
      } else {
        newDietChartModel.modifiedAt = DateTime.now();
        // Update the doctor in Firestore
        await dietCollectionReference
            .doc(newDietChartModel.docId)
            .update(newDietChartModel.toMap());
        Utility.toast("Updated successfully.");
      }

      dietChartModelList.clear();
      getAllDietsFromServer();
      Get.back();
      // resetFields();
    } catch (e) {
      logger(e);
      Utility.toast("Failed to update ${e}");
    } finally {
      _updateLoading(false);
    }
  }

  resetFields() {
    dietDescriptionController.clear();
    xFile = null;
    isDiaryProduct = false;
    dietType = null;
    slotTitleController.clear();
  }
}
