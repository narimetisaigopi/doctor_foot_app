import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class FootScreeningModel {
  String image;
  String serviceNames;

  FootScreeningModel({this.image = "", this.serviceNames = ""});
}

List<FootScreeningModel> footScreeningServicesList = [
  FootScreeningModel(
      image: AssetsConstants.pulse_examination_image,
      serviceNames: Strings.pulseExamination),
  FootScreeningModel(
      image: AssetsConstants.abi_tbi_image, serviceNames: Strings.abiTbi),
  FootScreeningModel(
      image: AssetsConstants.neuropathy_image,
      serviceNames: Strings.neuropathyAssessment),
  FootScreeningModel(
    image: AssetsConstants.foot_presser_image,
    serviceNames: Strings.footPressureAssessment,
  ),
];
