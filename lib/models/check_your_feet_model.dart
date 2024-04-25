import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class CheckYourFeetModel {
  String image;
  String serviceNames;

  CheckYourFeetModel({this.image = "", this.serviceNames = ""});
}

List<CheckYourFeetModel> checkYourFeetList = [
  CheckYourFeetModel(
      image: AssetsConstants.home_dressing_cover_img,
      serviceNames: Strings.skinNailText),
  CheckYourFeetModel(
      image: AssetsConstants.well_kept_nails,
      serviceNames: Strings.toeDeformitiesText),
  CheckYourFeetModel(
      image: AssetsConstants.wounded_foot,
      serviceNames: Strings.footDeformitiesText),
  CheckYourFeetModel(
      image: AssetsConstants.foot_service, serviceNames: Strings.footPainText),
  CheckYourFeetModel(
      image: AssetsConstants.foot_service, serviceNames: Strings.sportsInjuriesText),
  CheckYourFeetModel(
      image: AssetsConstants.foot_service, serviceNames: Strings.footAnkleArthritisText),
];
