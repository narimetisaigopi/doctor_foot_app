import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AchillesTendonitisScreen extends StatefulWidget {
  const AchillesTendonitisScreen({super.key});

  @override
  State<AchillesTendonitisScreen> createState() => _AchillesTendonitisScreenState();
}

class _AchillesTendonitisScreenState extends State<AchillesTendonitisScreen> {
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
          "Achilles Tendonitis",
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
              height: 220,
              width: double.infinity,
              path: AssetsConstants.diabetes_image,
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Achilles Tendonitis:",
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
                    "An overuse injury to the Achilles tendon, which connects your heel bone to the calf muscles at the rear of your lower leg, is known as Achilles tendonitis.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "Achilles tendonitis most frequently affects runners who have abruptly increased their run length or intensity. It's also typical among middle-aged individuals who participate in weekend-only activities like basketball or tennis. ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                   SizedBox(height: 8,),
                  Text(
                    "Under your doctor's guidance, the majority of cases of Achilles tendinitis can be treated with reasonably straightforward at-home care. In most cases, self-care techniques are required to stop recurrent episodes. Severe instances of Achilles tendinitis can result in tendon ruptures or rips, which may need to be surgically repaired.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                 
                  SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    buttonName: "Next",
                    isBoxShadow: false,
                  ),
                  SizedBox(
                    height: 24,
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
