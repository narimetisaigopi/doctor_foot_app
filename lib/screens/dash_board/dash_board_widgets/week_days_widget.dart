import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class WeekDaysWidget extends StatefulWidget {
  const WeekDaysWidget({super.key});

  @override
  State<WeekDaysWidget> createState() => _WeekDaysWidgetState();
}

class _WeekDaysWidgetState extends State<WeekDaysWidget> {
    int selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
                height: size.height * 0.058,
                width: double.infinity,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 16,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: weekDays.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.grey2,
                              borderRadius: BorderRadius.circular(16)),
                          height: size.height * 0.058,
                          width: size.width * 0.35,
                          child: Center(
                              child: Text(
                            weekDays[index],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          )),
                        ),
                      );
                    }),
              );
  }
}