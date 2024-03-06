import 'package:doctor_foot_app/pages/discharge_report_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisChargeScreen extends StatefulWidget {
  const DisChargeScreen({super.key});

  @override
  State<DisChargeScreen> createState() => _DisChargeScreenState();
}

class _DisChargeScreenState extends State<DisChargeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          Strings.dischargeText,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, top: 24,right: 32),
        child: ListView(
          children:  [
            const Text(
              Strings.dischargeSummaryText,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackBold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              Strings.dischargText1,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackBold),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              Strings.dischargeText2,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackBold),
            ),

              SizedBox(
              height: height*0.5,
            ),
            
              CustomButton(
                buttonName: Strings.uploadText,
                onPress: (){
                  Get.to(const DischargeReportScreen());
                },
                
              ),
          
          ],
        ),
      ),
    );
  }
}
