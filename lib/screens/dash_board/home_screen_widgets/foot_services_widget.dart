import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:flutter/material.dart';

class FootServicesWidget extends StatefulWidget {
  final String image;
  final String title;

  const FootServicesWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<FootServicesWidget> createState() => _FootServicesWidgetState();
}

class _FootServicesWidgetState extends State<FootServicesWidget> {
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
