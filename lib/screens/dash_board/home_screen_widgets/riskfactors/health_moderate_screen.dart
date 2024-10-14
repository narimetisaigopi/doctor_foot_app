import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HealthModerateWwidget extends StatefulWidget {
  const HealthModerateWwidget({super.key});

  @override
  State<HealthModerateWwidget> createState() => _HealthModerateWwidgetState();
}

class _HealthModerateWwidgetState extends State<HealthModerateWwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
          height: 192,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 3,
                color: AppColors.primaryBlue,
              ),
              color: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Your Progress",
                                style: TextStyle(
                                    color: AppColors.primaryBlue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Icon(
                                Icons.info,
                                color: AppColors.primaryBlue,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.emoji_emotions,
                                color: AppColors.primaryBlue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Moderate",
                                style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Lorem ipsum is simply dummy text of \nthe printing and typetesting industry",
                            style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Center(
                          child: CircularPercentIndicator(
                            radius: 55,
                            lineWidth: 12,
                            percent: 0.24,
                            progressColor: AppColors.primaryBlue,
                            backgroundColor: AppColors.moderateBgColor,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: const Text(
                              "24%",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Last Time You Took Test :",
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.schedule,
                      color: AppColors.primaryBlue,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "10-09-2024",
                      style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
