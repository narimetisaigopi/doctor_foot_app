import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:video_player/video_player.dart';

class PlayVideoScreen extends StatefulWidget {
  const PlayVideoScreen({super.key});

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  // late FlickManager flickManager;
  // @override
  // void initState() {
  //   super.initState();
  //     flickManager = FlickManager(
  //     videoPlayerController:
  //         VideoPlayerController.networkUrl(Uri.parse("url"),
  //     ));
  // }
  //   @override
  // void dispose() {
  //   flickManager.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              backgroundColor: AppColors.secondary,

      appBar: AppBar(
        centerTitle: true,
        title: const Text("video player"),
      ),
      body: Container()  
    //   Container(
    //   child: FlickVideoPlayer(
    //     flickManager: flickManager
    //   ),
    // )
    );
  }
}

