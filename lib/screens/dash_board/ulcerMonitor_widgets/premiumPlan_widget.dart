import 'package:doctor_foot_app/models/ulcer_monitor_models/premium_model.dart';
import 'package:doctor_foot_app/screens/dash_board/ulcerMonitor_widgets/custom_ulcer_button.dart';
import 'package:doctor_foot_app/screens/dash_board/ulcerMonitor_widgets/dotted_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class PremiumPlanWidget extends StatefulWidget {
  const PremiumPlanWidget({super.key});

  @override
  State<PremiumPlanWidget> createState() => _PremiumPlanWidgetState();
}

class _PremiumPlanWidgetState extends State<PremiumPlanWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.39,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: const Text(
              "premiumPlanText",
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w700),
            ).tr(),
          ),
          const SizedBox(
            height: 08,
          ),
           Padding(
            padding: const EdgeInsets.only(left: 16),
            child: const Text(
             "planAmountText",
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700),
            ).tr(),
          ),
          const SizedBox(
            height: 22,
          ),
          Expanded(
            child: ListView.separated(
                itemCount: premiumPlanList.length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemBuilder: (context, index) {
                  final premiumPlanItem = premiumPlanList[index];
                  return DottedWidget(
                    text: premiumPlanItem.text,
                  );
                }),
          ),
          CustomUlcerButton(onPressed: () {})
        ],
      ),
    );
  }
}
