import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.primary),
      child: Text(
        message,
        style: const TextStyle(fontSize: 18, color: AppColors.whiteBgColor),
      ),
    );
  }
}
