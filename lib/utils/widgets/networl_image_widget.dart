import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatefulWidget {
  final String path;
  final double width;
  final double height;
  final BoxFit fit;
  const NetworkImageWidget(
      {super.key,
      required this.path,
      this.width = 50,
      this.height = 50,
      this.fit = BoxFit.cover});

  @override
  State<NetworkImageWidget> createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: widget.height,
      width: widget.width,
      imageUrl: widget.path,
      fit: widget.fit,
      errorWidget: (context, url, error) {
        return Icon(Icons.image);
      },
    );
  }
}
