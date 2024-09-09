import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class CheckYourFeetModel {
  String image;
  String serviceNames;

  CheckYourFeetModel({this.image = "", this.serviceNames = ""});
}

List<CheckYourFeetModel> checkYourFeetList = [
  CheckYourFeetModel(
      image: AssetsConstants.skin_and_nail, serviceNames: Strings.skinNailText),
  CheckYourFeetModel(
      image: AssetsConstants.toe_deformties,
      serviceNames: Strings.toeDeformitiesText),
  CheckYourFeetModel(
      image: AssetsConstants.foot_pain,
      serviceNames: Strings.footDeformitiesText),
  CheckYourFeetModel(
      image: AssetsConstants.foot_deformities,
      serviceNames: Strings.footPainText),
  CheckYourFeetModel(
      image: AssetsConstants.sports_injuries,
      serviceNames: Strings.sportsInjuriesText),
  CheckYourFeetModel(
      image: AssetsConstants.foot_and_anckle,
      serviceNames: Strings.footAnkleArthritisText),
];
