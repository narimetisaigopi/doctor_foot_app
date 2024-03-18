import 'package:doctor_foot_app/screens/dash_board/diet_chart_screen.dart';
import 'package:doctor_foot_app/screens/dash_board/home_screen.dart';
import 'package:doctor_foot_app/screens/dash_board/profile_screen.dart';
import 'package:doctor_foot_app/screens/dash_board/ulcer_screen.dart';
import 'package:doctor_foot_app/screens/dash_board/videos_screen.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
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
        items: [
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.primary,
                          width: 3.5,
                        ),
                      ),
                    ),
                    child: const Icon(Icons.home))
                : Container(child: const Icon(Icons.home)),
            label: "homeText",
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.primary,
                          width: 3.5,
                        ),
                      ),
                    ),
                    child: const Icon(Icons.food_bank))
                : Container(child: const Icon(Icons.food_bank)),
            label: "dietChartText",
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.primary,
                          width: 3.5,
                        ),
                      ),
                    ),
                    child: const Icon(Icons.video_call))
                : Container(child: const Icon(Icons.video_call)),
            label: "videosText",
          ),
           BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.primary,
                          width: 3.5,
                        ),
                      ),
                    ),
                    child: const Icon(Icons.schedule))
                : Container(child: const Icon(Icons.schedule)),
            label: "ulcerMonitorText",
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 4
                ? Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.primary,
                          width: 3.5,
                        ),
                      ),
                    ),
                    child: const Icon(Icons.person))
                : Container(child: const Icon(Icons.person)),
            label: "profile",
          ),
         
         
         
        ],
      ),
    );
  }
}
