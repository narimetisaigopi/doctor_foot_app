import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RatingBookAgainLayout extends StatelessWidget {
  final Function() onRateServicePressed;
  final Function() onBookAgainPressed;
  const RatingBookAgainLayout(
      {super.key,
      required this.onRateServicePressed,
      required this.onBookAgainPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onRateServicePressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: const Row(
                children: [
                  Icon(Icons.star_outline),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Rate Service")
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 35,
            width: 1,
            color: AppColors.dividerColor,
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: onBookAgainPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Row(
                children: [
                  Icon(
                    Icons.forward_sharp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Book Again",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
