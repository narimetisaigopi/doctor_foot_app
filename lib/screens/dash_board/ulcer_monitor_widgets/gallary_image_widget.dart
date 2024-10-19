import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class GallaryImageWidget extends StatefulWidget {
  const GallaryImageWidget({super.key});

  @override
  State<GallaryImageWidget> createState() => _GallaryImageWidgetState();
}

class _GallaryImageWidgetState extends State<GallaryImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gallaryBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: CustomImage(
          path: AssetsConstants.gallery_image,
          height: 311,
          width: 311,
        ),
      ),
    );
  }
}
