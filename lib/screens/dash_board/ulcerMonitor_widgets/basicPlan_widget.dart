import 'package:doctor_foot_app/models/ulcer_monitor_models/free_plan_model.dart';
import 'package:doctor_foot_app/screens/dash_board/ulcerMonitor_widgets/custom_ulcer_button.dart';
import 'package:doctor_foot_app/screens/dash_board/ulcerMonitor_widgets/dotted_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

class BasicPlanWidget extends StatefulWidget {
  const BasicPlanWidget({super.key});

  @override
  State<BasicPlanWidget> createState() => _BasicPlanWidgetState();
}

class _BasicPlanWidgetState extends State<BasicPlanWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.29,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.freePlanBgColor,
        border: Border.all(color: AppColors.ulcerMonitorBorderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              Strings.basicPlanText,
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              Strings.freeText,
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.separated(
                itemCount: freePlanList.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemBuilder: (context, index) {
                  final freePlanItem = freePlanList[index];
                  return DottedWidget(
                    text: freePlanItem.text,
                  );
                }),
          ),
          CustomUlcerButton(onPressed: () {})
        ],
      ),
    );
  }
}
