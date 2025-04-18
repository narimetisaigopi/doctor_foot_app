import 'package:drfootapp/screens/check_your_feet/metarsalgia_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootPainMetarsalgiaScreen extends StatefulWidget {
  const FootPainMetarsalgiaScreen({super.key});

  @override
  State<FootPainMetarsalgiaScreen> createState() =>
      _FootPainMetarsalgiaScreenState();
}

class _FootPainMetarsalgiaScreenState extends State<FootPainMetarsalgiaScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: AppColors.black1,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Foot deformities",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Center(
              child: CustomImage(
                height: 222,
                width: 222,
                path: AssetsConstants.foot_pain_one,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 180,
                  buttonName: "No",
                  isBoxShadow: false,
                  bgColor: AppColors.secondaryButton,
                  border: false,
                  onPress: () {},
                ),
                CustomButton(
                  width: 180,
                  buttonName: "Confirm",
                  isBoxShadow: false,
                  bgColor: AppColors.secondaryButton,
                  border: false,
                  onPress: () {
                    Get.to(const MetarsalgiaScreen());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
