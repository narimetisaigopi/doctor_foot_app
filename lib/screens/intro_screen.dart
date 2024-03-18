import 'package:doctor_foot_app/screens/dash_board/dash_board_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:doctor_foot_app/screens/auth_screens/sign_up_screen.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(76.0),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: IconButton(
                onPressed: () {
                  Utility.myBottomSheet(context,
                      widget: const SignUpScreen(), heightFactor: 0.7);
                },
                icon: pageController == introScreenImages[0]
                    ? Container()
                    : const SvgImageWidget(
                        path: AssetsConstants.arrow_back,
                        width: 40,
                        height: 40,
                      ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  onTap: () {
                    Get.to(const DashBoardScreen());
                  },
                  child: const Text(
                    "skip",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700),
                  ).tr(),
                ),
              ),
            ],
          ),
        ),
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
                    SvgImageWidget(
                      path: "${images["image"]}",
                      height: 413,
                      width: 430,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "introText",
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700),
                    ).tr(),
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
                          offset: 50.0),
                    )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
