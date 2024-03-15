import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class PremiumPlanModel {
  String text;
  PremiumPlanModel({this.text = ''});
}

List<PremiumPlanModel> premiumPlanList = [
  PremiumPlanModel(
    text: Strings.weeklyUmText,
  ),
  PremiumPlanModel(
    text: Strings.expertsText,
  ),
  PremiumPlanModel(
    text: Strings.expertsText,
  ),
  PremiumPlanModel(
    text: Strings.expertsText,
  ),
  PremiumPlanModel(
    text: Strings.expertsText,
  ),
];