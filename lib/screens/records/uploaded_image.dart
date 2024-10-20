import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:flutter/material.dart';

class UploadedImage extends StatefulWidget {
  final String date;
  final List imagesList;

  const UploadedImage({
    super.key,
    required this.date,
    required this.imagesList,
  });

  @override
  State<UploadedImage> createState() => _UploadedImageState();
}

class _UploadedImageState extends State<UploadedImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Date - ",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.imagesTextColor,
              ),
            ),
            Text(
              widget.date,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.imagesTextColor,
              ),
            ),
          ],
        ),
        ListView.builder(
            itemCount: widget.imagesList.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    CustomNetworkImageWidget(
                      path: widget.imagesList[index],
                      height: 104,
                      width: 104,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.imagesTextColor,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
