import 'package:drfootapp/utils/constants/assets_constants.dart';

class FootAssessmentModel {
  String image;

  FootAssessmentModel({this.image = ""});
}

List<FootAssessmentModel> videoScreenFaList = [
  FootAssessmentModel(
    image: AssetsConstants.foot_testing,
  ),
  FootAssessmentModel(
    image: AssetsConstants.toe_image,
  )
];
