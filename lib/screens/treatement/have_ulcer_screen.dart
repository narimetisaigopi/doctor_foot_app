import 'package:drfootapp/screens/treatement/how_to_upload_image_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';

import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HaveUlcerScreen extends StatefulWidget {
  const HaveUlcerScreen({super.key});

  @override
  State<HaveUlcerScreen> createState() => _HaveUlcerScreenState();
}

class _HaveUlcerScreenState extends State<HaveUlcerScreen> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upload Discharge Summary",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black2,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 32,
            ),
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.treatmentYesbg,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Step to Upload Discharge",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Step 1 : Click on “ Next “ button.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Step 2 : Open the document files and select the needed documents to upload.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Step 3 : Click on “Upload “ button.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 110,
            ),
            CustomButton(
              onPress: () {
                Get.defaultDialog(
                    title: "",
                    // titleStyle: const TextStyle(
                    //     color: AppColors.black1,
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w500),
                    // titlePadding:
                    //     const EdgeInsets.only(left: 6, right: 6, top: 6),
                    contentPadding: const EdgeInsets.only(right: 10),
                    content: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.close,
                              color: AppColors.primaryBlue,
                              size: 20,
                            ),
                          ),
                        ),
                        const Text(
                          "How To Upload Ulcer Picture",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.black1,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const HowToUploadImage(),
                        const HowToUploadImage(),
                        const HowToUploadImage(),

                        // ImageUploadList(),
                      ],
                    ));
                //  Get.to( const ImageUploadList());
              },
              buttonName: "Next",
              bgColor: AppColors.primaryBlue,
            )
          ],
        ),
      ),
    );
  }
}
