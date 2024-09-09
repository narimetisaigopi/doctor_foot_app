// ignore_for_file: non_constant_identifier_names

import 'package:drfootapp/admin/admin_view_foot_services.dart';
import 'package:drfootapp/admin/coupon_codes/coupon_codes_Screen.dart';
import 'package:drfootapp/admin/total_orders.dart';
import 'package:drfootapp/admin/users.dart';
import 'package:drfootapp/admin/video_posting_screen.dart';
import 'package:drfootapp/screens/dash_board/dietchartscreenwidgets/diet_chart_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Panel",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  setState(() {});
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                label: const Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
          )
        ],
      ),
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
            itemCount: options.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(options[index]),
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selected: _selectedIndex == index,
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ),
        Expanded(flex: 7, child: getLayout()),
      ],
    );
  }

  getLayout() {
    if (_selectedIndex == 0) {
      return const UsersScreen();
    } else if (_selectedIndex == 1) {
      return const CouponCodesScreen();
    } else if (_selectedIndex == 2) {
      return const AdminViewFootServices();
    } else if (_selectedIndex == 3) {
      return const TotalOrders();
    } else if (_selectedIndex == 4) {
      return const DietChartScreen();
    } else if (_selectedIndex == 5) {
      return const VideoPostingScreen();
    } else {
      return Container();
    }
  }
}
