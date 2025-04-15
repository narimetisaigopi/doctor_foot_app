import 'package:drfootapp/screens/nurse/billing_details/treatement_started_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiskCheckerTreatementScreen extends StatefulWidget {
  const RiskCheckerTreatementScreen({super.key});

  @override
  State<RiskCheckerTreatementScreen> createState() => _RiskCheckerTreatementScreenState();
}

class _RiskCheckerTreatementScreenState extends State<RiskCheckerTreatementScreen> {
    @override
  void initState() {
    treatementStared();
    super.initState();
  }

  void treatementStared() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    
      await     Utility.myBottomSheet(context,
                            heightFactor: 0.7, widget: const TreatementStartedWidget());
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.secondary,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
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
       body:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            path: AssetsConstants.treatement_started,
            height: 280,
            width: double.infinity,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}