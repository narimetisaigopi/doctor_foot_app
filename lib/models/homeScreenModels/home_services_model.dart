import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class HomeServicesModel {
  String image;
  String serviceNames;

  HomeServicesModel({this.image = "", this.serviceNames = ""});
}

List<HomeServicesModel> footServicesList = [
  HomeServicesModel(
      image: AssetsConstants.home_dressing_cover_img, serviceNames: Strings.dressingServicesText),
  HomeServicesModel(
      image: AssetsConstants.well_kept_nails,
      serviceNames: Strings.nailTrimmingText),
  HomeServicesModel(
      image: AssetsConstants.wounded_foot,
      serviceNames: Strings.footCleansingText),
  HomeServicesModel(
      image: AssetsConstants.diabetic_foot_wear,
      serviceNames: Strings.footwearText),
];
