import 'package:drfootapp/screens/nurse/auth_screens/nurse_login_screen.dart';
import 'package:drfootapp/screens/intro_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorConsultScreen extends StatefulWidget {
  const DoctorConsultScreen({super.key});

  @override
  State<DoctorConsultScreen> createState() => _DoctorConsultScreenState();
}

class _DoctorConsultScreenState extends State<DoctorConsultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              Strings.doctorConsult,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const IntroScreen());
                  },
                  child: const Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 40,
                        backgroundImage:
                            AssetImage(AssetsConstants.find_doctor),
                      ),
                      SizedBox(height: 10),
                      Text('DOCTOR'),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),
                //Spacer(),
                GestureDetector(
                  onTap: () {
                    //  Get.to(() => const IntroScreen());
                    Get.to(() => const NurseLoginScreen());
                  },
                  child: const Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 40,
                        backgroundImage: AssetImage(AssetsConstants.nurse_logo),
                      ),
                      SizedBox(height: 10),
                      Text('NURSE'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
