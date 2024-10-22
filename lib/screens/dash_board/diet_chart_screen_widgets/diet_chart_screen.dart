import 'package:drfootapp/admin/diet/add_diet_chart_screen.dart';
import 'package:drfootapp/controllers/diet_chart_controller.dart';
import 'package:drfootapp/screens/dash_board/diet_chart_screen_widgets/diet_plan_layout.dart';
import 'package:drfootapp/screens/dash_board/diet_chart_screen_widgets/week_days_widget.dart';
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
    dietChartController.getAllDietsFromServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = 180;
    return GetBuilder<DietChartController>(builder: (dietChartController) {
      return Scaffold(
          backgroundColor: AppColors.secondary,
          floatingActionButton: Utility.isAdmin()
              ? FloatingActionButton(
                  onPressed: () {
                    Get.to(() => const AddDietChartScreen());
                  },
                  child: const Icon(Icons.add),
                )
              : null,
          appBar: AppBar(
            backgroundColor: AppColors.primaryBlue,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.whiteBgColor,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: const Text(
              "dietChartText",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteBgColor,
              ),
            ).tr(),
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
                      border: Border.all(
                        width: 0.5,
                        color: AppColors.primaryBlue,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height,
                          width: double.infinity,
                          child: DietPlanLayout(
                            title: Strings.morningNoonText,
                            dietChartModelList:
                                dietChartController
                                .getDietBasedOnFilter(Strings.morningNoonText),
                          ),
                        ),
                        SizedBox(
                          height: height,
                          width: double.infinity,
                          child: DietPlanLayout(
                            title: Strings.afternoonEveningText,
                            dietChartModelList:
                                dietChartController.getDietBasedOnFilter(
                                    Strings.afternoonEveningText),
                          ),
                        ),
                        SizedBox(
                          height: height,
                          width: double.infinity,
                          child: DietPlanLayout(
                            title: Strings.eveningBedTimeText,
                            dietChartModelList:
                                dietChartController.getDietBasedOnFilter(
                                    Strings.eveningBedTimeText),
                          ),
                        ),
                      ],
                    ),
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
