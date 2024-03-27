// ignore_for_file: file_names, non_constant_identifier_names

import 'package:drfootapp/utils/constants/assets_constants.dart';

class EviningDietChartModel {
  String image;
  String textTime;
  EviningDietChartModel.EveningDietChartModel(
      {this.image = "", this.textTime = ""});
}

List<EviningDietChartModel> eviningDietList = [
  EviningDietChartModel.EveningDietChartModel(
      image: AssetsConstants.diet_image, textTime: "earlyMorning"),
  EviningDietChartModel.EveningDietChartModel(
      image: AssetsConstants.diet_image, textTime: "earlyMorning"),
  EviningDietChartModel.EveningDietChartModel(
      image: AssetsConstants.diet_image, textTime: "earlyMorning"),
];
