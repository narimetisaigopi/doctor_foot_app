import 'package:doctor_foot_app/models/home_dressing/home_dressing_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDressingController extends GetxController {
  List<HomeDressingModel> homeDressingServicesAddedList = [];

  TextEditingController searchCouponCodeController = TextEditingController();
  void addOrRemoveFromList(
      {HomeDressingModel? homeDressingModel, bool isAdded = false}) {
    homeDressingServicesAddedList
        .where((element) => element.id == homeDressingModel!.id);
    // .any((item) => item.id == homeDressingModel!.id);

    //  homeDressingModel!.isAdded = isAdded;

    if (isAdded) {
      homeDressingServicesAddedList
          .removeWhere((item) => item.id == homeDressingModel!.id);
    } else {
      homeDressingServicesAddedList.add(homeDressingModel!);
    }
    update();
  }

  // void addOrRemoveFromList(HomeDressingModel homeDressingModel, bool isAdded) {

  //   if (homeDressingServicesAddedList.contains(homeDressingModel.id) ==
  //       homeDressingModel.id) {
  //     homeDressingServicesAddedList.remove(homeDressingModel);
  //     print(homeDressingServicesAddedList.length);
  //   } else {
  //     homeDressingServicesAddedList.add(homeDressingModel);
  //   }
  //   // if (homeDressingModel.isAdded) {
  //   //   homeDressingServicesAddedList.add(homeDressingModel);
  //   // } else {
  //   //   homeDressingServicesAddedList.remove(homeDressingModel);
  //   // }

  //   update();
  // }
}
