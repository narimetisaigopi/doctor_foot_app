import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CornsScreen extends StatefulWidget {
  const CornsScreen({super.key});

  @override
  State<CornsScreen> createState() => _CornsScreenState();
}

class _CornsScreenState extends State<CornsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          Strings.cornsText,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ).tr(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgImageWidget(
              height: 236,
              width: double.infinity,
              path: AssetsConstants.diabetes_image,
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Corn:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackBold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Calluses develop as a normal response to chronic excessive friction and pressure. They are protective pads made up of a thickened upper layer of skin. Corns are small calluses that develop on the top of the toes due to pressure or rubbing against shoes or other toes. Both can be the result of poorly fitting shoes, abnormal foot function, or high activity levels",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                    buttonName: "Next",
                    isBoxShadow: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
