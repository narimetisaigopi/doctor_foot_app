import 'package:doctor_foot_app/pages/diet_chart_screen.dart';
import 'package:doctor_foot_app/pages/home_screen.dart';
import 'package:doctor_foot_app/pages/profile_screen.dart';
import 'package:doctor_foot_app/pages/ulcer_screen.dart';
import 'package:doctor_foot_app/pages/videos_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectindex = 0;
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
      body: pages[selectindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        currentIndex: selectindex,
        onTap: (value) {
          setState(() {
            selectindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: "Diet Chart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: "Videos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: Strings.ulcerMonitorText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
