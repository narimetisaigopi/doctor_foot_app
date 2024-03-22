// ignore_for_file: non_constant_identifier_names

import 'package:doctor_foot_app/admin/coupon_codes/coupon_codes.dart';
import 'package:doctor_foot_app/admin/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => mobileAdminPanel(),
        desktop: (BuildContext context) => desktopAdminPanel(),
      ),
    );
  }

  Widget mobileAdminPanel() {
    return Container();
  }

  Widget desktopAdminPanel() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          const Text(
            "Admin Panel",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 100,
          ),
          Wrap(
            children: [
              AdminOptions(
                title: "Users",
                onTap: () => Get.to(() => const Users()),
              ),
              AdminOptions(
                icon: Icons.discount,
                title: "Coupon Codes",
                onTap: () => Get.to(() => const CouponCodesScreen()),
              ),
              AdminOptions(title: "Orders"),
            ],
          )
        ],
      ),
    );
  }

  Widget AdminOptions(
      {IconData icon = Icons.people,
      String title = "Title",
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.shade300,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
