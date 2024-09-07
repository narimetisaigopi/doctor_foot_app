import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HealthRecordWidget extends StatefulWidget {
  final String image;
  final String title;
  const HealthRecordWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<HealthRecordWidget> createState() => _HealthRecordWidgetState();
}

class _HealthRecordWidgetState extends State<HealthRecordWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.riskCheckBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,top: 6,bottom: 6),
            child: Image.asset(
              widget.image,
              height: 100,
              width: 70,
            ),
          ),
        ),
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ).tr(),
      ],
    );
  }
}
