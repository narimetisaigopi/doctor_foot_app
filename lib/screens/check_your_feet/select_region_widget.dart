import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class SelectRegionWidget extends StatefulWidget {
  final String image;

  const SelectRegionWidget({
    super.key,
    required this.image,
  });

  @override
  State<SelectRegionWidget> createState() => _SelectRegionWidgetState();
}

class _SelectRegionWidgetState extends State<SelectRegionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CustomImage(
            path: widget.image,
            height: 295,
            width: 295,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
