import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageWidget extends StatefulWidget {
  final String path;
  final double width;
  final double height;
  final BoxFit fit;
  const SvgImageWidget(
      {super.key,
      required this.path,
      this.width = 50,
      this.height = 50,
      this.fit = BoxFit.cover});

  @override
  State<SvgImageWidget> createState() => _SvgImageWidgetState();
}

class _SvgImageWidgetState extends State<SvgImageWidget> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      height: widget.height,
      width: widget.width,
      widget.path,
      fit: widget.fit,
    );
  }
}
