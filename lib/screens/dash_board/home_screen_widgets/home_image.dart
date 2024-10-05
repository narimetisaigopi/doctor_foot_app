import 'dart:ui';
import 'package:drfootapp/models/homeScreenModels/home_image_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
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
            final homeImagesItem = homeImagesList[index];
            return Stack(
              children: [
                SvgImageWidget(
                  height: 180,
                  width: double.infinity,
                  path: homeImagesItem.image,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Positioned(
                      left: 16,
                      right: 16,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                        child: const Text(
                          "rectImageText",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondary,
                          ),
                        ).tr(),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: homeImagesController,
                      count: 5,
                      effect: const ScrollingDotsEffect(
                        dotHeight: 08,
                        dotWidth: 08,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
