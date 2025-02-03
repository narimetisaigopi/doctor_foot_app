import 'package:drfootapp/screens/dash_board/videos_screen_widgets/watch_now_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              color: AppColors.whiteBgColor,
            ),
          ),
          backgroundColor: AppColors.primaryBlue,
          title: const Text(
            "Client",
            style: TextStyle(
                color: AppColors.whiteBgColor,
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ).tr(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const WatchNowWidget(),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteBgColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AssetsConstants.delivery_bike,
                              height: 32,
                              width: 32,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "Have you reached location safely?",
                              style: TextStyle(
                                color: AppColors.black2,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ).tr(),
                          ],
                        ),
                        const SizedBox(width: 22),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const CustomButton(
                                width: 150,
                                buttonName: "Yes",
                                borderRadius: 16,
                                bgColor: AppColors.primaryBlue,
                                textColor: AppColors.bgColor,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const CustomButton(
                                width: 150,
                                borderRadius: 16,
                                buttonName: "No",
                                bgColor: AppColors.treatmentYesbg,
                                textColor: AppColors.black2,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
