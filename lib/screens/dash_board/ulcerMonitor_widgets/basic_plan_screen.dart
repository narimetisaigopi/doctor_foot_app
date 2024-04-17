import 'package:drfootapp/models/ulcer_monitor_models/free_plan_model.dart';
import 'package:drfootapp/screens/dash_board/ulcerMonitor_widgets/dotted_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BasicPlanScreen extends StatelessWidget {
  const BasicPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.freePlanBgColor,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.freePlanBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: const Text(
                      "basicPlanText",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textBlackColors,
                          fontWeight: FontWeight.w700),
                    ).tr(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text(
                      "freeText",
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700),
                    ).tr(),
                  ),
                  const SizedBox(
                    height: 08,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: freePlanList.length,
                        itemBuilder: (context, index) {
                          final freePlanItem = freePlanList[index];
                          return DottedWidget(
                            text: freePlanItem.text,
                          );
                        }),
                  ),
                  Expanded(
                    child: Center(
                      child: CustomButton(
                        width: 318,
                        buttonName: "getStartedButton",
                        isBoxShadow: false,
                        borderRadius: 12,
                        onPress: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.freePlanBgColor,
            ),
          )
        ],
      ),
    );
  }
}
