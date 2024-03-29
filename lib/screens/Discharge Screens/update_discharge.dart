import 'package:doctor_foot_app/screens/Discharge%20Screens/file_upload_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateDischarge extends StatefulWidget {
  const UpdateDischarge({super.key});

  @override
  State<UpdateDischarge> createState() => _UpdateDischargeState();
}

class _UpdateDischargeState extends State<UpdateDischarge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text(
          "dischargeText",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ).tr(),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, top: 16,bottom: 16),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discharge Summary",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBold),
                ),
                 SizedBox(
                  height: 8,
                ),
                Text(
                   Strings.dischargeText1,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  Strings.dischargeText2,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor),
                ),
              ],
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonName: Strings.uploadHearText,
                  onPress: (){
Get.to(const FileUploadScreen());
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
