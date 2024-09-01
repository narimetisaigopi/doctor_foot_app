import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OurServiceWidget extends StatefulWidget {
  final String image;
  final String name;
  const OurServiceWidget({super.key, required this.image, required this.name});

  @override
  State<OurServiceWidget> createState() => _OurServiceWidget();
}

class _OurServiceWidget extends State<OurServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyBorderColor,
         // color: AppColors.primary,
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
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.whiteBgColor,
                // borderRadius:
                //     BorderRadius.vertical(bottom: Radius.circular(16)
                //     )
                    ),
            child: Center(
              child: Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackBold),
              ).tr(),
            ),
          ),
        ],
      ),
    );
  }
}
