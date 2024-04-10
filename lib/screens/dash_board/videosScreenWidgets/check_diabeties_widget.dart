import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CheckDiabetiesWidget extends StatefulWidget {
  final String image;
  final String text;
  final VoidCallback onpressed;
  const CheckDiabetiesWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.onpressed});

  @override
  State<CheckDiabetiesWidget> createState() => _CheckDiabetiesWidgetState();
}

class _CheckDiabetiesWidgetState extends State<CheckDiabetiesWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpressed,
      child: Stack(
        children: [
          SizedBox(
            height: 160,
            width: 210,
            child: SvgImageWidget(
              path: widget.image,
              width: double.infinity,
            ),
          ),
          Positioned(
            left: 36,
            bottom: 16,
            child: Text(
              widget.text,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textWhiteColor),
            ).tr(),
          )
        ],
      ),
    );
  }
}
