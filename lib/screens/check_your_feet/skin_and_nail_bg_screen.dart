import 'package:drfootapp/screens/check_your_feet/skin_nail_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CheckYourFeetBgScreen extends StatefulWidget {
  const CheckYourFeetBgScreen({super.key});

  @override
  State<CheckYourFeetBgScreen> createState() => _CheckYourFeetBgScreenState();
}

class _CheckYourFeetBgScreenState extends State<CheckYourFeetBgScreen> {
  @override
  void initState() {
    skinAndNail();
    super.initState();
  }

  void skinAndNail() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Utility.myBottomSheet(
        context,
        heightFactor: 0.56,
        widget: const SkinAndNailScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            path: AssetsConstants.skin_and_nail_bg,
            height: 238,
            width: double.infinity,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
