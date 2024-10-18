import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/controllers/ulcer_monitoring_controller.dart';
import 'package:drfootapp/models/ulcer_monitor_models/ulcer_monitoring_plan_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ulcer_monitor_widgets/plan_detail_screen.dart';
import 'ulcer_monitor_widgets/ulcer_monitoring_widget.dart';

class UlcerMonitoringScreen extends StatefulWidget {
  const UlcerMonitoringScreen({super.key});

  @override
  State<UlcerMonitoringScreen> createState() => _UlcerMonitoringScreenState();
}

class _UlcerMonitoringScreenState extends State<UlcerMonitoringScreen> {
  UlcerMonitoringController ulcerMonitoringController =
      Get.put(UlcerMonitoringController());
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UlcerMonitoringController>(
        builder: (ulcerMonitoringController) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              color: AppColors.whiteBgColor,
            ),
          ),
          backgroundColor: AppColors.primaryBlue,
          title: const Text(
            "ulcerMonitorText",
            style: TextStyle(
                color: AppColors.whiteBgColor,
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ).tr(),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
          color: AppColors.secondary,
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 20,
                      );
                    },
                    shrinkWrap: false,
                    itemCount: ulcerMonitoringController.ulcerPlansList.length,
                    itemBuilder: (ctx, index) {
                      UlcerMonitoringPlanModel ulcerMonitoringPlanModel =
                          ulcerMonitoringController.ulcerPlansList[index];
                      return UlcerMonitoringWidget(
                        ulcerMonitoringPlanModel: ulcerMonitoringPlanModel,
                        isSelected: ulcerMonitoringPlanModel.planTitle ==
                            ulcerMonitoringController
                                .selectedUlcerModel.planTitle,
                        isCurrentPlan: loginUserModel.ulcerMonitoringPlan ==
                            ulcerMonitoringPlanModel.id,
                        onPress: () {
                          Utility.myBottomSheet(context,
                              heightFactor: 0.7,
                              widget: const PlanDetailScreen());
                          ulcerMonitoringController
                              .updatePlanSelection(ulcerMonitoringPlanModel);
                        },
                        getStarted: () {
                          ulcerMonitoringController
                              .updatePlanSelection(ulcerMonitoringPlanModel);
                          ulcerMonitoringController.proceedToPayment();
                        },
                      );
                    }),
              ),
            ],
          ),
          // child: Column(
          //   children: [
          // UlcerMonitoringWidget(
          //   ulcerMonitoringPlanModel:
          //       ulcerMonitoringController.freeUlcerMonitoringPlanModel,
          //   isSelected: ulcerMonitoringController.selectedPlan ==
          //       Strings.basicPlanText,
          //   onPress: () {
          //     ulcerMonitoringController
          //         .updatePlanSelection(Strings.basicPlanText);
          //   },
          // ),
          //     const SizedBox(
          //       height: 22,
          //     ),
          //     UlcerMonitoringWidget(
          //       isSelected: ulcerMonitoringController.selectedUlcerModel ==
          //           Strings.premiumPlanText,
          //       ulcerMonitoringPlanModel: ,
          //       onPress: () {
          //         ulcerMonitoringController
          //             .updatePlanSelection(Strings.premiumPlanText);
          //       },
          //     ),
          //   ],
          // ),
        ),
      );
    });
  }
}
