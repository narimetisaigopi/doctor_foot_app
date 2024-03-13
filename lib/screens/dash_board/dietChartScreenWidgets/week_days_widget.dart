import 'package:doctor_foot_app/models/dietChartModels/weekdays_model.dart';
import 'package:doctor_foot_app/screens/dash_board/dietChartScreenWidgets/days_widget.dart';
import 'package:flutter/material.dart';

class WeekDaysWidget extends StatefulWidget {
  const WeekDaysWidget({super.key});

  @override
  State<WeekDaysWidget> createState() => _WeekDaysWidgetState();
}

class _WeekDaysWidgetState extends State<WeekDaysWidget> {
  int selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.058,
      width: double.infinity,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: weekDaysList.length,
          itemBuilder: (context, index) {
            final weekDaysItem = weekDaysList[index];
            return DaysWidget(
              text: weekDaysItem.text!,
            );
          }),
    );
  }
}
