import 'package:drfootapp/utils/constants/assets_constants.dart';

class DailyFeaturedModel {
  String image;
  String healthIssue;
  DailyFeaturedModel({this.image = "", this.healthIssue = ""});
}

List<DailyFeaturedModel> videoscreenDfList = [
  DailyFeaturedModel(
      image: AssetsConstants.diabatic_image, healthIssue: "diabetiesText"),
  DailyFeaturedModel(
      image: AssetsConstants.diabatic_image, healthIssue: "diabetiesText"),
  DailyFeaturedModel(
      image: AssetsConstants.diabatic_image, healthIssue: "diabetiesText"),
  DailyFeaturedModel(
      image: AssetsConstants.diabatic_image, healthIssue: "diabetiesText"),
];
