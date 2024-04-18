// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:drfootapp/models/risk_factor_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RiskFactorController extends GetxController {
  List<RiskFactorModel> riskFactorsModelsList = [];

  Future<void> fetchData() async {
    riskFactorsModelsList.clear();
    try {
      final String response = await rootBundle
          .loadString('assets/jsons/risk_factor_questionary.json');
      final List<dynamic> data = json.decode(response);

      riskFactorsModelsList =
          data.map((item) => RiskFactorModel.fromJson(item)).toList();

      update();
    } catch (error) {
      logger("Error fetching data: $error");
    }
  }

  updateSelectedOption(RiskFactorModel riskFactorModel,
      RiskFactorOptionModel riskFactorOptionModel) {
    riskFactorsModelsList
        .firstWhere((element) => element.id == riskFactorModel.id)
        .selectedOption = riskFactorOptionModel;
    update();
  }
}
