import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class CheckYourFeetModel {
  String image;
  String serviceNames;

  CheckYourFeetModel({this.image = "", this.serviceNames = ""});
}

List<CheckYourFeetModel> footDeformitiesList = [
  CheckYourFeetModel(
    image: AssetsConstants.flat_feet,
    serviceNames: Strings.flatFeetText,
  ),
  CheckYourFeetModel(
    image: AssetsConstants.buniouns,
    serviceNames: Strings.bunionsText,
  ),
  CheckYourFeetModel(
    image: AssetsConstants.charchot_feet,
    serviceNames: Strings.charcotFootText,
  ),
];
List<CheckYourFeetModel> footPainList = [
  CheckYourFeetModel(
    image: AssetsConstants.foot_pain_one,
    serviceNames: Strings.flatFeetText,
  ),
  CheckYourFeetModel(
    image: AssetsConstants.foot_pain_two,
    serviceNames: Strings.bunionsText,
  ),
  CheckYourFeetModel(
    image: AssetsConstants.foot_pain_three,
    serviceNames: Strings.charcotFootText,
  ),
];
