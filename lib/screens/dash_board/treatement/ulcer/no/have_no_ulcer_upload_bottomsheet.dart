import 'package:drfootapp/controllers/ulcer_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'upload_no_ulcer_photos_guide_popup.dart';

class HaveNoUlcerUploadBottomSheet extends StatefulWidget {
  const HaveNoUlcerUploadBottomSheet({super.key});

  @override
  State<HaveNoUlcerUploadBottomSheet> createState() =>
      _HaveNoUlcerUploadBottomSheetState();
}

class _HaveNoUlcerUploadBottomSheetState
    extends State<HaveNoUlcerUploadBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                    )),
                const SizedBox(width: 4),
                const Text(
                  'UPLOAD YOUR ULCER PICTURE',
                  style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
                child: CustomImage(
              path: AssetsConstants.treatement_no,
              height: 156,
              width: 156,
              fit: BoxFit.contain,
            )),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                "We are requesting you to upload your \nulcer picture so that experts can \nprovide a suitable remedy",
                style: TextStyle(
                  color: AppColors.black2,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomButton(
                borderRadius: 16,
                buttonName: "Next",
                bgColor: AppColors.patientReviewBg,
                textColor: AppColors.whiteBgColor,
                onPress: () {
                  Get.put(UlcerController()).reset();
                  Get.defaultDialog(
                      title: "", content: UploadNoUlcerPhotosGuidePopup());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
