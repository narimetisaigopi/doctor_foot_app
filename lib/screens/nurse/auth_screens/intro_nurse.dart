import 'package:drfootapp/screens/nurse/auth_screens/nurse_signup_screen.dart';
import 'package:drfootapp/screens/auth_screens/sign_in_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 70,
            child: Image.asset(
              AssetsConstants.nurse_intro,
            ),
          ),
          Expanded(
            flex: 30,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
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
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text("If you don't have a account !"),
                        InkWell(
                          onTap: () {
                            Utility.myBottomSheet(
                              context,
                              widget: const NurseSignUpScreen(),
                              heightFactor: 0.75,
                            );
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
            ),
          )
        ],
      ),
    );
  }
}
