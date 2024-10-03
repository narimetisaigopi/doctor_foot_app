import 'package:drfootapp/screens/consult_your_doctor/foot_screening_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BunionsScreen extends StatefulWidget {
  const BunionsScreen({super.key});

  @override
  State<BunionsScreen> createState() => _BunionsScreenState();
}

class _BunionsScreenState extends State<BunionsScreen> {
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
                    path: AssetsConstants.bunioun_full_image,
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
                              "Bunion",
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
