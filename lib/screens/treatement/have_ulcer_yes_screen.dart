import 'package:drfootapp/screens/treatement/how_to_upload_image_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';

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
                  onPress: () {
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
                            const HowToUploadImage(
                              image: AssetsConstants.how_to_upload_1,
                              nametext: 'Image 1 :',
                              descriptiontext:
                                  'Image should be taken from the front which should revile the entire ulcer wound along with entire foot as shown in the example image. ',
                            ),
                            const HowToUploadImage(
                              image: AssetsConstants.how_to_upload_2,
                              nametext: 'Image 2 :',
                              descriptiontext:
                                  'Image should be taken from the top which should revile the depth of the ulcer as shown in the example image. ',
                            ),
                            const HowToUploadImage(
                              image: AssetsConstants.how_to_upload_3,
                              nametext: 'Image 3 :',
                              descriptiontext:
                                  'Image should be taken from side to locate the place of the ulcer on the feet as shown in the example image. ',
                            ),
                          ],
                        ));
                  },
                  buttonName: "Next",
                  bgColor: AppColors.patientReviewBg,
                  borderRadius: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
