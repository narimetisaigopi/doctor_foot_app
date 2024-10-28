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
          "What is your dietary preference?",
          style: TextStyle(
              color: AppColors.black1,
              fontSize: 18,
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
              bgColor: AppColors.primaryBlue,
              buttonName: "Veg",
              textColor: AppColors.whiteBgColor,
              border: false,
              borderRadius: 12,
            ),
            CustomButton(
              width: 150,
              bgColor: AppColors.buttonBg1,
              buttonName: "Non-veg",
              textColor: AppColors.grey,
              border: false,
              borderRadius: 12,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Do you prefer dairy product?",
          style: TextStyle(
            color: AppColors.black1,
            fontSize: 18,
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
              bgColor: AppColors.buttonBg1,
              buttonName: "Yes",
              textColor: AppColors.grey,
              border: false,
              borderRadius: 12,
            ),
            CustomButton(
              width: 150,
              bgColor: AppColors.primaryBlue,
              buttonName: "No",
              textColor: AppColors.whiteBgColor,
              border: false,
              borderRadius: 12,
            ),
          ],
        ),
      ],
    );
  }
}
