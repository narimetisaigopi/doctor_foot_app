import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/dietChartModels/diet_chart_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietChartController extends GetxController {
  TextEditingController weekController = TextEditingController();
  TextEditingController slotTitleController = TextEditingController();
  TextEditingController slotTimingController = TextEditingController();
  TextEditingController dietImageController = TextEditingController();
  TextEditingController dietTypeController = TextEditingController();
  TextEditingController dietDescriptionController = TextEditingController();
  bool isLoading = false;

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  getAllDiets() async {
    QuerySnapshot querySnapshot = await dietCollectionReference.get();
    return querySnapshot.docs
        .map((e) => DietChartModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  addNewDiet() async {
    _updateLoading(true);
    DietChartModel dietChartModel = DietChartModel();
    dietChartModel.slotTitle = slotTitleController.text;
    dietChartModel.slotTiming = slotTitleController.text;
    dietChartModel.dietDescription = dietDescriptionController.text;
    dietChartModel.week = weekController.text;
    dietChartModel.dietType = dietTypeController.text;
    dietChartModel.dietImage = dietImageController.text;
    DocumentReference documentReference = dietCollectionReference.doc();
    dietChartModel.docId = documentReference.id;
    await documentReference.set(dietChartModel.toMap());
    _updateLoading(false);
    Utility.toast("Added sucessfully.");
  }

  addDiet() async {}
}
