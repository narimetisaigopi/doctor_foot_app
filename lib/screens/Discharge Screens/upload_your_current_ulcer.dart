import 'dart:developer';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadYourCurrentUlcer extends StatefulWidget {
  const UploadYourCurrentUlcer({super.key});

  @override
  State<UploadYourCurrentUlcer> createState() => _UploadYourCurrentUlcerState();
}

class _UploadYourCurrentUlcerState extends State<UploadYourCurrentUlcer> {
  XFile? xFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text(
          "dischargeText",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ).tr(),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "dischargeSummaryText",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBold),
                ).tr(),
                const Text(
                  "dischargeSummaryDisText",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColors),
                ).tr(),
                const SvgImageWidget(
                  height: 196,
                  width: double.infinity,
                  path: AssetsConstants.dr_consult,
                ),
                const Text(
                  "uploadedSuccessfullyText",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackBold),
                ).tr(),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    buttonName: Strings.uploadYourCurrentUlcerText,
                    onPress: pickImage,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    var selectedImage;
    selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      setState(() {
        xFile = selectedImage;
      });
    } else {
      log("Image not picked");
    }
  }
}
