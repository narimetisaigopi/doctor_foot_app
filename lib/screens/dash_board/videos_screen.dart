import 'package:drfootapp/screens/dash_board/videos_screen_widgets/daily_featured_widget.dart';
import 'package:drfootapp/screens/dash_board/videos_screen_widgets/watch_now_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'videos_screen_widgets/foot_assement_widget.dart';


class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          title: const Text("videosText").tr(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.secondary,
            child: const Column(
              children: [
                WatchNowWidget(),
                FootAssessmentWidget(),
                DailyFeaturedWidget()
              ],
            ),
          ),
        ));
  }
}
