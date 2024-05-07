import 'package:drfootapp/screens/discharge_screens/popup2_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

class PopUp1Widget extends StatefulWidget {
  const PopUp1Widget({super.key});

  @override
  State<PopUp1Widget> createState() => _PopUp1WidgetState();
}

class _PopUp1WidgetState extends State<PopUp1Widget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 30),
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
                height: 120,
                width: double.infinity,
                path: AssetsConstants.HbA1C,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Center(
              child: Text(
                "Do you have ulcer on\n         your feet?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackBold,
                ),
              ),
            ),
            const SizedBox(
              height: 22,
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
                  buttonName: "Yes",
                  isBoxShadow: false,
                  bgColor: AppColors.secondaryButton,
                  border: false,
                  onPress: () {
                       Utility.myBottomSheet(context,
                                heightFactor: 0.5,
                                widget: const PopUp2Widget());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
