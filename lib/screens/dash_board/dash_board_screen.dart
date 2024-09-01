import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/screens/dash_board/dietchartscreenwidgets/diet_chart_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/service_widget.dart';
import 'package:drfootapp/screens/dash_board/profile_screen.dart';
import 'package:drfootapp/screens/dash_board/ulcer_monitoring_screen.dart';
import 'package:drfootapp/screens/dash_board/videos_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget footulcerWidget = const ServiceWidget(
  image: AssetsConstants.foot,
  // name: Strings.footUlcerText,
   name: Strings.haveulcerText,
);
Widget checkYourRiskWidget = const ServiceWidget(
  image: AssetsConstants.speedometer,
  name: Strings.riskcheckerText,
);
Widget checkUpSchedulemeter = const ServiceWidget(
  image: AssetsConstants.checkup_shedule,
  name: Strings.checkupScheduleText,
);
Widget footServiceWidget = const ServiceWidget(
  image: AssetsConstants.foot_service,
  name: Strings.footServiceText,
);

List<Widget> homeServicesList = [
  footulcerWidget,
  checkYourRiskWidget,
  checkUpSchedulemeter,
  footServiceWidget,
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
  //  const UlcerMonitoringScreen(),
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
    locationController.determinePosition();
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
                    // child:SvgPicture.asset('', color: AppColors.primary, ),
                      child: const Icon(Icons.home))
                  : const Icon(Icons.home),
             label: Strings.homeText.tr,
              // child: SvgPicture.asset(
              //           'assets/icons/home_icon.svg',
              //           color: AppColors.primary,
              //         ),
              //       )
                  // : SvgPicture.asset(
                  //     'assets/icons/home_icon.svg',
                  //     color: AppColors.grey,
                  //   ),
            //  label: Strings.homeText.tr,
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
              label: Strings.dietChartText.tr,
              //  child: SvgPicture.asset(
              //           'assets/icons/diet_chart_icon.svg',
              //           color: AppColors.primary,
              //         ),
              //       )
              //     : SvgPicture.asset(
              //         'assets/icons/diet_chart_icon.svg',
              //         color: AppColors.grey,
              //       ),
              // label: Strings.dietChartText.tr,
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
              label: Strings.videosText.tr,
              //  child: SvgPicture.asset(
              //           'assets/icons/videos_icon.svg',
              //           color: AppColors.primary,
              //         ),
              //       )
              //     : SvgPicture.asset(
              //         'assets/icons/videos_icon.svg',
              //         color: AppColors.grey,
              //       ),
              // label: Strings.videosText.tr,
            ),
            // BottomNavigationBarItem(
            //   icon: selectedIndex == 3
            //       ? Container(
            //           height: 40,
            //           decoration: const BoxDecoration(
            //             border: Border(
            //               top: BorderSide(
            //                 color: AppColors.primary,
            //                 width: 3.5,
            //               ),
            //             ),
            //           ),
            //           child: const Icon(Icons.schedule))
            //       : const Icon(Icons.schedule),
            //   label: Strings.ulcerMonitorText.tr,
            // ),
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
              label: Strings.profile.tr,
              // child: SvgPicture.asset(
              //           'assets/icons/navigation.svg',
              //           color: AppColors.primary,
              //         ),
              //       )
              //     : SvgPicture.asset(
              //         'assets/icons/profile_icon.svg',
              //         color: AppColors.primary,
              //       ),
              // label: Strings.profile.tr,
            ),
          ],
        ),
      ),
    );
  }
}
