import 'package:drfootapp/screens/nurse/risk_checker/upload_ulcer_picture.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiskCheckerScreen extends StatefulWidget {
  const RiskCheckerScreen({super.key});

  @override
  State<RiskCheckerScreen> createState() => _RiskCheckerScreenState();
}

class _RiskCheckerScreenState extends State<RiskCheckerScreen> {
  @override
  void initState() {
    uploadUlcerPicture();
    super.initState();
  }

  void uploadUlcerPicture() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Utility.myBottomSheet(
        context,
        heightFactor: 0.5,
        widget: const UploadUlcerPicture(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ).tr(),
        centerTitle: true,
      ),
      backgroundColor: AppColors.bgColor,
    );
  }
}
