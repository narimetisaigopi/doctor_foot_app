import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:drfootapp/utils/widgets/full_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthRecordWidget extends StatefulWidget {
  final dynamic date;
  final List imagesList;

  const HealthRecordWidget({
    super.key,
    required this.date,
    required this.imagesList,
  });

  @override
  State<HealthRecordWidget> createState() => _HealthRecordWidgetState();
}

class _HealthRecordWidgetState extends State<HealthRecordWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Date - ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.imagesTextColor,
                ),
              ),
              Text(
                Utility.convertTimeStamp(widget.date.toDate()),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.imagesTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: widget.imagesList.length,
                itemBuilder: (ctx, index) {
                  String url = widget.imagesList[index];
                  return imageAndFileName(url: url);
                }),
          ),
        ],
      ),
    );
  }
}

Widget imageAndFileName(
    {required String url, double width = 94, double height = 94}) {
  return InkWell(
    onTap: () {
      Get.to(() => FullScreenImageViewer(imageUrl: url));
    },
    child: Container(
      height: height + 10,
      width: width + 10,
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 4, right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomNetworkImageWidget(
                path: url,
                height: height,
                width: width,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            Utility.getFileNameFromUrl(url),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.black1,
            ),
          ),
        ],
      ),
    ),
  );
}
