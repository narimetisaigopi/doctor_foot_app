import 'package:drfootapp/controllers/have_ulcer_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_circular_loader.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HaveUlcerPreviewScreen extends StatefulWidget {
  const HaveUlcerPreviewScreen({super.key});

  @override
  State<HaveUlcerPreviewScreen> createState() => _HaveUlcerPreviewScreenState();
}

class _HaveUlcerPreviewScreenState extends State<HaveUlcerPreviewScreen> {
  HaveUlcerController ulcerController = Get.put(HaveUlcerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HaveUlcerController>(builder: (ulcerController) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.secondary,
          body: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.iconColor,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${ulcerController.getPickedImages().length}/3",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackBold,
                      ),
                    ),
                    LinearPercentIndicator(
                      width: 200.0,
                      lineHeight: 12.0,
                      barRadius: const Radius.circular(8),
                      percent: ulcerController.getPickedImages().length / 3,
                      backgroundColor: AppColors.progressInactive,
                      progressColor: AppColors.patientReviewBg,
                    )
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "Upload Your ulcer picture",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackBold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 479,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: CustomImage(
                    path: ulcerController
                                .getImage(ulcerController.currentPosition) !=
                            null
                        ? ulcerController
                            .getImage(ulcerController.currentPosition)!
                            .path
                        : "",
                    isFile: true,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                const Spacer(),
                Center(
                  child: ulcerController.isLoading
                      ? const CustomCircularLoader()
                      : CustomButton(
                          buttonName: ulcerController.isAll3ImagesUploaded()
                              ? "Upload"
                              : "Next",
                          bgColor: AppColors.patientReviewBg,
                          borderRadius: 12,
                          onPress: () {
                            if (ulcerController.isAll3ImagesUploaded()) {
                              Utility.showAlertDialogger(
                                  context: context,
                                  yes: () async {
                                    Get.back();
                                    ulcerController.uploadHaveUlcerImages();
                                  },
                                  no: () {
                                    Get.back();
                                  });
                            } else {
                              Get.back();
                            }
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
