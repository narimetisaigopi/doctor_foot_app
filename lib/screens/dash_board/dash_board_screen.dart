import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/screens/dash_board/diet_chart_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen.dart';
import 'package:drfootapp/screens/dash_board/profile_details_screen.dart';
import 'package:drfootapp/screens/dash_board/ulcer_screen.dart';
import 'package:drfootapp/screens/dash_board/videos_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;

  LocationController locationController = Get.put(LocationController());
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  List pages = [
    const HomeScreen(),
    const DietChartScreen(),
    const VideosScreen(),
    const UlcerScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    locationController.determinePosition();
    authenticationController.getUserDataAndStoreLocally();
    super.initState();
  }

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
                : const Icon(Icons.home),
            label: "homeText".tr,
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
                : const Icon(Icons.food_bank),
            label: "dietChartText".tr,
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
                : const Icon(Icons.video_call),
            label: "videosText".tr,
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
                : const Icon(Icons.schedule),
            label: "ulcerMonitorText".tr,
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
                : const Icon(Icons.person),
            label: "profile".tr,
          ),
        ],
      ),
    );
  }
}
