import 'package:drfootapp/screens/treatement/have_ulcer_yes_screen.dart';
import 'package:drfootapp/screens/treatement/ulcer_no_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HaveUlcerScreen extends StatefulWidget {
  const HaveUlcerScreen({super.key});

  @override
  State<HaveUlcerScreen> createState() => _HaveUlcerScreenState();
}

class _HaveUlcerScreenState extends State<HaveUlcerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Center(
                child: Container(
              decoration: BoxDecoration(
                  color: AppColors.riskCheckBg,
                  borderRadius: BorderRadius.circular(100)),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomImage(
                  path: AssetsConstants.layer_1,
                  height: 118,
                  width: 108,
                ),
              ),
            )),
            const SizedBox(
              height: 12,
            ),
            const Center(
              child: Text(
                'Did You Get A Treatment For \nRecognized Hospital',
                style: TextStyle(
                  color: AppColors.blackBold,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Utility.myBottomSheet(
                      context,
                      heightFactor: 0.6,
                      widget: const UlcerNoScreen(),
                    );
                  },
                  child: const CustomButton(
                    width: 150,
                    borderRadius: 16,
                    buttonName: "No",
                    bgColor: AppColors.treatmentYesbg,
                    textColor: AppColors.black2,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const HaveUlcerYesScreen());
                  },
                  child: const CustomButton(
                    width: 150,
                    buttonName: "Yes",
                    borderRadius: 16,
                    bgColor: AppColors.primaryBlue,
                    textColor: AppColors.bgColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
