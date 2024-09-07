import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CheckYourFeetWidget extends StatefulWidget {
  final String image;
  final String title;

  const CheckYourFeetWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<CheckYourFeetWidget> createState() => _CheckYourFeetWidgetState();
}

class _CheckYourFeetWidgetState extends State<CheckYourFeetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBorderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              widget.image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
