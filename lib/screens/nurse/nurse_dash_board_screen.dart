import 'package:drfootapp/screens/nurse/materials_screen.dart';
import 'package:drfootapp/screens/nurse/more_screen.dart';
import 'package:drfootapp/screens/nurse/nurse_home_screen.dart';
import 'package:drfootapp/screens/nurse/payout_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NurseDashBoardScreen extends StatefulWidget {
  const NurseDashBoardScreen({super.key});

  @override
  State<NurseDashBoardScreen> createState() => _NurseDashBoardScreenState();
}

class _NurseDashBoardScreenState extends State<NurseDashBoardScreen> {
  int selectedIndex = 0;
  bool isOnline = false;
  List pages = [
    const NurseHomeScreen(),
    const PayoutScreen(),
    const MaterialsScreen(),
    const MoreScreen()
  ];
  onBackPressed(didPop) {
    if (didPop) {
      return;
    }
    pages[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        onBackPressed(didPop);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterSwitch(
                value: isOnline,
                onToggle: (val) {
                  setState(() {
                    isOnline = val;
                  });
                },
                activeColor: AppColors.successColor,
                inactiveColor: AppColors.rejectColor,
                activeText: "ONLINE",
                inactiveText: "OFFLINE",
                width: 120.0,
                height: 40.0,
                toggleSize: 30.0,
                showOnOff: true,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteBgColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.headset_mic_outlined,
                              color: AppColors.whiteBgColor,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Help',
                              style: TextStyle(
                                color: AppColors.whiteBgColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteBgColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person_add_alt_1,
                          color: AppColors.whiteBgColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: getIcon(AssetsConstants.calendar, 1),
              label: "Payout",
            ),
            BottomNavigationBarItem(
              icon: getIcon(AssetsConstants.bell, 2),
              label: "Materials",
            ),
            BottomNavigationBarItem(
              icon: getIcon(AssetsConstants.person_profile, 3),
              label: "More",
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
            width: 50,
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
