import 'package:drfootapp/models/ulcer_monitor_models/uncler_monitoring_plan_model.dart';
import 'package:drfootapp/screens/dash_board/ulcerMonitor_widgets/dotted_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UlcerMonitoringWidget extends StatefulWidget {
  final UlcerMonitoringPlanModel ulcerMonitoringPlanModel;
  final bool isSelected;
  final Function()? onPress;
  final Function()? getStarted;
  const UlcerMonitoringWidget(
      {super.key,
      this.isSelected = false,
      required this.ulcerMonitoringPlanModel,
      required this.onPress,
      required this.getStarted});

  @override
  State<UlcerMonitoringWidget> createState() => _UlcerMonitoringWidgetState();
}

class _UlcerMonitoringWidgetState extends State<UlcerMonitoringWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
              widget.ulcerMonitoringPlanModel.planTitle == Strings.basicPlanText
                  ? AppColors.freePlanBgColor
                  : AppColors.whiteBgColor,
          border: Border.all(
              color: !widget.isSelected
                  ? AppColors.ulcerMonitorBorderColor
                  : AppColors.primary,
              width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                widget.ulcerMonitoringPlanModel.planTitle,
                style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.textBlackColors,
                    fontWeight: FontWeight.w700),
              ).tr(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                widget.ulcerMonitoringPlanModel.planAmount == 0
                    ? widget.ulcerMonitoringPlanModel.planDuration
                    : "${widget.ulcerMonitoringPlanModel.planAmount}/${widget.ulcerMonitoringPlanModel.planDuration}",
                style: const TextStyle(
                    fontSize: 24,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700),
              ).tr(),
            ),
            const SizedBox(
              height: 08,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.ulcerMonitoringPlanModel.planDetailItems
                    .map((e) => DottedWidget(
                          text: e,
                        ))
                    .toList(),
              ),
            ),
            Center(
              child: CustomButton(
                width: 318,
                onPress: widget.getStarted,
                buttonName: "getStartedButton",
                isBoxShadow: false,
                borderRadius: 12,
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
