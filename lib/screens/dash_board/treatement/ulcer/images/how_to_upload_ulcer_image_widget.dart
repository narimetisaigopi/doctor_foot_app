import 'package:drfootapp/controllers/have_ulcer_controller.dart';
import 'package:drfootapp/screens/dash_board/treatement/ulcer/images/have_ulcer_preview_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HowToUploadUlcerImageWidget extends StatefulWidget {
  final String image;
  final String descriptiontext;
  final int index;
  const HowToUploadUlcerImageWidget({
    super.key,
    required this.image,
    this.index = 0,
    required this.descriptiontext,
  });

  @override
  State<HowToUploadUlcerImageWidget> createState() =>
      _HowToUploadUlcerImageWidgetState();
}

class _HowToUploadUlcerImageWidgetState
    extends State<HowToUploadUlcerImageWidget> {
  HaveUlcerController ulcerController = Get.put(HaveUlcerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HaveUlcerController>(builder: (ulcerController) {
      return InkWell(
        onTap: () async {
          ulcerController.pickFile(widget.index).then((e) {
            if (e != null) {
              Get.to(() => const HaveUlcerPreviewScreen());
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 140,
                width: double.infinity,
                child: Card(
                  color: AppColors.bggrey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 4, right: 4, top: 8, bottom: 4),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: CustomImage(
                              path: widget.image,
                              height: 116,
                              width: 90,
                              fit: BoxFit.contain,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Image ${widget.index}: ",
                                  style: const TextStyle(
                                      color: AppColors.black1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  widget.descriptiontext,
                                  style: const TextStyle(
                                    color: AppColors.black3,
                                    fontSize: 11,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.start,
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
