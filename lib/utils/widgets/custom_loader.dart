import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:flutter/material.dart';

import 'svg_image_widget.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SvgImageWidget(
      path: AssetsConstants.loader,
      height: 70,
    );
  }
}
