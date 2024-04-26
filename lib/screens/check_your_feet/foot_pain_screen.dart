import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

class FootPainScreen extends StatefulWidget {
  const FootPainScreen({super.key});

  @override
  State<FootPainScreen> createState() => _FootPainScreenState();
}

class _FootPainScreenState extends State<FootPainScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Center(
              child: SvgImageWidget(
                height: 200,
                width: double.infinity,
                path: AssetsConstants.HbA1C,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Center(
              child: Text(
                "Select the region of \n    your foot pain",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackBold,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 180,
                  buttonName: "No",
                  isBoxShadow: false,
                  bgColor: AppColors.secondaryButton,
                  border: false,
                  onPress: () {},
                ),
                CustomButton(
                  width: 180,
                  buttonName: "Confirm",
                  isBoxShadow: false,
                  bgColor: AppColors.secondaryButton,
                  border: false,
                  onPress: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
