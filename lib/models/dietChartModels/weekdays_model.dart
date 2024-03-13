import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class WeekDaysModel {
  String? text;
  WeekDaysModel({required this.text});
}

List<WeekDaysModel> weekDaysList = [
  WeekDaysModel(text: Strings.monday),
  WeekDaysModel(text: Strings.tuesday),
  WeekDaysModel(text: Strings.wednesday),
  WeekDaysModel(text: Strings.thursday),
  WeekDaysModel(text: Strings.friday),
  WeekDaysModel(text: Strings.saturday),
  WeekDaysModel(text: Strings.sunday),
];
