import 'package:drfootapp/controllers/have_ulcer_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HaveUlcerUploadDocumentScreen extends StatefulWidget {
  final UlcerDocumentType? ulcerDocumentType;
  const HaveUlcerUploadDocumentScreen({super.key, this.ulcerDocumentType});

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
  void initState() {
    logger("initstate ulcerDocumentType ${widget.ulcerDocumentType}");
    super.initState();
  }

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
                    Text(
                      widget.ulcerDocumentType ==
                              UlcerDocumentType.dischargeSummary
                          ? "Upload Discharge Summary"
                          : "Upload Consultation Document",
                      style: const TextStyle(
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
                          width: 80,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.abBorderColor),
                          child: const Text(
                              "Skip",
                              style: TextStyle(
                              fontSize: 18,
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.w700,
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
                RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black1,
                    ),
                    children: [
                      TextSpan(
                        text: 'Step to upload discharge:\n\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Step 1: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Click on “Next“ button.\n',
                      ),
                      TextSpan(
                        text: 'Step 2: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'Open the document files and select the needed documents to upload.\n',
                      ),
                      TextSpan(
                        text: 'Step 3: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Click on “Upload“ button.',
                      ),
                    ],
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
                            context, widget.ulcerDocumentType!);
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
