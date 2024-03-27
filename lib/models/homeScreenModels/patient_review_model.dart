import 'package:drfootapp/utils/constants/assets_constants.dart';

class PatientReviewModel {
  String patientImage;
  String patientName;
  String discription;
  String date;

  PatientReviewModel(
      {this.patientImage = "",
      this.patientName = "",
      this.discription = "",
      this.date = ""});
}

List<PatientReviewModel> patientReviewsList = [
  PatientReviewModel(
    patientImage: AssetsConstants.user_image,
    patientName: "reviewverName",
    discription: "userReviewDicriptionText",
    date: "postedDateText",
  )
];
