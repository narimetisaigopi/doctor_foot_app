import 'package:drfootapp/models/videosModels/videos_model.dart';
import 'package:drfootapp/screens/dash_board/videos_screen_widgets/play_video_screen.dart';
import 'package:drfootapp/screens/dash_board/videos_screen_widgets/videos_main_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Container(
      height: 195,
      width: double.infinity,
      color: AppColors.videoImageBgColor,
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: videosImageList.length,
                  itemBuilder: (context, index) {
                    final videosImageItem = videosImageList[index];
                    return VideosMainWidget(
                      image: videosImageItem.image,
                      title: videosImageItem.title,
                      onPress: () {},
                    );
                  }),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 5,
            effect: const ScrollingDotsEffect(
              activeDotColor: AppColors.primaryBlue,
              dotHeight: 08,
              dotWidth: 08,
            ),
          ),
          const SizedBox(
            height: 08,
          )
        ],
      ),
    );
  }

  void playVideo() {
    Get.to(const PlayVideoScreen());
  }
}
