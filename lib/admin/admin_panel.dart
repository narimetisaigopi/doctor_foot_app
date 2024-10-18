// ignore_for_file: non_constant_identifier_names
import 'package:drfootapp/admin/coupon_codes/coupon_codes_Screen.dart';
import 'package:drfootapp/admin/doctor/admin_all_doctors.dart';
import 'package:drfootapp/admin/hospital/admin_all_hospitals.dart';
import 'package:drfootapp/admin/total_orders.dart';
import 'package:drfootapp/admin/users.dart';
import 'package:drfootapp/screens/dash_board/dietchartscreenwidgets/diet_chart_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'articles/admin_all_articles.dart';
import 'banners/admin_all_banners.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _selectedIndex = 0;
  String _selectedItem = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Admin Panel",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 30,
      //       color: Colors.red,
      //     ),
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: TextButton.icon(
      //           onPressed: () async {
      //             await FirebaseAuth.instance.signOut();
      //             setState(() {});
      //           },
      //           icon: const Icon(
      //             Icons.logout,
      //             color: Colors.red,
      //           ),
      //           label: const Text(
      //             "Logout",
      //             style: TextStyle(
      //                 color: Colors.red,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20),
      //           )),
      //     )
      //   ],
      // ),
      body: Material(
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => mobileAdminPanel(),
          desktop: (BuildContext context) => desktopAdminPanel(),
        ),
      ),
    );
  }

  Widget mobileAdminPanel() {
    return Container();
  }

  Widget desktopAdminPanel() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.shade200, blurRadius: 10),
            ],
          ),
          width: 300,
          child: ListView.builder(
            itemCount: dashboardMenuOptions.length,
            itemBuilder: (context, index) {
              bool isSelected = _selectedIndex == index;
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedItem = dashboardMenuOptions[index];
                    _selectedIndex = index;
                  });
                },
                child: Container(
                    decoration:
                        BoxDecoration(color: isSelected ? Colors.amber : null),
                    padding: const EdgeInsets.all(8),
                    child: Text(dashboardMenuOptions[index])),
              );
            },
          ),
        ),
        Expanded(flex: 7, child: getLayout()),
      ],
    );
  }

  getLayout() {
    if (_selectedItem == user) {
      return const UsersScreen();
    } else if (_selectedItem == couponCodes) {
      return const CouponCodesScreen();
    } else if (_selectedItem == orders) {
      return const TotalOrders();
    } else if (_selectedItem == dietChart) {
      return const DietChartScreen();
    } else if (_selectedItem == articlesAndBlogs) {
      return const AdminAllArticles();
    } else if (_selectedItem == hospitals) {
      return const AllAdminHospitalsScreen();
    } else if (_selectedItem == doctors) {
      return const AllAdminDoctorsScreen();
    } else if (_selectedItem == banners) {
      return const AllAdminBannersScreen();
    } else {
      return Container();
    }
  }
}
