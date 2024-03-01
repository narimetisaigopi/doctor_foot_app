import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'intro_screen.dart';

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
    return const Scaffold(
      body: Center(
        child: Text("Doctor Foot"),
      ),
    );
  }
}
