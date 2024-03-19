import 'package:doctor_foot_app/utils/constants/assets_constants.dart';

class ServicesModel {
  String image;
  String serviceNames;

  ServicesModel({this.image = "", this.serviceNames = ""});
}

List<ServicesModel> servicesList = [
  ServicesModel(image: AssetsConstants.foot, serviceNames: "footUlcer_text"),
  ServicesModel(
      image: AssetsConstants.speedometer, serviceNames: "checkYourRisk_text"),
      image: AssetsConstants.foot, seiviceNames: "footUlcerText"),
  ServicesModel(
      image: AssetsConstants.speedometer,
      seiviceNames: "checkYourRiskText"),
  ServicesModel(
      image: AssetsConstants.checkup_shedule,
      serviceNames: "checkup_schedule_text"),
      seiviceNames: "checkupScheduleText"),
  ServicesModel(
      image: AssetsConstants.foot_service, serviceNames: "foot_service_text"),
      image: AssetsConstants.foot_service,
      seiviceNames: "footServiceText"),
];
