import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
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
                  itemCount: morningDietDetails.length,
                  itemBuilder: (context, index) {
                    final morningDietPlan = morningDietDetails[index];
                    return Container(
                      margin: const EdgeInsets.only(left: 8, right: 6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.dietChartBgColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: SvgImageWidget(
                              path: "${morningDietPlan["image"]}",
                              height: 148,
                              width: 63,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                      bottom: Radius.circular(16))),
                              child: Center(
                                child: Text(
                                  "${morningDietPlan["timings"]}",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.secondary),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
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
                  itemCount: afternoonDietDetails.length,
                  itemBuilder: (context, index) {
                    final afternoonDietPlan = afternoonDietDetails[index];
                    return Container(
                      margin: const EdgeInsets.only(left: 8, right: 6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.dietChartBgColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: SvgImageWidget(
                              path: "${afternoonDietPlan["image"]}",
                              height: 148,
                              width: 63,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.vertical(
                                         top: Radius.circular(16),
                                      bottom: Radius.circular(16))),
                              child: Center(
                                child: Text(
                                  "${afternoonDietPlan["timings"]}",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.secondary),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
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
                  itemCount: eviningDietDetails.length,
                  itemBuilder: (context, index) {
                    final eviningDietPlan = eviningDietDetails[index];
                    return Container(
                      margin: const EdgeInsets.only(left: 8, right: 6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.dietChartBgColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: SvgImageWidget(
                              path: "${eviningDietPlan["image"]}",
                              height: 148,
                              width: 63,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.vertical(
                                         top: Radius.circular(16),
                                      bottom: Radius.circular(16))),
                              child: Center(
                                child: Text(
                                  "${eviningDietPlan["timings"]}",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.secondary),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
