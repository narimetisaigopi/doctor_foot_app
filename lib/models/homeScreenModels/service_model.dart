import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class ServicesModel {
  String image;
  String serviceNames;

  ServicesModel({this.image = "", this.serviceNames = ""});
}

List<ServicesModel> servicesList = [
  ServicesModel(
      image: AssetsConstants.foot, serviceNames: Strings.haveulcerText),
  ServicesModel(
      image: AssetsConstants.speedometer,
      serviceNames: Strings.riskcheckerText),
  ServicesModel(
      image: AssetsConstants.checkup_shedule,
      serviceNames: Strings.checkupScheduleText),
  ServicesModel(
      image: AssetsConstants.foot_service,
      serviceNames: Strings.footServiceText),
];
