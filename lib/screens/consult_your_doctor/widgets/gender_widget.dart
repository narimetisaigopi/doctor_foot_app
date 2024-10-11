import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  final String text;
  const GenderWidget({
    super.key,
    required this.text,
  });

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: AppColors.bookSumBorder,
          )),
      child: Padding(
        padding:
            const EdgeInsets.all(12),
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
