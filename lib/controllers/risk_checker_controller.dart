// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/risk_cheker_response_model.dart';
import 'package:drfootapp/models/risk_factor_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/riskfactors/risk_checker_results_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RiskCheckerController extends GetxController {
  List<RiskCheckerModel> riskFactorsModelsList = [];
  bool isLoading = false;
  bool isRiskChecked = false;
  RiskChekerResponseModel riskChekerResponseModel = RiskChekerResponseModel();
  doUpdate(bool status) {
    isLoading = status;
    update();
  }

  Future<void> fetchData() async {
    riskFactorsModelsList.clear();
    try {
      final String response = await rootBundle
          .loadString('assets/jsons/risk_factor_questionary.json');
      final List<dynamic> data = json.decode(response);

      riskFactorsModelsList =
          data.map((item) => RiskCheckerModel.fromJson(item)).toList();

      update();
    } catch (error) {
      logger("Error fetching data: $error");
    }
  }

  updateSelectedOption(RiskCheckerModel riskFactorModel,
      RiskCheckerOptionModel riskFactorOptionModel) {
    riskFactorsModelsList
        .firstWhere((element) => element.id == riskFactorModel.id)
        .selectedOption = riskFactorOptionModel;
    update();
  }

  Future<RiskChekerResponseModel> getMyRiskCheckData() async {
    QuerySnapshot querySnapshot = await riskCheckerCollectionReference
        .where("uid", isEqualTo: Utility().getCurrentUserId())
        .get();
    isRiskChecked = false;
    riskChekerResponseModel = RiskChekerResponseModel();
    if (querySnapshot.docs.isNotEmpty) {
      isRiskChecked = true;
      riskChekerResponseModel = RiskChekerResponseModel.fromMap(
          querySnapshot.docs.first.data() as Map);
    }
    update();
    return riskChekerResponseModel;
  }

  Future<void> updateDataToFirestore() async {
    try {
      doUpdate(true);
      RiskChekerResponseModel riskChekerResponseModel =
          RiskChekerResponseModel(responses: {});
      riskChekerResponseModel.uid = Utility().getCurrentUserId();
      int score = 0;
      for (var e in riskFactorsModelsList) {
        if (e.selectedOption != null) {
          riskChekerResponseModel.responses![e.question] =
              e.selectedOption?.title;
          score += e.selectedOption!.score;
        }
      }
      DocumentReference documentReference =
          riskCheckerCollectionReference.doc(riskChekerResponseModel.uid);
      riskChekerResponseModel.docId = documentReference.id;
      riskChekerResponseModel.score = score;
      riskChekerResponseModel.status = getStatusBasedOnScore(score);
      await documentReference.set(riskChekerResponseModel.toMap());
      await getMyRiskCheckData();
      Utility.toast("Submitted successfully.");
      Get.to(() => const RiskCheckerResultsScreen());
    } catch (e) {
      Utility.toast("failed to submit. $e");
      logger("updateDataToFirestore $e");
    } finally {
      doUpdate(false);
    }
  }

  String getStatusBasedOnScore(int score) {
    if (score < 16) {
      return "Mild";
    } else if (score >= 16 && score <= 30) {
      return "Moderate";
    } else {
      return "High";
    }
  }
}
