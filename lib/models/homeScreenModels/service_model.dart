import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class ServicesModel {
  String image;
  String seiviceNames;

  ServicesModel({this.image = "", this.seiviceNames = ""});
}

List<ServicesModel> servicesList = [
  ServicesModel(
      image: AssetsConstants.foot, seiviceNames: "footUlcerText"),
  ServicesModel(
      image: AssetsConstants.speedometer,
      seiviceNames: "checkYourRiskText"),
  ServicesModel(
      image: AssetsConstants.checkup_shedule,
      seiviceNames: "checkupScheduleText"),
  ServicesModel(
      image: AssetsConstants.foot_service,
      seiviceNames: "footServiceText"),
];
