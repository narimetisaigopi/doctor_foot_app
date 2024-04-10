import 'package:drfootapp/models/ulcer_monitor_models/free_plan_model.dart';
import 'package:drfootapp/screens/dash_board/ulcerMonitor_widgets/dotted_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BasicPlanWidget extends StatefulWidget {
  const BasicPlanWidget({super.key});

  @override
  State<BasicPlanWidget> createState() => _BasicPlanWidgetState();
}

class _BasicPlanWidgetState extends State<BasicPlanWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 296,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.freePlanBgColor,
        border: Border.all(color: AppColors.ulcerMonitorBorderColor, width: 2),
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
                physics: NeverScrollableScrollPhysics(),
                itemCount: freePlanList.length,
                itemBuilder: (context, index) {
                  final freePlanItem = freePlanList[index];
                  return DottedWidget(
                    text: freePlanItem.text,
                  );
                }),
          ),
          const Expanded(
            child: Center(
              child: CustomButton(
                width: 318,
                buttonName: "getStartedButton",
                isBoxShadow: false,
                borderRadius: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
