import 'package:doctor_foot_app/screens/dash_board/dash_board_widgets/diet_plan_widget.dart';
import 'package:doctor_foot_app/screens/dash_board/dash_board_widgets/week_days_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

class DietChartScreen extends StatefulWidget {
  const DietChartScreen({super.key});

  @override
  State<DietChartScreen> createState() => _DietChartScreenState();
}

class _DietChartScreenState extends State<DietChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          title: const Text(Strings.dietChartText),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: const Column(
              children: [
                WeekDaysWidget(),
                SizedBox(
                  height: 16,
                ),
                DietPlanWidget(),
              ],
            ),
          ),
        ));
  }
}
