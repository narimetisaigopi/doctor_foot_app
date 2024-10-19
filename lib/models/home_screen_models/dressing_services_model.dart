import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class DressingServicesModel {
  String image;
  String serviceNames;

  DressingServicesModel({this.image = "", this.serviceNames = ""});
}

List<DressingServicesModel> dressingServicesList = [
  DressingServicesModel(
      image: AssetsConstants.small, serviceNames: Strings.smallText),
  DressingServicesModel(
      image: AssetsConstants.moderate_image,
      serviceNames: Strings.moderateText),
  DressingServicesModel(
      image: AssetsConstants.large, serviceNames: Strings.largeText),
  DressingServicesModel(
      image: AssetsConstants.huge, serviceNames: Strings.hugeText),
];
