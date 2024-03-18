import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

class FAImageWidget extends StatefulWidget {
  final String image;
  final VoidCallback onPressed;
  const FAImageWidget(
      {super.key, required this.image, required this.onPressed});

  @override
  State<FAImageWidget> createState() => _FAImageWidgetState();
}

class _FAImageWidgetState extends State<FAImageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SvgImageWidget(
        path: widget.image,
        height: 144,
        width: 221,
      ),
    );
  }
}
