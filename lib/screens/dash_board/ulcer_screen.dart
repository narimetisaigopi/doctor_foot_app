import 'package:bulleted_list/bulleted_list.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UlcerScreen extends StatefulWidget {
  const UlcerScreen({super.key});

  @override
  State<UlcerScreen> createState() => _UlcerScreenState();
}

class _UlcerScreenState extends State<UlcerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          child: Column(
            children: [
              Container(
                height: size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.freePlanBgColor,
                  border: Border.all(color: Colors.amber, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 16),
                      child: Text(
                        Strings.basicPlanText,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.textBackColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        Strings.freeText,
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700),
                      ),
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
                      height: 08,
                    ),
                    const Center(
                      child: CustomButton(
                        buttonName: Strings.getStartedButton,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: size.height * 0.47,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16,top: 16),
                      child: Text(
                        Strings.premiumPlanText,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.textBackColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 08,),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        Strings.planAmountText,
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                         const SizedBox(height: 08,),
                    BulletedList(
                      listItems: names,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textBackColor,
                        fontWeight: FontWeight.w400,
                      ),
                      bulletColor: AppColors.textBackColor,
                      bulletType: BulletType.conventional,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Center(
                      child: CustomButton(
                        buttonName: Strings.getStartedButton,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
