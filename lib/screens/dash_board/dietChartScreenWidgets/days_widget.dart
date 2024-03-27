import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DaysWidget extends StatefulWidget {
  final String text;
  const DaysWidget({super.key, required this.text});

  @override
  State<DaysWidget> createState() => _DaysWidgetState();
}

class _DaysWidgetState extends State<DaysWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.daysBgColor,
            borderRadius: BorderRadius.circular(16)),
        height: size.height * 0.058,
        width: size.width * 0.35,
        child: Center(
            child: Text(
          widget.text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ).tr()),
      ),
    );
  }
}
