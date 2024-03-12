import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
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
      color: Colors.blue[50],
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
                  Strings.dailyFeaturedText,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBackThickColor),
                ),
                Row(
                  children: [
                    const Text(
                      Strings.viewallText,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBackThickColor),
                    ),
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
                      mainAxisSpacing: 8),
                  itemCount: videoscreen3.length,
                  itemBuilder: (context, index) {
                    final videoscreen = videoscreen3[index];
                    return Stack(
                      children: [
                        SizedBox(
                          height: 160,
                          width: 210,
                          child: SvgImageWidget(
                            path: "${videoscreen["image"]}",
                            width: double.infinity,
                          ),
                        ),
                        const Positioned(
                          left: 36,
                          bottom: 16,
                          child: Text(
                            Strings.diabetiesText,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textWhiteColor),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
