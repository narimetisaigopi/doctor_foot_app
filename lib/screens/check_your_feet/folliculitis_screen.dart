import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FolliculitisScreen extends StatefulWidget {
  const FolliculitisScreen({super.key});

  @override
  State<FolliculitisScreen> createState() => _FolliculitisScreenState();
}

class _FolliculitisScreenState extends State<FolliculitisScreen> {
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
          "Folliculitis",
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
                "Folliculitis:",
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
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Folliculitis is a skin disorder involving the inflammation of hair follicles. It is typically due to an infection and results in irritated pimple-like spots or pustules. Antibiotic or antifungal creams and other therapies can help.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Folliculitis affectsTrusted Source the hair-bearing areas of the body, often the arms, head, and face. The condition presents small discolored bumps that may have a white, pus-filled tip.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "In most cases, folliculitis is a harmless condition. However, it can progress to a more serious disease in people with compromised immune systems.\n● Staphylococcus aureus is the most common \n    infectious cause of folliculitis.\n●In most cases, folliculitis will disappear \n    independently.\n● The most common cause of folliculitis is \n    damage to the hair follicle.\n● Improper shaving techniques, tight clothing, \n    skin rubbing, and some medications can all \n    cause follicle damage.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                 
                  SizedBox(
                    height: 34,
                  ),
                  CustomButton(
                    buttonName: "Next",
                    isBoxShadow: false,
                  ),
                  SizedBox(
                    height: 34,
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
