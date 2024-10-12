import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final IconData iconData;
  const EmptyState(
      {super.key,
      this.message = "",
      this.iconData = Icons.hourglass_empty_outlined});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: AppColors.primary,
            size: 40,
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
