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
        title: Text(Strings.ulcerMonitorText),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 18,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.premiumPlan,
              style: GoogleFonts.dmSans().copyWith(
                  fontSize: 24,
                  color: AppColors.blackTextColor,
                  fontWeight: FontWeight.w700),
            ),
            BulletedList(
              listItems: names,
              style: GoogleFonts.dmSans().copyWith(
                  fontSize: 14,
                  color: AppColors.blackTextColor,
                  fontWeight: FontWeight.w400),
              bulletColor: AppColors.blackTextColor,
              bulletType: BulletType.conventional,
            ),
                        const SizedBox(height: 24,),

           const Center(
              child: CustomButton(
                btnName: Strings.premiumPlanAamount,
               
              ),
            ),
            const SizedBox(height: 24,),
             Divider(),
            Text(
              Strings.freePlan,
              style: GoogleFonts.dmSans().copyWith(
                  fontSize: 24,
                  color: AppColors.blackTextColor,
                  fontWeight: FontWeight.w700),
            ),
              BulletedList(
              listItems: names2,
              style: GoogleFonts.dmSans().copyWith(
                  fontSize: 14,
                  color: AppColors.blackTextColor,
                  fontWeight: FontWeight.w400),
              bulletColor: AppColors.blackTextColor,
              bulletType: BulletType.conventional,
            ),
                        const SizedBox(height: 24,),

            const Center(
              child:  CustomButton(
                  btnName: Strings.freePlanb,
                 
                ),
            ),
          ],
        ),
      ),
    );
  }

}
