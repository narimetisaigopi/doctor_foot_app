import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ClawToeScreen extends StatefulWidget {
  const ClawToeScreen({super.key});

  @override
  State<ClawToeScreen> createState() => _ClawToeScreenState();
}

class _ClawToeScreenState extends State<ClawToeScreen> {
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
          Strings.clawToeText,
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
                "Claw Toe:",
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
                    "Claw toe is a common foot deformity in which your toes bend into a claw-like position, digging down into the soles of your shoes and creating painful calluses on the top or tips of the toes. People often blame claw toe on wearing shoes that squeeze your toes, such as shoes that are too short or high heels. However, claw toes often are the result of nerve damage caused by diseases like diabetes or alcoholism, which can weaken the muscles in your foot. Claw toes can get worse without treatment and may become a permanent deformity over time.",
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
                    "There are several signs of claw toe:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackBold,
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
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          " ● Your toes are bent upward (extension) \n    from the joints at the ball of the foot.\n● Your toes are bent downward (flexion) at \n    the middle joints toward the sole of your \n    shoe.\n● Sometimes your toes also bend \n    downward at the top joints, curling under \n    the foot.",
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
