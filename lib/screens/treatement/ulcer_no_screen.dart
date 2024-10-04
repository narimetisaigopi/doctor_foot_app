import 'dart:io';

import 'package:drfootapp/screens/treatement/have_ulcer_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UlcerNoScreen extends StatefulWidget {
  const UlcerNoScreen({super.key});

  @override
  State<UlcerNoScreen> createState() => _UlcerNoScreenState();
}

class _UlcerNoScreenState extends State<UlcerNoScreen> {
  XFile? xFile;

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
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                    )),
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
            Center(
              child: InkWell(
                onTap: () {
                  pickImage();
                  setState(() {});
                },
                child: xFile != null
                    ? CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.treatmentYesbg,
                        backgroundImage: FileImage(File(xFile!.path)),
                      )
                    : const Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: AppColors.treatmentYesbg,
                        ),
                      ),
              ),
            ),
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
              height: 16,
            ),
            Center(
              child: CustomButton(
                width: 150,
                borderRadius: 16,
                buttonName: "Next",
                bgColor: AppColors.primaryBlue,
                textColor: AppColors.whiteBgColor,
                onPress: () {
                  Get.to(() => const HaveUlcerScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    xFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      Utility.toast("Image  Picked");

      // print("Image picked ${xFile?.path}");
      setState(() {});
    } else {
      Utility.toast(
        "Image Not Picked",
      );
    }
  }
}
