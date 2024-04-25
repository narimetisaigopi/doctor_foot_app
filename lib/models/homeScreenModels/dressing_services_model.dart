import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class DressingServicesModel {
  String image;
  String serviceNames;

  DressingServicesModel({this.image = "", this.serviceNames = ""});
}

List<DressingServicesModel> dressingServicesList = [
  DressingServicesModel(
      image: AssetsConstants.wounded_foot, serviceNames: Strings.smallText),
  DressingServicesModel(
      image: AssetsConstants.wounded_foot,
      serviceNames: Strings.moderateText),
  DressingServicesModel(
      image: AssetsConstants.wounded_foot,
      serviceNames: Strings.largeText),
  DressingServicesModel(
      image: AssetsConstants.wounded_foot,
      serviceNames: Strings.hugeText),
];
