
import 'package:drfootapp/utils/constants/string_constants.dart';

class PremiumPlanModel {
  String text;
  PremiumPlanModel({this.text = ''});
}

List<PremiumPlanModel> premiumPlanList = [
 
  PremiumPlanModel(
    text: Strings.premiumPlanText1,
  ),
  PremiumPlanModel(
    text: Strings.premiumPlanText2,
  ),
  PremiumPlanModel(
    text: Strings.premiumPlanText3,
  ),
  PremiumPlanModel(
    text: Strings.premiumPlanText4,
  ),
   PremiumPlanModel(
    text: Strings.premiumPlanText5,
  ),
];