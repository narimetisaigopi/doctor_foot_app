import 'package:drfootapp/screens/nurse/auth_screens/nurse_login_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseOptions extends StatefulWidget {
  const ChooseOptions({super.key});

  @override
  State<ChooseOptions> createState() => _ChooseOptionsState();
}

class _ChooseOptionsState extends State<ChooseOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "CHOOSE AN OPTION",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.black1,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => const NurseLoginScreen());
                },
                child: Column(
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          AssetsConstants.doctor_option,
                        ),
                        fit: BoxFit.fill,
                      )),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'DOCTOR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Get.to(() => const NurseLoginScreen());
                },
                child: Column(
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          AssetsConstants.nurse_option,
                        ),
                        fit: BoxFit.fill,
                      )),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'NURSE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
