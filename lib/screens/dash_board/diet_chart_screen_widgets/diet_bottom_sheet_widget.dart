import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietBottmsheetWidget extends StatefulWidget {
  const DietBottmsheetWidget({
    super.key,
  });

  @override
  State<DietBottmsheetWidget> createState() => _DietBottmsheetWidgetState();
}

class _DietBottmsheetWidgetState extends State<DietBottmsheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "What Is Your Dietary Preference ?",
          style: TextStyle(
              color: AppColors.black1,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              width: 150,
              bgColor: AppColors.greenColor,
              buttonName: "veg",
              textColor: AppColors.whiteBgColor,
              border: false,
            ),
            CustomButton(
              width: 150,
              bgColor: AppColors.primaryBlue,
              buttonName: "Non-veg",
              textColor: AppColors.whiteBgColor,
              border: false,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Do You Prefer Diery Products?",
          style: TextStyle(
            color: AppColors.black1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              width: 150,
              bgColor: AppColors.primaryBlue,
              buttonName: "yes",
              textColor: AppColors.whiteBgColor,
              border: false,
            ),
            CustomButton(
              width: 150,
              bgColor: AppColors.greenColor,
              buttonName: "no",
              textColor: AppColors.whiteBgColor,
              border: false,
            ),
          ],
        ),
      ],
    );
  }
}
