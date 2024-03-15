import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class PatientReviewModel {
  String patientImage;
  String patientName;
  String discription;
  String date;

  PatientReviewModel(
      {this.patientImage = "", this.patientName = "", this.discription = "", this.date= ""});
}

List<PatientReviewModel> patientReviewsList = [
  PatientReviewModel(
    patientImage: AssetsConstants.user_image,
    patientName: Strings.reviewverName,
    discription: Strings.userReviewDicriptionText,
    date: Strings.postedDateText,
  )
];
