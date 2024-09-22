import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Doctor Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 84,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 64,
                        backgroundColor: AppColors.buttonBg,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "DR. Narendranadh Meda",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black2,
                        ),
                      ).tr(),
                      const Text(
                        "General",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2,
                        ),
                      ).tr(),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.buttonBg,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const CustomImage(
                                path: AssetsConstants.patients,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "500+",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ).tr(),
                                  const Text(
                                    "General",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                    ),
                                  ).tr(),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Center(
                child: CustomButton(
                  bgColor: AppColors.buttonBg,
                  buttonName: "Next",
                  textColor: AppColors.whiteBgColor,
                  onPress: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
