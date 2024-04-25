import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PlantarWartsScreen extends StatefulWidget {
  const PlantarWartsScreen({super.key});

  @override
  State<PlantarWartsScreen> createState() => _PlantarWartsScreenState();
}

class _PlantarWartsScreenState extends State<PlantarWartsScreen> {
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
          "Plantar Warts",
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
            SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Plantar Warts:",
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
                    "Plantar warts (verruca plantaris) are benign (not harmful) rough bumps that form on the soles of your feet. They develop when the human papillomavirus (HPV) enters a cut or break in your skin and causes an infection. ",
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
                    "Symptoms include:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                 
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "● Rough, thick surface that may look like \n   cauliflower.\n● Discoloration (dark pink, yellow, brown, purple, or gray) \n● Dotted with brown or black specks\n● Pain or tenderness \n● Discomfort \n● Bleeding",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Treatments include over-the-counter remedies, salicylic acid, freezing medicine or surgery.",
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
