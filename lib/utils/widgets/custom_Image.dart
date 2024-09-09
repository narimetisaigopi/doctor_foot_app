import 'package:flutter/material.dart';

class CustomImage extends StatefulWidget {
  final String path;
  final double width;
  final double height;
  final BoxFit fit;
  const CustomImage(
      {super.key,
      required this.path,
      this.width = 50,
      this.height = 50,
      this.fit = BoxFit.cover});

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height: widget.height,
      width: widget.width,
      widget.path,
      fit: widget.fit,
    );
  }
}
