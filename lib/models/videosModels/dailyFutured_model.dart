import 'package:drfootapp/utils/constants/assets_constants.dart';

class DailyFeaturedModel {
  String image;
  String healthIssue;
  DailyFeaturedModel({this.image = "", this.healthIssue = ""});
}

List<DailyFeaturedModel> videoscreenDfList = [
  DailyFeaturedModel(
      image: AssetsConstants.diabete_check_meter, healthIssue: "diabetiesText"),
  DailyFeaturedModel(
      image: AssetsConstants.diabete_check_meter, healthIssue: "diabetiesText"),
  DailyFeaturedModel(
      image: AssetsConstants.diabete_check_meter, healthIssue: "diabetiesText"),
  DailyFeaturedModel(
      image: AssetsConstants.diabete_check_meter, healthIssue: "diabetiesText"),
];
