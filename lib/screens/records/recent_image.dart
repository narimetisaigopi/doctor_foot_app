import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:flutter/material.dart';

class RecentImage extends StatefulWidget {
  const RecentImage({
    super.key,
  });

  @override
  State<RecentImage> createState() => _RecentImageState();
}

class _RecentImageState extends State<RecentImage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 8),
      child: Column(
        children: [
          CustomImage(
            height: 80,
            width: 80,
            path: AssetsConstants.report,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 8),
          Text(
            "Report.jpg",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.imagesTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
