import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WatchNowWidget extends StatefulWidget {
  const WatchNowWidget({super.key});

  @override
  State<WatchNowWidget> createState() => _WatchNowWidgetState();
}

class _WatchNowWidgetState extends State<WatchNowWidget> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.24,
      color: Colors.blue[50],
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: size.height * 0.2,
            width: double.infinity,
            child: PageView.builder(
                controller: controller,
                // separatorBuilder: (context, index) {
                //   return const SizedBox(
                //     width: 10,
                //   );
                // },
                scrollDirection: Axis.horizontal,
                itemCount: videoscreen1.length,
                itemBuilder: (context, index) {
                  final videoscreen = videoscreen1[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          height: size.height * 0.21,
                          width: double.infinity,
                          child: SizedBox(
                            child: SvgImageWidget(
                              path: "${videoscreen["image"]}",
                              height: size.height * 0.2,
                              width: size.width * 0.8,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 26,
                        left: 26,
                        child: Column(
                          children: [
                            const Text(
                              Strings.gettingMedisineText,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textWhiteColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 26,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Center(
                                child: Text(
                                  Strings.watchNowText,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textWhiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  );
                }),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 5,
            effect: const ScrollingDotsEffect(
              dotHeight: 08,
              dotWidth: 08,
            ),
          ),
        ],
      ),
    );
  }
}
