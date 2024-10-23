import 'package:drfootapp/controllers/have_ulcer_controller.dart';
import 'package:drfootapp/screens/dash_board/treatement/ulcer/ulcer_upload_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HaveUlcerUploadDocumentScreen extends StatefulWidget {
  final UlcerDocumentType ulcerDocumentType;
  const HaveUlcerUploadDocumentScreen(
      {super.key, this.ulcerDocumentType = UlcerDocumentType.dischargeSummary});

  @override
  State<HaveUlcerUploadDocumentScreen> createState() =>
      _HaveUlcerUploadDocumentScreenState();
}

class _HaveUlcerUploadDocumentScreenState
    extends State<HaveUlcerUploadDocumentScreen> {
  final HaveUlcerController haveUlcerController =
      Get.put(HaveUlcerController());
  int currentIndex = 0;
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: const CustomAppbar(title: "Have Ulcer"),
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
                    if (widget.ulcerDocumentType ==
                        UlcerDocumentType.consultationDocument)
                      InkWell(
                        onTap: haveUlcerController.uploadUlcerPictures,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColors.abBorderColor),
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
                  """
Step to upload discharge :
Step 1 : Click on “ Next “ button.
Step 2 : Open the document files and select the needed documents to upload.
Step 3 : Click on “Upload “ button.""",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        haveUlcerController.haveUlcerYesUploadDocument(
                            context, widget.ulcerDocumentType);
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
