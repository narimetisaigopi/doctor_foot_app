import 'package:drfootapp/screens/nurse/risk_checker/wound_size_checker.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayedPicture extends StatefulWidget {
  const DisplayedPicture({super.key});

  @override
  State<DisplayedPicture> createState() => _DisplayedPictureState();
}

class _DisplayedPictureState extends State<DisplayedPicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_outlined,
                      color: AppColors.black1, size: 24),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            AssetsConstants.nurse_gallery,
            height: 86,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Is the wound same as displayed\npicture? ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black1),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 75, right: 75),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    buttonName: "Yes",
                    onPress: () {
                      Utility.myBottomSheet(
                        context,
                        heightFactor: 0.5,
                        widget: const WoundSizeChecker(),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomButton(
                    buttonName: "No",
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
