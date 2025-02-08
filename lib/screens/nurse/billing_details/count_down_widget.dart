import 'package:drfootapp/screens/nurse/billing_details/timer_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CountDownWidget extends StatefulWidget {
  const CountDownWidget({super.key});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                thickness: 2,
              ),
            )),
            TimerWidget(timeText: "4"),
            TimerWidget(timeText: "4"),
            Text(":",
                style: TextStyle(
                    color: AppColors.bottomSheetBackgroundColor,
                    fontSize: 46,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: 5,
            ),
            TimerWidget(
              timeText: "4",
            ),
            TimerWidget(
              timeText: "4",
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                thickness: 2,
              ),
            )),
          ],
        ),
        Padding(
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
