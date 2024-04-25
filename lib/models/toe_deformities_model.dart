import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class ToeDeformitiesModel {
  String image;
  String serviceNames;

  ToeDeformitiesModel({this.image = "", this.serviceNames = ""});
}

List<ToeDeformitiesModel> toeDeformitiesList = [
  ToeDeformitiesModel(
      image: AssetsConstants.home_dressing_cover_img,
      serviceNames: Strings.hammertoeText),
  ToeDeformitiesModel(
    image: AssetsConstants.well_kept_nails,
    serviceNames: Strings.clawToeText,
  ),
];
