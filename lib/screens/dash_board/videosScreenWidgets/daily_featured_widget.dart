import 'package:drfootapp/models/videosModels/daily_futured_model.dart';
import 'package:drfootapp/screens/dash_board/videosScreenWidgets/check_diabeties_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DailyFeaturedWidget extends StatefulWidget {
  const DailyFeaturedWidget({super.key});

  @override
  State<DailyFeaturedWidget> createState() => _DailyFeaturedWidgetState();
}

class _DailyFeaturedWidgetState extends State<DailyFeaturedWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.videoImageBgColor,
      height: size.height * 0.4,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 06, right: 08),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "dailyFeaturedText",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBackThickColor),
                ).tr(),
                Row(
                  children: [
                    const Text(
                      "viewallText",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBackThickColor),
                    ).tr(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: AppColors.arrowForwardBlackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4.1 / 3,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: videoscreenDfList.length,
                  itemBuilder: (context, index) {
                    final videoscreenDfItem = videoscreenDfList[index];
                    return CheckDiabetiesWidget(
                      image: videoscreenDfItem.image,
                      text: videoscreenDfItem.healthIssue,
                      onpressed: () {},
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
