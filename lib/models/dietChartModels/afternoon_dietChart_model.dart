import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class AfternoonDietChartModel {
  String? image;
  String? textTime;
  AfternoonDietChartModel({this.image, this.textTime});
}

List<AfternoonDietChartModel> afternoonDietList = [
  AfternoonDietChartModel(
      image: AssetsConstants.diet_image, textTime: Strings.earlyMorning),
];
