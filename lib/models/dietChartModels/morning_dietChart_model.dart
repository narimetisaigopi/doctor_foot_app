import 'package:doctor_foot_app/utils/constants/assets_constants.dart';

class MorningDietChartModel {
  String image;
  String textTime;
  MorningDietChartModel({this.image ="", this.textTime = ""});
}

List<MorningDietChartModel> morningDietList = [
  MorningDietChartModel(
      image: AssetsConstants.diet_image, textTime: "earlyMorning"),
  MorningDietChartModel(
      image: AssetsConstants.diet_image, textTime: "earlyMorning"),
  MorningDietChartModel(
      image: AssetsConstants.diet_image, textTime: "earlyMorning"),
];
