import 'package:doctor_foot_app/models/home_dressing/home_dressing_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDressingController extends GetxController {
  List<HomeDressingModel> homeDressingServicesAddedList = [];

  TextEditingController searchCouponCodeController = TextEditingController();
  void addOrRemoveFromList({
    required HomeDressingModel homeDressingModel,
  }) {
    bool isExisted = isServiceAdded(homeDressingModel);

    if (isExisted) {
      homeDressingServicesAddedList
          .removeWhere((item) => item.id == homeDressingModel.id);
    } else {
      homeDressingServicesAddedList.add(homeDressingModel);
    }
    update();
  }

  bool isServiceAdded(
    HomeDressingModel homeDressingModel,
  ) {
    bool isExisted = homeDressingServicesAddedList
        .where((element) => element.id == homeDressingModel.id)
        .isNotEmpty;
    return isExisted;
  }
}
