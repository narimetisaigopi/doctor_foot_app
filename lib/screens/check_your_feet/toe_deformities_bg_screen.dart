import 'package:drfootapp/screens/check_your_feet/toe_deformities_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ToeDeformitiesBgScreen extends StatefulWidget {
  const ToeDeformitiesBgScreen({super.key});

  @override
  State<ToeDeformitiesBgScreen> createState() => _ToeDeformitiesBgScreenState();
}

class _ToeDeformitiesBgScreenState extends State<ToeDeformitiesBgScreen> {
  @override
  void initState() {
    toeDeformities();
    super.initState();
  }

  void toeDeformities() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Utility.myBottomSheet(context,
          heightFactor: 0.5, widget: const ToeDeformitiesScreen());
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
            path: AssetsConstants.toe_deformities_bg,
            height: 343,
            width: double.infinity,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
