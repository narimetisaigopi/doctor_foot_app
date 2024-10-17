import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/screens/records/uploaded_images_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:flutter/material.dart';

class UploadedImage extends StatefulWidget {
  final UploadedImagesModel recentUploadModel;

  const UploadedImage({
    super.key,
    required this.recentUploadModel,
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
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.imagesTextColor,
              ),
            ),
            Text(
              widget.recentUploadModel.date,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.imagesTextColor,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              // CustomNetworkImageWidget(
              //   path: widget.recentUploadModel.image,
              //   height: 104,
              //   width: 104,
              // ),
              const SizedBox(height: 6),
              Text(
                widget.recentUploadModel.type,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.imagesTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
