import 'package:drfootapp/screens/treatement/ulcer_upload_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HaveUlcerYesScreen extends StatefulWidget {
  const HaveUlcerYesScreen({super.key});

  @override
  State<HaveUlcerYesScreen> createState() => _HaveUlcerYesScreenState();
}

class _HaveUlcerYesScreenState extends State<HaveUlcerYesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Have Ulcer",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upload Discharge Summary ",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.blackBold,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Center(
                child: CustomImage(
              path: AssetsConstants.discharge_summary_image,
              height: 258,
              width: 258,
            )),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Step to upload discharge :",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.blackBold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Step 1 : Click on “ Next “ button.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Step 2 : Open the document files and select the needed documents to upload.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Step 3 : Click on “Upload “ button.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black2,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: CustomButton(
                  buttonName: "Next",
                  bgColor: AppColors.patientReviewBg,
                  borderRadius: 12,
                  onPress: () {
                    Get.to(() => const UlcerUploadScreen());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
