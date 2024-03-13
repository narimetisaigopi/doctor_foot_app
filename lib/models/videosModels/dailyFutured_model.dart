import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class DailyFeaturedModel {
  String? image;
  String? healthIssue;
  DailyFeaturedModel({this.image,this.healthIssue});
}

List<DailyFeaturedModel> videoscreenDfList = [
  DailyFeaturedModel(image: AssetsConstants.diabete_check_meter,healthIssue: Strings.diabetiesText),
  DailyFeaturedModel(image: AssetsConstants.diabete_check_meter,healthIssue: Strings.diabetiesText),
  DailyFeaturedModel(image: AssetsConstants.diabete_check_meter,healthIssue: Strings.diabetiesText),
  DailyFeaturedModel(image: AssetsConstants.diabete_check_meter,healthIssue: Strings.diabetiesText),

];
