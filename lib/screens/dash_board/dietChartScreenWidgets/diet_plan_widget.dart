import 'package:drfootapp/models/dietChartModels/afternoon_dietChart_model.dart';
import 'package:drfootapp/models/dietChartModels/evining_dietChart_model.dart';
import 'package:drfootapp/models/dietChartModels/morning_dietChart_model.dart';
import 'package:drfootapp/screens/dash_board/dietChartScreenWidgets/diet_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DietPlanWidget extends StatefulWidget {
  const DietPlanWidget({super.key});

  @override
  State<DietPlanWidget> createState() => _DietPlanWidgetState();
}

class _DietPlanWidgetState extends State<DietPlanWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteBgDietColor),
          color: AppColors.textWhiteColor,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          top: 22,
          right: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SvgImageWidget(
                  path: AssetsConstants.sun_morning,
                  height: 22,
                  width: 22,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "morningText",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ).tr(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 2.0,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4 / 5,
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: morningDietList.length,
                  itemBuilder: (context, index) {
                    final morningDietItem = morningDietList[index];
                    return DietWidget(
                        image: morningDietItem.image,
                        timeText: morningDietItem.textTime);
                  }),
            ),
            Row(
              children: [
                const SvgImageWidget(
                  path: AssetsConstants.sun_afternoon,
                  height: 22,
                  width: 22,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "afternoonText",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ).tr(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4 / 5,
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: afternoonDietList.length,
                  itemBuilder: (context, index) {
                    final afternoonDietItem = afternoonDietList[index];
                    return DietWidget(
                        image: afternoonDietItem.image,
                        timeText: afternoonDietItem.textTime);
                  }),
            ),
            Row(
              children: [
                const SvgImageWidget(
                  path: AssetsConstants.sun_evining,
                  height: 22,
                  width: 22,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "eveningText",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ).tr(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4 / 5,
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: eviningDietList.length,
                  itemBuilder: (context, index) {
                    final eviningDietItem = eviningDietList[index];
                    return DietWidget(
                        image: eviningDietItem.image,
                        timeText: eviningDietItem.textTime);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
