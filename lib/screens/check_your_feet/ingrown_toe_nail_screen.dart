import 'package:drfootapp/screens/consult_your_doctor/foot_screening_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngrownToeNailScreen extends StatefulWidget {
  const IngrownToeNailScreen({super.key});

  @override
  State<IngrownToeNailScreen> createState() => _IngrownToeNailScreenState();
}

class _IngrownToeNailScreenState extends State<IngrownToeNailScreen> {
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
            flex: 84,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImage(
                    height: 196,
                    width: double.infinity,
                    path: AssetsConstants.ingrow_toe_nail_full_image,
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
                              "Ingrown Toe Nails",
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
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "An ingrown toenail occurs when the side or corner of the nail digs into the skin of the toe. This happens mostly to the big toenail, but it can happen to any toenail. ",
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
                          "CAUSES:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          " ● Wearing shoes that do not fit well.\n ● Incorrectly cutting your toenails is another \n    main cause. Toenails that are peeled off at the \n    edge or trimmed down at the corners are \n    more likely to become ingrown.\n● An injury to your toe also can cause an \n    ingrown toenail.\n● People who have deformed or misshaped \n    toenails have a higher risk of ingrown toenails.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "To avoid ingrown toenails, cut your nails straight across. The top of your nail should make a straight line. Do not pick at your nails or tear them at the corners. Wear shoes that fit correctly and allow plenty of room for your toes. Avoid high heels and tight-fitting shoes.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: 22,
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
