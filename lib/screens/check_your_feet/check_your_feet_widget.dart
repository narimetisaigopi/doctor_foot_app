import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
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
          flex: 8,
          child: CustomImage(
            path: widget.image,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              widget.title.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.black2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
