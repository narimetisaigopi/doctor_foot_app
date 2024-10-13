import 'package:drfootapp/controllers/ulcer_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../how_to_upload_ulcer_image_widget.dart';

// ignore: must_be_immutable
class UploadNoUlcerPhotosGuidePopup extends StatelessWidget {
  UlcerController ulcerController = Get.put(UlcerController());

  UploadNoUlcerPhotosGuidePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UlcerController>(builder: (ulcerController) {
      return Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text(
                  "How To Upload Ulcer Picture",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black1,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.primaryBlue,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          if (ulcerController.xfile == null)
            const HowToUploadUlcerImageWidget(
              image: AssetsConstants.how_to_upload_1,
              index: 1,
              descriptiontext:
                  'Image should be taken from the front which should revile the entire ulcer wound along with entire foot as shown in the example image. ',
            ),
          if (ulcerController.xfile2 == null)
            const HowToUploadUlcerImageWidget(
              image: AssetsConstants.how_to_upload_2,
              index: 2,
              descriptiontext:
                  'Image should be taken from the top which should revile the depth of the ulcer as shown in the example image. ',
            ),
          if (ulcerController.xfile3 == null)
            const HowToUploadUlcerImageWidget(
              image: AssetsConstants.how_to_upload_3,
              index: 3,
              descriptiontext:
                  'Image should be taken from side to locate the place of the ulcer on the feet as shown in the example image. ',
            ),
        ],
      );
    });
  }
}
