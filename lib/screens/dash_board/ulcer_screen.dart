import 'package:doctor_foot_app/screens/dash_board/ulcerMonitor_widgets/basicPlan_widget.dart';
import 'package:doctor_foot_app/screens/dash_board/ulcerMonitor_widgets/premiumPlan_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

class UlcerScreen extends StatefulWidget {
  const UlcerScreen({super.key});

  @override
  State<UlcerScreen> createState() => _UlcerScreenState();
}

class _UlcerScreenState extends State<UlcerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text(Strings.ulcerMonitorText),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
          color: AppColors.secondary,
          child: const Column(
            children: [
              BasicPlanWidget(),
              SizedBox(
                height: 22,
              ),
              PremiumPlanWidget()
            ],
          ),
        ),
      ),
    );
  }
}
