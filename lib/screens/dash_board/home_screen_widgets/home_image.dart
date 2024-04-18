import 'dart:ui';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SvgImageWidget(
          height: 180,
          width: double.infinity,
          path: AssetsConstants.diabetes_image,
        ),
        Positioned(
          bottom: 26,
          left: 16,
          right: 16,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: const Text(
              "rectImageText",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary),
            ).tr(),
          ),
        ),
      ],
    );
  }
}
