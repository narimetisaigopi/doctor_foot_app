import 'package:drfootapp/controllers/have_ulcer_controller.dart';
import 'package:drfootapp/screens/dash_board/treatement/ulcer/ulcer_upload_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../how_to_upload_ulcer_image_widget.dart';

class HaveUlcerYesScreen extends StatefulWidget {
  const HaveUlcerYesScreen({super.key});

  @override
  State<HaveUlcerYesScreen> createState() => _HaveUlcerYesScreenState();
}

class _HaveUlcerYesScreenState extends State<HaveUlcerYesScreen> {
  final HaveUlcerController haveUlcerController =
      Get.put(HaveUlcerController());
  int currentIndex = 0;
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
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
      body: GetBuilder<HaveUlcerController>(
        builder: (haveUlcerController) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upload Discharge Summary ",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.blackBold,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            title: "",
                            content: Column(
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 22),
                                      child: Text(
                                        "How To Upload Ulcer Picture",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.black1,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const Spacer(),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: AppColors.primaryBlue,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const HowToUploadUlcerImageWidget(
                                  image: AssetsConstants.how_to_upload_1,
                                  index: 1,
                                  descriptiontext:
                                      'Image should be taken from the front which should revile the entire ulcer wound along with entire foot as shown in the example image. ',
                                ),
                                const HowToUploadUlcerImageWidget(
                                  image: AssetsConstants.how_to_upload_2,
                                  index: 2,
                                  descriptiontext:
                                      'Image should be taken from the top which should revile the depth of the ulcer as shown in the example image. ',
                                ),
                                const HowToUploadUlcerImageWidget(
                                  image: AssetsConstants.how_to_upload_3,
                                  index: 3,
                                  descriptiontext:
                                      'Image should be taken from side to locate the place of the ulcer on the feet as shown in the example image. ',
                                ),
                              ],
                            ));
                      },
                      child: Container(
                        decoration:
                            const BoxDecoration(color: AppColors.abBorderColor),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
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
          );
        },
      ),
    );
  }
}
