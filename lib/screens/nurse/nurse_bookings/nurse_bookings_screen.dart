import 'package:drfootapp/screens/nurse/dash_board_widgets/bookings_list_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NurseBookingsScreen extends StatefulWidget {
  const NurseBookingsScreen({super.key});

  @override
  State<NurseBookingsScreen> createState() => _NurseBookingsScreenState();
}

class _NurseBookingsScreenState extends State<NurseBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.whiteBgColor,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          "Bookins",
          style: TextStyle(
              color: AppColors.whiteBgColor,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ).tr(),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BookingsListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
