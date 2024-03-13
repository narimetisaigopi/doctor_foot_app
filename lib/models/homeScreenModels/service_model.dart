import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class ServicesModel {
  String? image;
  String? seiviceNames;

  ServicesModel({this.image, this.seiviceNames});
}

List<ServicesModel> servicesList = [
  ServicesModel(
      image: AssetsConstants.foot, seiviceNames: Strings.footUlcer_text),
  ServicesModel(
      image: AssetsConstants.speedometer,
      seiviceNames: Strings.checkYourRisk_text),
  ServicesModel(
      image: AssetsConstants.checkup_shedule,
      seiviceNames: Strings.checkup_schedule_text),
  ServicesModel(
      image: AssetsConstants.foot_service,
      seiviceNames: Strings.foot_service_text),
];
