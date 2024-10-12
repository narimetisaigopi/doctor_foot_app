import 'package:drfootapp/admin/diet/add_diet_chart_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPostingScreen extends StatefulWidget {
  const VideoPostingScreen({super.key});

  @override
  State<VideoPostingScreen> createState() => _VideoPostingScreenState();
}

class _VideoPostingScreenState extends State<VideoPostingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         backgroundColor: AppColors.whiteBgColor,
      floatingActionButton: Utility.isAdmin()
              ? FloatingActionButton(
                  onPressed: () {
                    Get.to(() => const AddDietChartScreen());
                  },
                  child: const Icon(Icons.add),
                )
              : null,
    );
  }
}
