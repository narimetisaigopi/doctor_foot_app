import 'package:cached_network_image/cached_network_image.dart';
import 'package:drfootapp/utils/widgets/custom_circular_loader.dart';
import 'package:flutter/material.dart';

class CustomNetworkImageWidget extends StatefulWidget {
  final String path;
  final double width;
  final double height;
  final double radius;
  final BoxFit fit;
  final bool isCircle;
  const CustomNetworkImageWidget(
      {super.key,
      required this.path,
      this.width = 50,
      this.height = 50,
      this.radius = 30,
      this.isCircle = false,
      this.fit = BoxFit.cover});

  @override
  State<CustomNetworkImageWidget> createState() =>
      _CustomNetworkImageWidgetState();
}

class _CustomNetworkImageWidgetState extends State<CustomNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isCircle
        ? CircleAvatar(
            radius: widget.radius,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: widget.path,
                fit: BoxFit.cover,
                width: widget.width,
                height: widget.height,
              ),
            ),
          )
        : CachedNetworkImage(
      height: widget.height,
      width: widget.width,
      imageUrl: widget.path,
      fit: widget.fit,
      placeholder: (context, url) {
        return const CustomCircularLoader();
      },
      errorWidget: (context, url, error) {
        return const Icon(Icons.image);
      },
    );
  }
}
