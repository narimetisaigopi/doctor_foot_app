import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class CheckYourFeetModel {
  String image;
  String serviceNames;

  CheckYourFeetModel({this.image = "", this.serviceNames = ""});
}

List<CheckYourFeetModel> footDeformitiesList = [
  CheckYourFeetModel(
      image: AssetsConstants.home_dressing_cover_img,
      serviceNames: Strings.flatFeetText),
  CheckYourFeetModel(
      image: AssetsConstants.well_kept_nails,
      serviceNames: Strings.bunionsText),
      CheckYourFeetModel(
      image: AssetsConstants.well_kept_nails,
      serviceNames: Strings.charcotFootText),
];
