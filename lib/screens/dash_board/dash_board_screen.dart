import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/screens/dash_board/dietchartscreenwidgets/diet_chart_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/service_widget.dart';
import 'package:drfootapp/screens/dash_board/profile_screen.dart';
import 'package:drfootapp/screens/dash_board/videos_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget consultYourDoctor = const ServiceWidget(
  image: AssetsConstants.foot,
  name: Strings.consultYourDoctor,
);
Widget onlineConsultation = const ServiceWidget(
  image: AssetsConstants.speedometer,
  name: Strings.onlineConsultation,
);
Widget footScreeningServices = const ServiceWidget(
  image: AssetsConstants.checkup_shedule,
  name: Strings.footScreeningServices,
);
Widget dressingAtHome = const ServiceWidget(
  image: AssetsConstants.foot_service,
  name: Strings.dressingAtHome,
);
Widget footCleaning = const ServiceWidget(
  image: AssetsConstants.foot_service,
  name: Strings.footCleaning,
);
Widget nailTrimming = const ServiceWidget(
  image: AssetsConstants.foot_service,
  name: Strings.nailTrimming,
);
Widget footWear = const ServiceWidget(
  image: AssetsConstants.foot_service,
  name: Strings.footWear,
);
Widget footProducts = const ServiceWidget(
  image: AssetsConstants.foot_service,
  name: Strings.footProducts,
);

List<Widget> homeServicesList = [
  consultYourDoctor,
  onlineConsultation,
  footScreeningServices,
  dressingAtHome,
  footCleaning,
  nailTrimming,
  footWear,
  footProducts,
];

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
    const ProfileScreen(),
  ];
  onBackPressed(didPop) {
    if (didPop) {
      return;
    }
    pages[selectedIndex];
  }

  @override
  void initState() {
    locationController.getCurrentLocation();
    authenticationController.getUserDataAndStoreLocally();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        onBackPressed(didPop);
      },
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.patientReviewBg,
          unselectedItemColor: AppColors.grey,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: getIcon(AssetsConstants.home_one, 0),
              label: Strings.homeText.tr,
            ),
            BottomNavigationBarItem(
              icon: getIcon(AssetsConstants.calendar, 1),
              label: Strings.dietChartText.tr,
            ),
            BottomNavigationBarItem(
              icon: getIcon(AssetsConstants.bell, 2),
              label: Strings.videosText.tr,
            ),
            BottomNavigationBarItem(
              icon: getIcon(AssetsConstants.person_profile, 3),
              label: Strings.profile.tr,
            ),
          ],
        ),
      ),
    );
  }

  Widget getIcon(String icon, int index) {
    bool isSelected = selectedIndex == index;
    return isSelected
        ? Container(
            height: 40,
            width: 56,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.patientReviewBg,
                  width: 5,
                ),
              ),
            ),
            child: Image.asset(
              icon,
              color: isSelected ? AppColors.patientReviewBg : AppColors.grey,
            ),
          )
        : Image.asset(
            icon,
          );
  }
}
