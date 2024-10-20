import 'package:drfootapp/controllers/ulcer_monitoring_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:drfootapp/utils/widgets/custom_circular_loader.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants/assets_constants.dart';
import '../../../utils/widgets/custom_button.dart';

class UlcerMonitoringUploadDocumentsScreen extends StatefulWidget {
  const UlcerMonitoringUploadDocumentsScreen({super.key});

  @override
  State<UlcerMonitoringUploadDocumentsScreen> createState() =>
      _UlcerMonitoringUploadDocumentsScreenState();
}

class _UlcerMonitoringUploadDocumentsScreenState
    extends State<UlcerMonitoringUploadDocumentsScreen> {
  final PageController controller = PageController();
  UlcerMonitoringController ulcerMonitoringController =
      Get.put(UlcerMonitoringController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UlcerMonitoringController>(
        builder: (ulcerMonitoringController) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: const CustomAppbar(
          title: "Premium",
        ),
        body: Column(
          children: [
            Expanded(
              flex: 82,
              child: Container(
                color: AppColors.whiteBgColor,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Premium Plan",
                        style: TextStyle(
                          color: AppColors.black1,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: SizedBox(
                          child: PageView.builder(
                              controller: controller,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return imagePreviewWidget(index);
                              }),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 5,
                          effect: const ScrollingDotsEffect(
                            activeDotColor: AppColors.primaryBlue,
                            dotHeight: 08,
                            dotWidth: 08,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 16,
              child: Container(
                color: AppColors.whiteBgColor,
                child: Center(
                  child: ulcerMonitoringController.isLoading
                      ? const CustomCircularLoader()
                      : CustomButton(
                          bgColor: AppColors.primaryBlue,
                          buttonName: "Upload",
                          textColor: AppColors.whiteBgColor,
                          onPress: () {
                            if (ulcerMonitoringController
                                .selectedImagesList.isEmpty) {
                              Utility.toast("Upload images");
                            } else {
                              ulcerMonitoringController
                                  .addUlcerMonitoringRecord();
                            }
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget imagePreviewWidget(int index) {
    bool isImagePicked =
        ulcerMonitoringController.selectedImagesList.length > index;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gallaryBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
          onTap: () async {
            XFile? xFile = await ImagePicker().pickMedia();
            ulcerMonitoringController.onImageSelect(xFile, index);
          },
          child: Center(
              child: CustomImage(
            path: isImagePicked
                ? ulcerMonitoringController.selectedImagesList[index].path
                : AssetsConstants.gallery_image,
            height: 311,
            width: 311,
            isFile: isImagePicked,
          ))),
    );
  }
}
