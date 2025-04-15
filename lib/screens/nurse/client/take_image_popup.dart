import 'package:drfootapp/screens/nurse/controller/treatment_controller.dart';
import 'package:drfootapp/screens/nurse/nurse_dash_board_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TakeImagePopup extends StatefulWidget {
  final int index;
  const TakeImagePopup({super.key, required this.index});

  @override
  State<TakeImagePopup> createState() => _TakeImagePopupState();
}

class _TakeImagePopupState extends State<TakeImagePopup> {
  final List data = [
    {
      "image": "assets/images/nurse/treatment/treatment1.png",
      "description":
          "Image should be taken from the front which should revile the entire ulcer wound along with entire foot as shown in the example image."
    },
    {
      "image": "assets/images/nurse/treatment/treatment2.png",
      "description":
          "Image should be taken from the top which should revile the depth of the ulcer as shown in the example image."
    },
    {
      "image": "assets/images/nurse/treatment/treatment3.png",
      "description":
          "Image should be taken from side to locate the place of the ulcer on the feet as shown in the example image."
    }
  ];

  TreatmentController treatmentController = Get.put(TreatmentController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map map = data[widget.index];
    return GetBuilder<TreatmentController>(builder: (treatmentController) {
      return Container(
        color: AppColors.textWhiteColor,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 8,
                  child: Text(
                    "If No, Please upload the picture!",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black2),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () async {
                      Get.back();
                      XFile? xFile = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (xFile != null) {
                        treatmentController.treatmentsImagesList.add(xFile);
                        logger("TakeImagePopup index: ${widget.index}");
                        logger(
                            "TakeImagePopup treatmentsImagesList: ${treatmentController.treatmentsImagesList.length}");
                        if (widget.index == 2) {
                          // all steps completed
                          Utility.stateAlertDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              title: 'Upload Successful',
                              description: "",
                              buttonText: "Done",
                              image: AssetsConstants.done_image,
                              color: AppColors.successColor,
                              onDone: () {
                                Get.back();
                                Get.offAll(() => const NurseDashBoardScreen());
                              });
                        } else {
                          showStartTreatmentDialog();
                        }
                      } else {
                        Utility.toast("Provide image");
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.bottomSheetBackgroundColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Image.asset(
                      map["image"],
                      height: 130,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Image ${widget.index + 1}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black2),
                            ),
                          ),
                          Text(
                            map["description"],
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  void showStartTreatmentDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: TakeImagePopup(
          index: widget.index + 1,
        ),
      ),
      barrierDismissible: false, // Prevent dismissing by tapping outside
    );
  }
}
