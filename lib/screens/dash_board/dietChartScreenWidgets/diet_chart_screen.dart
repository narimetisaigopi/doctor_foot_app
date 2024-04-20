import 'package:drfootapp/admin/diet/add_diet_chart_screen.dart';
import 'package:drfootapp/controllers/diet_chart_controller.dart';
import 'package:drfootapp/screens/dash_board/dietchartscreenwidgets/diet_plan_layout.dart';
import 'package:drfootapp/screens/dash_board/dietchartscreenwidgets/week_days_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietChartScreen extends StatefulWidget {
  const DietChartScreen({super.key});

  @override
  State<DietChartScreen> createState() => _DietChartScreenState();
}

class _DietChartScreenState extends State<DietChartScreen> {
  DietChartController dietChartController = Get.put(DietChartController());

  @override
  void initState() {
    dietChartController.getAllDiets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = 200;
    return GetBuilder<DietChartController>(builder: (dietChartController) {
      return Scaffold(
          backgroundColor: AppColors.whiteBgColor,
          floatingActionButton: isAdmin()
              ? FloatingActionButton(
                  onPressed: () {
                    Get.to(() => const AddDietChartScreen());
                  },
                  child: const Icon(Icons.add),
                )
              : null,
          appBar: AppBar(
            title: const Text("dietChartText").tr(),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: 40,
                    child: const WeekDaysWidget()),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 16, top: 8, right: 16, bottom: 24),
                  decoration: BoxDecoration(
                      color: AppColors.whiteBgColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 0.5, color: AppColors.primary)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height,
                        width: double.infinity,
                        child: DietPlanLayout(
                          title: Strings.morningText,
                          dietChartModelList:
                              dietChartController.dietChartModelList,
                        ),
                      ),
                      SizedBox(
                        height: height,
                        width: double.infinity,
                        child: DietPlanLayout(
                          title: Strings.afternoonText,
                          dietChartModelList:
                              dietChartController.dietChartModelList,
                        ),
                      ),
                      SizedBox(
                        height: height,
                        width: double.infinity,
                        child: DietPlanLayout(
                          title: Strings.eveningText,
                          dietChartModelList:
                              dietChartController.dietChartModelList,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ));
    });
  }
}
