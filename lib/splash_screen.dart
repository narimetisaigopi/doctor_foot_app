import 'dart:async';
import 'package:drfootapp/admin/admin_panel.dart';
import 'package:drfootapp/doctor_consult.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
//import 'package:drfootapp/screens/intro_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkAndMove() {
    Utility.checkUserUserTypeAndNavigate();
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      if (kIsWeb) {
        Get.offAll(() => const AdminPanel());
      } else {
        if (FirebaseAuth.instance.currentUser != null) {
          Get.offAll(() => const DashBoardScreen());
        } else {
         // Get.offAll(() => const IntroScreen());
         Get.offAll(()=>  DoctorConsultScreen());
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 65,
            width: double.infinity,
            child: CustomImage(
              path: AssetsConstants.logo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
