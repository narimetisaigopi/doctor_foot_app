import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/sp_helper.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:drfootapp/screens/auth_screens/sign_up_screen.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pageController = PageController();
  double currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteBgColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(76.0),
          child: AppBar(
            leading: currentPage == 0
                ? Container()
                : IconButton(
                    onPressed: () {
                      if (currentPage != 0) {
                        setState(() {
                          currentPage--;
                          pageController.jumpTo(currentPage);
                        });
                      }
                    },
                    icon: const SvgImageWidget(
                      path: AssetsConstants.arrow_back,
                      width: 60,
                      height: 60,
                    ),
                  ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  onTap: () {
                    skipIntro();
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
            onPageChanged: (value) {
              setState(() {
                currentPage = value.toDouble();
              });
            },
            itemCount: introScreenImages.length,
            itemBuilder: ((context, index) {
              final images = introScreenImages[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
              );
            }),
          ),
        ));
  }

  skipIntro() {
    SPHelper().setIntroSeen();
    // Get.offAll(() => const SignInScreen());
    showSignUp();
  }

  showSignUp() {
    Utility.myBottomSheet(context,
        widget: const SignUpScreen(), heightFactor: 0.7);
  }
}
