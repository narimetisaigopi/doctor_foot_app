
import 'package:drfootapp/utils/constants/string_constants.dart';

class FreePlanModel {
  String text;
  FreePlanModel({this.text = ''});
}

List<FreePlanModel> freePlanList = [
  FreePlanModel(
    text: Strings.weeklyUmText,
  ),
  FreePlanModel(
    text: Strings.freePlanText1,
  ),
  FreePlanModel(
    text: Strings.freePlanText2,
  ),
];
