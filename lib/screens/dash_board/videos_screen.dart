import 'package:doctor_foot_app/screens/dash_board/dash_board_widgets/daily_featured_widget.dart';
import 'package:doctor_foot_app/screens/dash_board/dash_board_widgets/footAssement_widget.dart';
import 'package:doctor_foot_app/screens/dash_board/dash_board_widgets/watch_now_widget.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          title: const Text(Strings.videosText),
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
