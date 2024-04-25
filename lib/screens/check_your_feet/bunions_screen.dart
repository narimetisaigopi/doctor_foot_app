import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BunionsScreen extends StatefulWidget {
  const BunionsScreen({super.key});

  @override
  State<BunionsScreen> createState() => _BunionsScreenState();
}

class _BunionsScreenState extends State<BunionsScreen> {
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
          Strings.bunionsText,
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
                "Bunion:",
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
                    "A bunion (also referred to as hallux valgus) is often described as a bump on the side of the big toe. But a bunion is more than that. The visible bump actually reflects changes in the bony framework of the front part of the foot. The big toe leans toward the second toe, rather than pointing straight ahead. This throws the bones out of alignment—producing the bunion’s bump.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Bunions are a progressive disorder. They begin with a leaning of the big toe, gradually changing the angle of the bones over the years and slowly producing the characteristic bump, which becomes increasingly prominent. Symptoms usually appear at later stages, although some people never have symptoms.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Symptoms, which occur at the site of the bunion, may include:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                        Text(
                          "● Pain or soreness.\n● Inflammation and redness.\n● A burning sensation\n● Possible numbness.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: 8,
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
