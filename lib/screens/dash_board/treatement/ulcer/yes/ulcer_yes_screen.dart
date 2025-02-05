import 'package:drfootapp/screens/dash_board/treatement/ulcer/yes/have_ulcer_upload_document_screen.dart';
import 'package:drfootapp/screens/dash_board/treatement/ulcer/no/have_no_ulcer_upload_bottomsheet.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UlcerYesScreen extends StatefulWidget {
  const UlcerYesScreen({super.key});

  @override
  State<UlcerYesScreen> createState() => _UlcerYesScreenState();
}

class _UlcerYesScreenState extends State<UlcerYesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: AppColors.black1,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.treatmentYesbg,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                'Did you get your treatment from \na recognized hospital?',
                style: TextStyle(
                  color: AppColors.blackBold,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                    Utility.myBottomSheet(
                      context,
                      heightFactor: 0.52,
                      widget: const HaveNoUlcerUploadBottomSheet(),
                    );
                  },
                  child: const CustomButton(
                    width: 150,
                    borderRadius: 16,
                    buttonName: "No",
                    bgColor: AppColors.treatmentYesbg,
                    textColor: AppColors.black2,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const HaveUlcerUploadDocumentScreen());
                  },
                  child: const CustomButton(
                    width: 150,
                    buttonName: "Yes",
                    borderRadius: 16,
                    bgColor: AppColors.primaryBlue,
                    textColor: AppColors.bgColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
