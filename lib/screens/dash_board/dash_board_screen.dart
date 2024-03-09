import 'package:doctor_foot_app/screens/dash_board/diet_chart_screen.dart';
import 'package:doctor_foot_app/screens/dash_board/home_screen.dart';
import 'package:doctor_foot_app/screens/dash_board/profile_screen.dart';
import 'package:doctor_foot_app/screens/dash_board/ulcer_screen.dart';
import 'package:doctor_foot_app/screens/dash_board/videos_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;
  List pages = [
    const HomeScreen(),
    const DietChartScreen(),
    const VideosScreen(),
    const UlcerScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Strings.homeText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: Strings.dietChartText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label:Strings.videosText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: Strings.ulcerMonitorText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: Strings.profile,
          ),
        ],
      ),
    );
  }
}
