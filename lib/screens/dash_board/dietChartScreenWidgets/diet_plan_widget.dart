import 'package:doctor_foot_app/models/dietChartModels/afternoon_dietChart_model.dart';
import 'package:doctor_foot_app/models/dietChartModels/evining_dietChart_model.dart';
import 'package:doctor_foot_app/models/dietChartModels/morning_dietChart_model.dart';
import 'package:doctor_foot_app/screens/dash_board/dietChartScreenWidgets/diet_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
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
      height: MediaQuery.of(context).size.height * 0.72,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary),
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
            const Row(
              children: [
                SvgImageWidget(
                  path: AssetsConstants.sun_morning,
                  height: 22,
                  width: 22,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  Strings.morningText,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
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
                        image: morningDietItem.image!,
                        timeText: morningDietItem.textTime!);
                  }),
            ),
            const Row(
              children: [
                SvgImageWidget(
                  path: AssetsConstants.sun_afternoon,
                  height: 22,
                  width: 22,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  Strings.afternoonText,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
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
                        image: afternoonDietItem.image!,
                        timeText: afternoonDietItem.textTime!);
                  }),
            ),
            const Row(
              children: [
                SvgImageWidget(
                  path: AssetsConstants.sun_evining,
                  height: 22,
                  width: 22,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  Strings.eveningText,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
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
                        image: eviningDietItem.image!,
                        timeText: eviningDietItem.textTime!);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
