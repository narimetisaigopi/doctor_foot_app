import 'dart:async';
import 'package:drfootapp/admin/admin_panel.dart';
import 'package:drfootapp/screens/nurse/auth_screens/nurse_login_screen.dart';
import 'package:drfootapp/screens/nurse/nurse_dash_board_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/sp_helper.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NurseSplashScreen extends StatefulWidget {
  const NurseSplashScreen({super.key});

  @override
  State<NurseSplashScreen> createState() => _NurseSplashScreenState();
}

class _NurseSplashScreenState extends State<NurseSplashScreen> {
  checkAndMove() {
    Utility.checkUserUserTypeAndNavigate();
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      if (kIsWeb) {
        Get.offAll(() => const AdminPanel());
      } else {
        if (SPHelper.getUser() != null) {
          Get.offAll(() => const NurseDashBoardScreen());
        } else {
          Get.offAll(() => const NurseLoginScreen());
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
