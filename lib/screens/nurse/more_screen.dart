import 'package:drfootapp/screens/nurse/billing_details/bill_checker_screen.dart';
import 'package:drfootapp/screens/nurse/client/client_screen.dart';
import 'package:drfootapp/screens/nurse/dash_board_widgets/go_to_widget.dart';
import 'package:drfootapp/screens/nurse/dash_board_widgets/profile_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
        child: Column(
          children: [
            const ProfileWidget(),
            const SizedBox(height: 12),
            GoToWidget(
              text: "Manage Profile",
              onPress: () {
                Get.to(() => const BillCheckerScreen());
              },
            ),
            const SizedBox(height: 12),
            GoToWidget(
              text: "Benefits",
              onPress: () {
                Get.to(() => const ClientScreen());
              },
            ),
            const SizedBox(height: 12),
            GoToWidget(
              text: "Emergency Program",
              onPress: () {},
            ),
            const SizedBox(height: 12),
            GoToWidget(
              text: "History",
              onPress: () {},
            ),
            const SizedBox(height: 12),
            GoToWidget(
              text: "Issues & Tickets",
              onPress: () {},
            ),
            const SizedBox(height: 12),
            GoToWidget(
              text: "Agreement",
              onPress: () {},
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.redColor,
                    )),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
