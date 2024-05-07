import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

class SelectRegionWidget extends StatefulWidget {
  final String image;
  final String title;

  const SelectRegionWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<SelectRegionWidget> createState() => _SelectRegionWidgetState();
}

class _SelectRegionWidgetState extends State<SelectRegionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBorderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgImageWidget(
              height: double.infinity,
              path: widget.image,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
