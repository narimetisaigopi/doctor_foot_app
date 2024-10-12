import 'package:drfootapp/screens/consult_your_doctor/foot_screening_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChaecotFootScreen extends StatefulWidget {
  const ChaecotFootScreen({super.key});

  @override
  State<ChaecotFootScreen> createState() => _ChaecotFootScreenState();
}

class _ChaecotFootScreenState extends State<ChaecotFootScreen> {
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
          const Expanded(
            flex: 86,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImage(
                    height: 196,
                    width: double.infinity,
                    path: AssetsConstants.charchot_feet_full_image,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Charcot Foot",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackBold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.ratingBarColor,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "4.4",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackBold,
                                  ),
                                ),
                                Text(
                                  "(320)",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Corner of the nail digs \ninto the skin of the toe",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "₹399/-",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black2,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "₹499/-",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.secondary,
                    thickness: 6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Charcot foot can result from complete or near-complete numbness in one or both feet or ankles. This condition causes the bones in the foot to become weak, making them prone to damage such as fractures and dislocation. ",
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
                          "Because the foot is numb, pain from fractures or other traumas can go unnoticed, leading to additional damage from walking and standing.",
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
                          "As the bones continue to weaken, the joints of the foot can become dislocated or collapse, changing the foot’s shape. The resulting shape is referred to as rocker-bottom foot, since the arch extends down and out, creating a rocker-like appearance. ",
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
                          "Charcot foot can also lead to the occurrence of sores, which are hard to heal. If left untreated, Charcot foot can lead to severe deformity, disability, or amputation.",
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
                          "Charcot foot is most closely associated as a rare complication of diabetes, but peripheral neuropathy is associated with several conditions. ",
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
                                "These include:\n  ● diabetes\n  ● alcohol use disorder\n  ● drug abuse\n  ● Hansen’s disease (leprosy)\n  ● syphilis\n  ● syringomyelia\n  ● polio\n  ● infection, trauma, or damage in the \n     peripheral nerves\n  ● HIV\n  ● Parkinson’s disease\n  ● inflammatory conditions, such as \n     sarcoidosis or psoriasis ",
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
