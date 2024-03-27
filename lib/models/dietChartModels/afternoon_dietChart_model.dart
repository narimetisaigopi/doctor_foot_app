// ignore_for_file: file_names

import 'package:drfootapp/utils/constants/assets_constants.dart';

class AfternoonDietChartModel {
  String image;
  String textTime;
  AfternoonDietChartModel({this.image = "", this.textTime = ""});
}

List<AfternoonDietChartModel> afternoonDietList = [
  AfternoonDietChartModel(
      image: AssetsConstants.diet_image, textTime: "earlyMorning"),
];
