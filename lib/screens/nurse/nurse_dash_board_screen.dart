import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/controllers/nurse/nurse_auth_controller.dart';
import 'package:drfootapp/screens/nurse/dash_board_widgets/booking_widget.dart';
import 'package:drfootapp/screens/nurse/dash_board_widgets/reached_location_widget.dart';
import 'package:drfootapp/screens/nurse/id_card_screen.dart';
import 'package:drfootapp/screens/nurse/materials_screen.dart';
import 'package:drfootapp/screens/nurse/more_screen.dart';
import 'package:drfootapp/screens/nurse/nurse_bookings/nurse_bookings_screen.dart';
import 'package:drfootapp/screens/nurse/nurse_home_screen.dart';
import 'package:drfootapp/screens/nurse/payout_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'controller/nurse_controller.dart';

class NurseDashBoardScreen extends StatefulWidget {
  const NurseDashBoardScreen({super.key});

  @override
  State<NurseDashBoardScreen> createState() => _NurseDashBoardScreenState();
}

class _NurseDashBoardScreenState extends State<NurseDashBoardScreen> {
  int selectedIndex = 0;
  NurseController nurseController = Get.put(NurseController());
  NurseAuthController nurseAuthController = Get.put(NurseAuthController());
  LocationController locationController = Get.put(LocationController());
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
  void initState() {
    nurseAuthController.refreshLocalData();
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
        appBar: AppBar(backgroundColor: AppColors.primaryBlue, title: appbar()),
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
              icon: getIcon(Icons.home, 0),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: getIcon(Icons.currency_rupee, 1),
              label: "Payout",
            ),
            BottomNavigationBarItem(
              icon: getIcon(Icons.medical_services, 2),
              label: "Materials",
            ),
            BottomNavigationBarItem(
              icon: getIcon(Icons.dehaze, 3),
              label: "More",
            ),
          ],
        ),
      ),
    );
  }

  Widget appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlutterSwitch(
          value: loginPartnerModel.isOnline,
          onToggle: (val) => nurseController.goOnlineOrOffiline,
          activeColor: AppColors.successColor,
          inactiveColor: AppColors.rejectColor,
          activeText: "ONLINE",
          inactiveText: "OFFLINE",
          width: 140.0,
          height: 40.0,
          toggleSize: 30.0,
          showOnOff: true,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.to(() => const IdCardScreen());
              },
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
              onTap: () {
                // Get.to(() => const NurseBookingOrdersScreen());
                bookingBtmWidget();
              },
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
    );
  }

  Widget getIcon(IconData icon, int index) {
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
            child: Icon(
              icon,
              color: isSelected ? AppColors.patientReviewBg : AppColors.grey,
            ),
          )
        : Icon(
            icon,
          );
  }

  Widget chooseLocation() {
    return Utility.myBottomSheet(
      context,
      heightFactor: 0.3,
      widget: Container(
        color: AppColors.whiteBgColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 12, left: 160, right: 160, bottom: 12),
                child: Divider(
                  thickness: 6,
                  color: AppColors.black1,
                ),
              ),
              ReachedLocationWidget(
                onPress: () {
                  reachedLocation();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reachedLocation() {
    return Utility.myBottomSheet(
      context,
      heightFactor: 0.6,
      widget: Container(
        color: AppColors.whiteBgColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 12, left: 160, right: 160, bottom: 12),
                child: Divider(
                  thickness: 6,
                  color: AppColors.black1,
                ),
              ),
              const Text(
                "Booking Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackBold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    AssetsConstants.michell_ross,
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Michel Tross",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black1,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    "2.16 km",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey2,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "*",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackBold,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "10:00 AM - 11:00 AM",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Foot cleansing  & Nail trimming",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey2,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 0.5,
                      color: AppColors.grey,
                    )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reached",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 10,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius: BorderRadius.circular(5))),
                      const SizedBox(height: 12),
                      ReachedLocationWidget(
                        onPress: () {
                          bookingBtmWidget();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bookingBtmWidget() {
    return Utility.myBottomSheet(
      context,
      heightFactor: 0.5,
      widget: Container(
        color: AppColors.secondaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 160, right: 160, bottom: 16),
              child: InkWell(
                onTap: () {
                  Get.to(() => const NurseBookingsScreen());
                },
                child: const Divider(thickness: 6),
              ),
            ),
            const Text(
              "Bookings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryBlue,
              ),
            ),
            BookingWidget(
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
