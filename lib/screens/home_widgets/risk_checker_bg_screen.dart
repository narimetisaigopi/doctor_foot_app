import 'package:drfootapp/screens/risk_checker_bottomsheet.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RiskCheckerBgScreen extends StatefulWidget {
  const RiskCheckerBgScreen({super.key});

  @override
  State<RiskCheckerBgScreen> createState() => _RiskCheckerBgScreenState();
}

class _RiskCheckerBgScreenState extends State<RiskCheckerBgScreen> {
  @override
  void initState() {
    riskBottom();
    super.initState();
  }

  void riskBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Utility.myBottomSheet(
        context,
        heightFactor: 0.7,
        widget: const RiskCheckerBottomSheet(),
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
          "Risk Checker",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Risk Checker :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlue,
              ),
            ),
            Text(
              "Check your risk of getting ulcer, if there are symptoms or avoiding the risk of getting diabetes.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
