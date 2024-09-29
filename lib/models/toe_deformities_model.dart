import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class ToeDeformitiesModel {
  String image;
  String serviceNames;

  ToeDeformitiesModel({this.image = "", this.serviceNames = ""});
}

List<ToeDeformitiesModel> toeDeformitiesList = [
  ToeDeformitiesModel(
    image: AssetsConstants.hammer_toe,
    serviceNames: Strings.hammertoeText,
  ),
  ToeDeformitiesModel(
    image: AssetsConstants.claw_toe,
    serviceNames: Strings.clawToeText,
  ),
];
