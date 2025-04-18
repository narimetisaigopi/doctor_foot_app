import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:flutter/material.dart';

class BookPremiumPlanWidget extends StatefulWidget {
  final Function()? onPress;
  const BookPremiumPlanWidget({
    super.key,
    required this.onPress,
  });

  @override
  State<BookPremiumPlanWidget> createState() => _BookPremiumPlanWidgetState();
}

class _BookPremiumPlanWidgetState extends State<BookPremiumPlanWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "BOOK PREMIUM PLAN",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteBgColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "TO GET EXPERTS ADVICE DAILY\nREGARDING YOUR ULCERS",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteBgColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.whiteBgColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 22, right: 22, top: 8, bottom: 8),
                        child: Text(
                          "Explore Now",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  AssetsConstants.book_premium_plan_image,
                  height: 172,
                  width: 112,
                  alignment: Alignment.bottomCenter,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
