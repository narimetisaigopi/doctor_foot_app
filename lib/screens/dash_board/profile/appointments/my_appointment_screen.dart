import 'package:drfootapp/controllers/appointment_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppointmentScreen extends StatefulWidget {
  const MyAppointmentScreen({super.key});

  @override
  State<MyAppointmentScreen> createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen>
    with SingleTickerProviderStateMixin {
  final AppointmentController appointmentController =
      Get.put(AppointmentController());

  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 800),
  );

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(builder: (context) {
      return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryBlue,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.whiteBgColor,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            // bottom: const TabBar(
            //   tabs: [
            //     Tab(
            //       text: Strings.completed,
            //     ),
            //     Tab(
            //       text: Strings.cancelled,
            //     ),
            //   ],
            // ),
            title: const Text(
              "My Appointments",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteBgColor,
              ),
            ).tr(),
          ),
          // body: const TabBarView(children: [
          //   AppointmentsListScreen(
          //     appointmentStatus: AppointmentStatus.pending,
          //     title: Strings.upcoming,
          //   ),
          //   AppointmentsListScreen(
          //     appointmentStatus: AppointmentStatus.cancelled,
          //     title: Strings.cancelled,
          //   ),
          // ]),
          body: _tabBar(),
        ),
      );
    });
  }

  Widget _tabBar() {
    return TabBar(
      indicatorColor: AppColors.primaryBlue,
      indicatorWeight: 5,
      controller: tabController,
      tabs: const [
        Tab(
          text: Strings.completed,
        ),
        Tab(
          text: Strings.cancelled,
        ),
      ],
    );
  }
}
