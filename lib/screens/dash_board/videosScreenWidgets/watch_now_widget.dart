import 'package:doctor_foot_app/models/videosModels/videos_model.dart';
import 'package:doctor_foot_app/screens/dash_board/videosScreenWidgets/videos_main_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WatchNowWidget extends StatefulWidget {
  const WatchNowWidget({super.key});

  @override
  State<WatchNowWidget> createState() => _WatchNowWidgetState();
}

class _WatchNowWidgetState extends State<WatchNowWidget> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.24,
      color: AppColors.videoImageBgColor,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: size.height * 0.2,
            width: double.infinity,
            child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: videosImageList.length,
                itemBuilder: (context, index) {
                  final videosImageItem = videosImageList[index];
                  return  VideosMainWidget(
                    image: videosImageItem.image,
                  );
                }),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 5,
            effect: const ScrollingDotsEffect(
              dotHeight: 08,
              dotWidth: 08,
            ),
          ),
        ],
      ),
    );
  }
}
