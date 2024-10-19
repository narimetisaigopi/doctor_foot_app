import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class FootServiceMenuWidget extends StatefulWidget {
  final String image;
  final String title;

  const FootServiceMenuWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<FootServiceMenuWidget> createState() => _FootServiceMenuWidgetState();
}

class _FootServiceMenuWidgetState extends State<FootServiceMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBorderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: CustomImage(
              height: double.infinity,
              path: widget.image,
              width: double.infinity,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.blackBold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
