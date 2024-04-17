import 'package:drfootapp/screens/dash_board/dietChartScreenWidgets/diet_plan_widget.dart';
import 'package:drfootapp/screens/dash_board/dietChartScreenWidgets/week_days_widget.dart';
import 'package:drfootapp/screens/dash_board/home_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          title: const Text("dietChartText").tr(),
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
