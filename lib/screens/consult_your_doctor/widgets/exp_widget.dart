import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ExpWidget extends StatefulWidget {
  final String image;
  final String totolCount;
  final String title;
  final Color bgColor;
  const ExpWidget({
    super.key,
    required this.image,
    required this.totolCount,
    required this.title,
    this.bgColor = AppColors.whiteBgColor,
  });

  @override
  State<ExpWidget> createState() => _ExpWidgetState();
}

class _ExpWidgetState extends State<ExpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomImage(
              height: 24,
              width: 24,
              path: widget.image,
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.totolCount,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ).tr(),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                ).tr(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
