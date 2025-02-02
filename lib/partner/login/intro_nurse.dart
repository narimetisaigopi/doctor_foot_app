import 'package:drfootapp/partner/login/signup/signup_nurse.dart';
import 'package:drfootapp/screens/auth_screens/sign_in_screen.dart';
import 'package:drfootapp/screens/auth_screens/sign_up_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroNurseScreen extends StatefulWidget {
  const IntroNurseScreen({super.key});

  @override
  State<IntroNurseScreen> createState() => _IntroNurseScreenState();
}

class _IntroNurseScreenState extends State<IntroNurseScreen> {
  final pageController = PageController();
  double currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 60,
          // child: PageView.builder(
          //   controller: pageController,
          //   onPageChanged: (value) {
          //     setState(() {
          //       currentPage = value.toDouble();
          //     });
          //   },
          //   itemCount: introScreenImages.length,
          //   itemBuilder: ((context, index) {
          //     final images = introScreenImages[index];
          //     return Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         Image.asset(AssetsConstants.nurse_intro),
          //         // SvgImageWidget(
          //         //   path: "${images["image"]}",
          //         //   height: 380,
          //         //   width: 430,
          //         // ),
          //         const SizedBox(
          //           height: 16,
          //         ),
          //         const Text(
          //           "introText",
          //           style: TextStyle(
          //             fontSize: 24,
          //             color: AppColors.introTextColor,
          //             fontWeight: FontWeight.w700,
          //           ),
          //         ).tr(),
          //         const SizedBox(
          //           height: 16,
          //         ),
          //         // SmoothPageIndicator(
          //         //   controller: pageController,
          //         //   count: introScreenImages.length,
          //         //   effect: const ExpandingDotsEffect(
          //         //       activeDotColor: AppColors.primaryBlue,
          //         //       dotColor: AppColors.grey2,
          //         //       dotWidth: 10.0,
          //         //       dotHeight: 8.0,
          //         //       radius: 4.0,
          //         //       offset: 50.0),
          //         // ),
          //         // const SizedBox(height: 8),
          //         // const Divider(
          //         //   color: AppColors.grey4,
          //         //   thickness: 3,
          //         // ),
          //       ],
          //     );
          //   }),
          // ),
          // child: Column(
          //   children: [
          //     Image.asset(AssetsConstants.nurse_intro)
          //   ],
          // ),
          child: Image.asset(AssetsConstants.nurse_intro),
        ),
        Expanded(
          flex: 20,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let’s get started!",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blackBold,
                    fontWeight: FontWeight.w500,
                  ),
                ).tr(),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    Utility.myBottomSheet(
                      context,
                      widget: const SignInScreen(),
                      heightFactor: 0.45,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.grey2,
                          width: 1,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        "Enter mobile number",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ).tr(),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
               // Text('data')
               Row(
  children: [
    const Text("If you don't have a account !"),
    GestureDetector(
      onTap: () {
        Get.to(() => const SignUpNurseScreen());
      },
      child: const Text(
        'Sign Up',
        style: TextStyle(
          color: AppColors.primaryBlue, 
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
)

              ],
            ),
          ),
        )
      ],
    ));
  }
}
