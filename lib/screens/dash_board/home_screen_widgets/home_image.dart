import 'dart:ui';
import 'package:drfootapp/models/homeScreenModels/home_image_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeImage extends StatefulWidget {
  const HomeImage({super.key});

  @override
  State<HomeImage> createState() => _HomeImageState();
}

class _HomeImageState extends State<HomeImage> {
  final homeImagesController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: PageView.builder(
          controller: homeImagesController,
          scrollDirection: Axis.horizontal,
          itemCount: homeImagesList.length,
          itemBuilder: (context, index) {
            final homeData = homeImagesList[index];
            return Stack(
              children: [
                CustomImage(
                  path: homeData.image,
                  height: 180,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 72),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Positioned(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                          child: Text(
                            homeData.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                            textAlign: TextAlign.center,
                          ).tr(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SmoothPageIndicator(
                        controller: homeImagesController,
                        count: 5,
                        effect: const ScrollingDotsEffect(
                          dotHeight: 08,
                          dotWidth: 08,
                          activeDotColor: AppColors.whiteBgColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
