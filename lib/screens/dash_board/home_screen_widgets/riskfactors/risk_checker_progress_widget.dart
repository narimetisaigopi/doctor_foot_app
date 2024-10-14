import 'package:drfootapp/models/risk_cheker_response_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RiskCheckerProgressidget extends StatefulWidget {
  final RiskChekerResponseModel riskChekerResponseModel;
  const RiskCheckerProgressidget(
      {super.key, required this.riskChekerResponseModel});

  @override
  State<RiskCheckerProgressidget> createState() =>
      _RiskCheckerProgressidgetState();
}

class _RiskCheckerProgressidgetState extends State<RiskCheckerProgressidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
          height: 192,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: AppColors.primary),
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
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Your Progress",
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Icon(
                                Icons.info,
                                color: AppColors.primary,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.emoji_emotions,
                                color: AppColors.primary,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.riskChekerResponseModel.status,
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "Lorem ipsum is simply dummy text of \nthe printing and typetesting industry",
                            style: TextStyle(
                                color: AppColors.moderateTextColor,
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
                            progressColor: AppColors.primary,
                            backgroundColor: AppColors.moderateTextColor,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "${widget.riskChekerResponseModel.score}%",
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
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
                        color: AppColors.moderateTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.schedule,
                      color: AppColors.primary,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "10-09-2024",
                      style: TextStyle(
                          color: AppColors.primary,
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
