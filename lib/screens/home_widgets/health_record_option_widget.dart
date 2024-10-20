import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HealthRecordOptionWidget extends StatefulWidget {
  final String image;
  final String title;
  const HealthRecordOptionWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<HealthRecordOptionWidget> createState() =>
      _HealthRecordOptionWidgetState();
}

class _HealthRecordOptionWidgetState extends State<HealthRecordOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.riskCheckBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 22, right: 22, top: 20, bottom: 20),
              child: CustomImage(
                path: widget.image,
                height: 52,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              widget.title.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black1,
              ),
            ).tr(),
          ),
        )
      ],
    );
  }
}
