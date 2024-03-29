import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UploadedImageScreen extends StatefulWidget {
  const UploadedImageScreen({super.key});

  @override
  State<UploadedImageScreen> createState() => _UploadedImageScreenState();
}

class _UploadedImageScreenState extends State<UploadedImageScreen> {
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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.dischargeSummaryText,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBold),
                ),
                Text(
                  Strings.yourResultText,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBackColor),
                ),
                SvgImageWidget(
                  height: 196,
                  width: double.infinity,
                  path: AssetsConstants.dr_consult,
                ),
                Text(
                  Strings.yourPictureHaveUploadedText,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackBold),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    buttonName: Strings.dietChartText,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}