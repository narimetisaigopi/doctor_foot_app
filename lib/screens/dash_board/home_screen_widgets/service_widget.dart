import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ServiceWidget extends StatefulWidget {
  final String image;
  final String name;
  const ServiceWidget({super.key, required this.image, required this.name});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
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
          Align(
            alignment: Alignment.center,
            child: SvgImageWidget(
              path: widget.image,
              height: 148,
              width: double.infinity,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16))),
            child: Center(
              child: Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary),
              ).tr(),
            ),
          ),
        ],
      ),
    );
  }
}
