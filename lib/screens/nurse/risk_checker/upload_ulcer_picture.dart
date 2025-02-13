import 'package:drfootapp/screens/nurse/risk_checker/reached_location.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadUlcerPicture extends StatefulWidget {
  const UploadUlcerPicture({
    super.key,
  });

  @override
  State<UploadUlcerPicture> createState() => _UploadUlcerPictureState();
}

class _UploadUlcerPictureState extends State<UploadUlcerPicture> {
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
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black1,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "UPLOAD YOUR CLEAR PICTURE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            AssetsConstants.nurse_ulcer_picture,
            height: 112,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'We are requesting you to upload your \nclear picture so that experts can \nprovide a suitable remedy',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: AppColors.black1),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 75, right: 75),
            child: CustomButton(
              buttonName: "Next",
              onPress: () {
                Utility.myBottomSheet(
                  context,
                  heightFactor: 0.5,
                  widget: const ReachedLocation(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
