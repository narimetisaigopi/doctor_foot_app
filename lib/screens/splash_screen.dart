import 'package:doctor_foot_app/screens/intro_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkStatus() async {
    Future.delayed(const Duration(milliseconds: 600), () async {
      Get.to(const IntroScreen());
    });
  }

  @override
  void initState() {
    checkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Container(
          height: 65,
          width: 143,
          child: SvgPicture.asset(AssetsConstants.logo),
        ),
      ),
    );
  }
}
