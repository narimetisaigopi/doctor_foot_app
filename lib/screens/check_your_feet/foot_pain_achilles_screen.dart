import 'package:drfootapp/screens/check_your_feet/achilles_tendonitis_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootPainAchillesScreen extends StatefulWidget {
  const FootPainAchillesScreen({super.key});

  @override
  State<FootPainAchillesScreen> createState() => _FootPainAchillesScreenState();
}

class _FootPainAchillesScreenState extends State<FootPainAchillesScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Center(
              child: SvgImageWidget(
                height: 200,
                width: double.infinity,
                path: AssetsConstants.HbA1C,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Center(
              child: Text(
                "Select the region of \n    your foot pain",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackBold,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
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
                    Get.to(const AchillesTendonitisScreen());
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
