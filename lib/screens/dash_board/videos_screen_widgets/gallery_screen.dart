import 'package:drfootapp/screens/check_internet_connection/network_connection_screen.dart';
import 'package:drfootapp/screens/dash_board/ulcer_monitor_widgets/gallary_image_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/widgets/custom_button.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.whiteBgColor,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          "Premium",
          style: TextStyle(
              color: AppColors.whiteBgColor,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ).tr(),
        centerTitle: true,
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
                              return const GallaryImageWidget();
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
                child: CustomButton(
                  bgColor: AppColors.whiteBgColor,
                  buttonName: "Upload",
                  textColor: AppColors.primaryBlue,
                  border: true,
                  onPress: () {
                    Get.to(() => const NetworkConnectionScreen(
                          image: AssetsConstants.no_internet,
                          title: 'No internet connection',
                          subTitle:
                              'Please check your internet connection and \ntry again',
                        ));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
