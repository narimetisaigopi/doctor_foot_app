import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class ServicesModel {
  String image;
  String serviceNames;

  ServicesModel({this.image = "", this.serviceNames = ""});
}

List<ServicesModel> servicesList = [
  ServicesModel(
      image: AssetsConstants.consult_doctor,
      serviceNames: Strings.consultYourDoctor),
  ServicesModel(
      image: AssetsConstants.online_consultation,
      serviceNames: Strings.onlineConsultation),
  ServicesModel(
      image: AssetsConstants.foot_screening_services,
      serviceNames: Strings.footScreeningServices),
  ServicesModel(
      image: AssetsConstants.dressing_at_home,
      serviceNames: Strings.dressingAtHome),
  ServicesModel(
      image: AssetsConstants.foot_cleansing,
      serviceNames: Strings.footCleaning),
  ServicesModel(
      image: AssetsConstants.nail_trimming, serviceNames: Strings.nailTrimming),
  ServicesModel(
      image: AssetsConstants.foot_wear, serviceNames: Strings.footWear),
  ServicesModel(
      image: AssetsConstants.foot_products, serviceNames: Strings.footProducts),
];
