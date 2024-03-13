import 'package:doctor_foot_app/utils/constants/assets_constants.dart';

class FootAssessmentModel{
  String? image;

  FootAssessmentModel({this.image});
}
List<FootAssessmentModel> videoscreenFaList = [
  FootAssessmentModel(image: AssetsConstants.foot_testing,),
  FootAssessmentModel(image: AssetsConstants.toe_image,)
 
 

]; 
