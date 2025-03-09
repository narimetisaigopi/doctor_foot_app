import 'package:drfootapp/screens/nurse/billing_details/bill_checker_screen.dart';
import 'package:drfootapp/screens/nurse/billing_details/count_down_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TreatmentEndScreen extends StatefulWidget {
  const TreatmentEndScreen({super.key});

  @override
  State<TreatmentEndScreen> createState() => _TreatmentEndScreenState();
}

class _TreatmentEndScreenState extends State<TreatmentEndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "TreatmentEndScreen"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              AssetsConstants.treatmentEnd,
              height: 100,
            ),
            const CountDownWidget(),
            Image.asset(
              AssetsConstants.treatmentEnd,
              height: 100,
            ),
            SlideAction(
              elevation: 10,
              borderRadius: 16,
              innerColor: AppColors.slideBtnColor,
              outerColor: AppColors.primaryBlue,
              text: "Completed",
              onSubmit: () async {
                takeCompletePhoto();
              },
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteBgColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  takeCompletePhoto() {
    Utility.stateAlertDialog(
        context: context,
        title: 'Upload Successful',
        description: "",
        buttonText: "Done",
        image: AssetsConstants.done_image,
        color: AppColors.successColor,
        onDone: () async {
          Get.back();
          XFile? xFile =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (xFile != null) {
            uploadedSuccessfully();
          }
        });
  }

  uploadedSuccessfully() {
    Utility.stateAlertDialog(
        context: context,
        title: 'Upload Successful',
        description: "",
        buttonText: "Done",
        image: AssetsConstants.done_image,
        color: AppColors.successColor,
        onDone: () async {
          Get.back();
          Get.to(() => const BillCheckerScreen());
        });
  }
}
