import 'dart:async';

import 'package:doctor_foot_app/admin/admin_login.dart';
import 'package:doctor_foot_app/screens/intro_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    Timer(const Duration(seconds: 3), () {
      checkAndMove();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  child: SvgPicture.asset(AssetsConstants.logo),
                ),
              ),
            ),
    );
  }
}
