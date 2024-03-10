import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:doctor_foot_app/screens/auth_screens/sign_up_screen.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteBgColor,
        body: Center(
          child: PageView.builder(
            controller: pageController,
            itemCount: introScreenImages.length,
            itemBuilder: ((context, index) {
              final images = introScreenImages[index];
              return Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  top: 84,
                  right: 16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Utility.myBottomSheet(context,
                                widget: const SignUpScreen(),
                                heightFactor: 0.7);
                          },
                          icon: index == 0
                              ? Container()
                              : const SvgImageWidget(
                                  path: AssetsConstants.arrow_back,
                                  width: 40,
                                  height: 40,
                                ),
                        ),
                        const Text(
                          Strings.skip,
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SvgImageWidget(
                      path: "${images["image"]}",
                      height: 413,
                      width: 430,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      Strings.introText,
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: introScreenImages.length,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: AppColors.primary,
                        dotColor: AppColors.grey2,
                        dotWidth: 10.0,
                        dotHeight: 8.0,
                        radius: 4.0,
                        offset: 50.0
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
