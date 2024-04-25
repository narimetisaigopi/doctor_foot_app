import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class FootServicesModel {
  String image;
  String serviceNames;

  FootServicesModel({this.image = "", this.serviceNames = ""});
}

List<FootServicesModel> footServicesList = [
  FootServicesModel(
      image: AssetsConstants.home_dressing_cover_img, serviceNames: Strings.dressingServicesText),
  FootServicesModel(
      image: AssetsConstants.well_kept_nails,
      serviceNames: Strings.nailTrimmingText),
  FootServicesModel(
      image: AssetsConstants.wounded_foot,
      serviceNames: Strings.footCleansingText),
  FootServicesModel(
      image: AssetsConstants.foot_service,
      serviceNames: Strings.footwearText),
];
