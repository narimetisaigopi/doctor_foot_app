import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class FreePlanModel {
  String text;
  FreePlanModel({this.text = ''});
}

List<FreePlanModel> freePlanList = [
  FreePlanModel(
    text: Strings.weeklyUmText,
  ),
  FreePlanModel(
    text: Strings.expertsText,
  ),
  FreePlanModel(
    text: Strings.expertsText,
  ),
];
