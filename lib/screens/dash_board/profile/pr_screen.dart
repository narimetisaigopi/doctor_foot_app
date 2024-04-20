import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PrScreen extends StatelessWidget {
  const PrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 75,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.whiteBgColor,
                  borderRadius: BorderRadius.circular(8)),
              child: const Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Refund Id",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey2,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "#1234567890",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackBold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Refund Amount",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey2,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "₹ 1000/-",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}