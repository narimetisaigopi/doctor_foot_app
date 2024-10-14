import 'dart:io';

import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isFile;
  const CustomImage(
      {super.key,
      required this.path,
      this.width = 50,
      this.height = 50,
      this.isFile = false,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return isFile
        ? Image.file(
            File(path),
            height: height,
            width: width,
            fit: fit,
          )
        : Image.asset(
            height: height,
            width: width,
            path,
            fit: fit,
          );
  }
}
