import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({super.key});

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  double _value = 3.0;
  void _setvalue(double value) => setState(() => _value = value);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.iconColor,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "1/3",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackBold,
                    ),
                  ),
                  Slider(
                    activeColor: AppColors.patientReviewBg,
                    min: 0,
                    max: 3,
                    value: _value,
                    onChanged: _setvalue,
                  )
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "Upload Your ulcer picture",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackBold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 479,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8)),
              ),
              const Spacer(),
              Center(
                child: CustomButton(
                  buttonName: "Next",
                  bgColor: AppColors.patientReviewBg,
                  borderRadius: 12,
                  onPress: () {
                    Get.back();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
