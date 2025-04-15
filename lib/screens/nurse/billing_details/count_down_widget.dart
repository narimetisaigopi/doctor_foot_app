import 'package:drfootapp/screens/nurse/billing_details/timer_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CountDownWidget extends StatefulWidget {
  final String min;
  final String sec;
  const CountDownWidget({super.key, this.min = "00", this.sec = "00"});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  @override
  Widget build(BuildContext context) {
    String minPostion = "0", minPostion2 = "0";
    String secPostion = "0", secPostion2 = "0";
    if (widget.min.isNotEmpty) minPostion = widget.min[0];
    if (widget.min.length == 2) minPostion2 = widget.min[1];
    if (widget.sec.isNotEmpty) secPostion = widget.min[0];
    if (widget.sec.length == 2) secPostion2 = widget.min[1];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                thickness: 2,
              ),
            )),
            TimerWidget(timeText: minPostion), // First digit of minutes
            TimerWidget(timeText: minPostion2), // Second digit of minutes
            const Text(":",
                style: TextStyle(
                    color: AppColors.bottomSheetBackgroundColor,
                    fontSize: 46,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 5,
            ),
            TimerWidget(timeText: secPostion), // First digit of seconds
            TimerWidget(timeText: secPostion2), // Second digit of seconds
            const Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                thickness: 2,
              ),
            )),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "MIN",
                style: TextStyle(
                    color: AppColors.bottomSheetBackgroundColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "SEC",
                style: TextStyle(
                    color: AppColors.bottomSheetBackgroundColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
