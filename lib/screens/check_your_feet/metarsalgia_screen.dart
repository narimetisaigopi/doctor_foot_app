import 'package:drfootapp/screens/consult_your_doctor/foot_screening_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MetarsalgiaScreen extends StatefulWidget {
  const MetarsalgiaScreen({super.key});

  @override
  State<MetarsalgiaScreen> createState() => _MetarsalgiaScreenState();
}

class _MetarsalgiaScreenState extends State<MetarsalgiaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Check your feet",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 86,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(24)),
                          border: Border.all(
                            color: AppColors.grey,
                          )),
                      child: const Center(
                        child: CustomImage(
                          path: AssetsConstants.metatarsalgia,
                          height: 194,
                          width: 162,
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Text(
                      "Metatarsalgia:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackBold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pain and inflammation around the ball of the foot, specifically around the metatarsal bones, is referred to as metatarsalgia. These are the lengthy bones in the middle of the foot that connect the toes to the ankle. Metatarsalgia is a prevalent illness that affects people of all ages. ",
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
                          "Factors that can cause excessive pressure are:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackBold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 18, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "● Participating in high impact activities \n    without proper footwear and/or orthotics.\n● Older age as the pad in the foot tends to \n    thin out making it much more susceptible \n    pressue and pain \n● An imbalance in the length of the \n   metatarsals \n● Majority seem to be related to foot and \n   ankle deformity \n● Disturbances in gait \n● Morphology of the foot (e.g. increased \n   bone length that protrudes into the \n   bottom of the foot) \n● A shortened Achilles tendon ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textBlackColor,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Center(
                child: CustomButton(
                  bgColor: AppColors.primaryBlue,
                  buttonName: "Book appointment",
                  textColor: AppColors.whiteBgColor,
                  onPress: () {
                    Get.to(() => const FootScreeningScreen());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
