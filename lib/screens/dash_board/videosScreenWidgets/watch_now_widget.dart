import 'package:drfootapp/models/videosModels/videos_model.dart';
import 'package:drfootapp/screens/dash_board/videosScreenWidgets/play_video_screen.dart';
import 'package:drfootapp/screens/dash_board/videosScreenWidgets/videos_main_widget.dart';
import 'package:drfootapp/screens/discharge_screens/popup1_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
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
      height: 225,
      width: double.infinity,
      color: AppColors.videoImageBgColor,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
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
                      onPress: (){
                          Utility.myBottomSheet(context,
                                heightFactor: 0.5,
                                widget: const PopUp1Widget());
                      },
                    );
                  }),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 5,
            effect: const ScrollingDotsEffect(
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
