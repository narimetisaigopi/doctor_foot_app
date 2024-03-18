import 'package:doctor_foot_app/models/home_dressing/home_dressing_model.dart';
import 'package:doctor_foot_app/screens/home_dressing_services/home_dressing_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDressingController extends GetxController {
  Set<double> addedIds = {};
  List<HomeDressingModel> homeDressingServicesAddedList = [];
  TextEditingController searchCouponCodeController = TextEditingController();

  void addOrRemoveFromList(HomeDressingModel homeDressingModel, bool isAdded) {
    isAdded = homeDressingModel.isAdded = !homeDressingModel.isAdded;

    if (homeDressingModel.isAdded) {
      homeDressingServicesAddedList.add(homeDressingModel);
    } else {
      homeDressingServicesAddedList.remove(homeDressingModel);
    }
    update();
  }
}
