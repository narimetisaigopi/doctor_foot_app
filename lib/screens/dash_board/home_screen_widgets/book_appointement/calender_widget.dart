import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CalenderWidget extends StatefulWidget {
  final String formate;
  final String date;
  final Color bgColor;

  const CalenderWidget({
    super.key,
    required this.formate,
    required this.date,
      this.bgColor = AppColors.calenderGrey
  });

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.formate.toString(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.calenderTextGrey,
            ),
          ),
          Text(
            widget.date.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.calenderTextGrey,
            ),
          )
        ],
      ),
    );
  }
}
