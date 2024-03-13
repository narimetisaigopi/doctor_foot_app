import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class EviningDietChartModel {
  String? image;
  String? textTime;
  EviningDietChartModel({this.image, this.textTime});
}

List<EviningDietChartModel> eviningDietList = [
  EviningDietChartModel(
      image: AssetsConstants.diet_image, textTime: Strings.earlyMorning),
  EviningDietChartModel(
      image: AssetsConstants.diet_image, textTime: Strings.earlyMorning),
  EviningDietChartModel(
      image: AssetsConstants.diet_image, textTime: Strings.earlyMorning),
];
