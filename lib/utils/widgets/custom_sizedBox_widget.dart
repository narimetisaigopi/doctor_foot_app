import 'package:flutter/material.dart';

class CustomSizedBox extends StatefulWidget {
  final double width;
  final double height;
  const CustomSizedBox({
    super.key,
    this.width = 0,
    this.height = 0,
  });

  @override
  State<CustomSizedBox> createState() => _SvgImageWidgetState();
}

class _SvgImageWidgetState extends State<CustomSizedBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
    );
  }
}
