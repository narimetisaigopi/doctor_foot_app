import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FootScreeningServiceWidget extends StatefulWidget {
  final String image;
  final String title;
  const FootScreeningServiceWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<FootScreeningServiceWidget> createState() =>
      _FootScreeningServiceWidgetState();
}

class _FootScreeningServiceWidgetState
    extends State<FootScreeningServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.whiteBgColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: CustomImage(
                path: widget.image,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.whiteBgColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black2,
                  ),
                ).tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
