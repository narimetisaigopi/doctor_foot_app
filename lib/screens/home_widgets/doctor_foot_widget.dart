import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DoctorFootWidget extends StatefulWidget {
  const DoctorFootWidget({super.key});

  @override
  State<DoctorFootWidget> createState() => _DoctorFootWidgetState();
}

class _DoctorFootWidgetState extends State<DoctorFootWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.bggrey),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomImage(
              path: AssetsConstants.logo,
              width: 156,
              height: 56,
            ),
            const SizedBox(height: 6),
            const Text(
              "Introducing Doctor Foot, an innovative app designed to monitor diabetic foot ulcers and assess the associated risks. With a focus on automating care, Doctor Foot empowers diabetic patients to manage their health more effectively, providing peace of mind and reducing the risk of serious complications.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.justify,
            ).tr(),
          ],
        ),
      ),
    );
  }
}
