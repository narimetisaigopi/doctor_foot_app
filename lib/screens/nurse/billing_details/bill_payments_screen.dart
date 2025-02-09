import 'dart:ui';

import 'package:drfootapp/screens/dash_board/videos_screen_widgets/watch_now_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qr_bar_code/qr/src/qr_code.dart';

class BillPaymentsScreen extends StatefulWidget {
  const BillPaymentsScreen({super.key});

  @override
  State<BillPaymentsScreen> createState() => _BillPaymentsScreenState();
}

class _BillPaymentsScreenState extends State<BillPaymentsScreen> {
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
          "Title",
          style: TextStyle(
              color: AppColors.whiteBgColor,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ).tr(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Cash to be Paid",
                style: TextStyle(
                    color: AppColors.black1,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const Center(
                child: Text(
                  "₹" "399",
                  style: TextStyle(
                      color: AppColors.black1,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const WatchNowWidget(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1,
                        color: AppColors.arrowForwardBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    "Or",
                    style: TextStyle(
                        color: AppColors.black1,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                      color: AppColors.arrowForwardBlackColor,
                    ),
                  ))
                ],
              ),
              const SizedBox(height: 10),
              Stack(children: [
                Center(
                  child: QRCode(
                    size: 200,
                    data: "https://datadirr.com",
                  ),
                ),
                // Code(
                //   data: "https://datadirr.com",
                //   codeType: CodeType.qrCode(),
                // ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                ),
                Positioned(
                  left: 110,
                  right: 110,
                  bottom: 80,
                  top: 80,
                  child: Container(
                    color: AppColors.grey4,
                    width: double.infinity,
                    child: const Center(
                        child: Text(
                      "Tap to see details",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ]),
              const SizedBox(height: 8),
              Container(
                color: AppColors.whiteBgColor,
                child: Center(
                  child: CustomButton(
                    bgColor: AppColors.primaryBlue,
                    buttonName: "Collect Cash",
                    textColor: AppColors.whiteBgColor,
                    onPress: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
