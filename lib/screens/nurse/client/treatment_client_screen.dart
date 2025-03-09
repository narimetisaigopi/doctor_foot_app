import 'dart:developer';
import 'package:drfootapp/screens/dash_board/videos_screen_widgets/watch_now_widget.dart';
import 'package:drfootapp/screens/nurse/controller/treatment_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'take_image_popup.dart';

class TreatmentClientScreen extends StatefulWidget {
  const TreatmentClientScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TreatmentClientScreenState createState() => _TreatmentClientScreenState();
}

class _TreatmentClientScreenState extends State<TreatmentClientScreen> {
  TreatmentController treatmentController = Get.put(TreatmentController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TreatmentController>(builder: (treatmentController) {
      return Obx(
        () => Scaffold(
          backgroundColor: AppColors.secondary,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined,
                  color: AppColors.whiteBgColor),
              onPressed: () => Get.back(),
            ),
            backgroundColor: AppColors.primaryBlue,
            title: const Text("Client",
                    style: TextStyle(
                        color: AppColors.whiteBgColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w700))
                .tr(),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const WatchNowWidget(),
                const SizedBox(height: 12),
                questionContainer(
                    "Have you reached location safely?",
                    ["Yes", "No"],
                    "woundCheck",
                    AssetsConstants.delivery_bike,
                    treatmentController.haveYouReachedLocationSafely.value,
                    (value) {
                  log("valuevalue $value");
                  treatmentController.haveYouReachedLocationSafely.value =
                      value;
                }),
                if (treatmentController.haveYouReachedLocationSafely.value ==
                    "Yes")
                  questionContainer(
                      "Is the wound same as displayed picture?",
                      ["Yes", "No"],
                      "woundSize",
                      AssetsConstants.imageGallery,
                      treatmentController.isWoundSameAsPicture.value, (value) {
                    treatmentController.isWoundSameAsPicture.value = value;
                  }),
                if (treatmentController.isWoundSameAsPicture.value == "No") ...[
                  questionContainer(
                      "What is the size of the wound?",
                      ["Small", "Med", "Large"],
                      "woundSize",
                      AssetsConstants.weightBar,
                      treatmentController.whatIsSizeOfTheWound.value, (value) {
                    treatmentController.whatIsSizeOfTheWound.value = value;
                  }),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: isStartTreatment()
                          ? () {
                              Get.to(() => const TakeImagePopup(
                                    index: 0,
                                  ));
                            }
                          : null,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isStartTreatment()
                              ? AppColors.primaryBlue
                              : AppColors.treatmentYesbg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          "Start Treatment",
                          style: TextStyle(
                            color: isStartTreatment()
                                ? Colors.white
                                : AppColors.black2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget questionContainer(String question, List<String> options, String type,
      String image, String? selectedOption, Function(String) onSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteBgColor,
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Text(question,
                            style: const TextStyle(
                                color: AppColors.black1,
                                fontSize: 14,
                                fontWeight: FontWeight.bold))
                        .tr()),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: options.map((option) {
                bool isSelected = selectedOption == option;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomButton(
                      width: double.infinity,
                      buttonName: option,
                      borderRadius: 16,
                      bgColor: isSelected
                          ? AppColors.primaryBlue
                          : AppColors.treatmentYesbg,
                      textColor: isSelected
                          ? AppColors.whiteBgColor
                          : AppColors.black1,
                      onPress: () {
                        onSelected(option);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // void showStartTreatmentDialog() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => Dialog(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //         child: TakeImagePopup(
  //           index: 0,
  //         )),
  //   );
  // }

  isStartTreatment() {
    return treatmentController.haveYouReachedLocationSafely.value == "Yes" &&
        treatmentController.isWoundSameAsPicture.isNotEmpty;
  }
}
