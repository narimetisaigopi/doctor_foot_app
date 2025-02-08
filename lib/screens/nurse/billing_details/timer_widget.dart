import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final String timeText;
  const TimerWidget({
    super.key,
    required this.timeText,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  widget.timeText,
                  style: const TextStyle(
                      color: AppColors.abBorderColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        )
      ],
    );
  }
}
