import 'package:bulleted_list/bulleted_list.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: ListView(
          children: [
            const Text(
              Strings.premiumPlan,
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w700),
            ),
            BulletedList(
              listItems: names,
              style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w400,),
              bulletColor: AppColors.textBackColor,
              bulletType: BulletType.conventional,
            ),
            const SizedBox(
              height: 24,
            ),
            const Center(
              child: CustomButton(
                buttonName: Strings.premiumPlanAamount,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Divider(),
            const Text(
              Strings.freePlan,
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w700),
            ),
            BulletedList(
              listItems: names2,
              style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w400),
              bulletColor: AppColors.textBackColor,
              bulletType: BulletType.conventional,
            ),
            const SizedBox(
              height: 24,
            ),
            const Center(
              child: CustomButton(
                buttonName: Strings.freePlanb,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
