import 'package:drfootapp/controllers/appointment_booking_controller.dart';
import 'package:drfootapp/screens/dash_board/profile/appointments/appointments_list_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen>
    with SingleTickerProviderStateMixin {
  final AppointmentBookingController appointmentController =
      Get.put(AppointmentBookingController());

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
    return GetBuilder<AppointmentBookingController>(builder: (context) {
      return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: AppColors.bgColorAppointment,
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
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: Strings.completed,
                ),
                Tab(
                  text: Strings.cancelled,
                ),
              ],
            ),
            title: const Text(
              "My Appointments",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteBgColor,
              ),
            ).tr(),
          ),
          body: const TabBarView(children: [
            Column(
              children: [
                Expanded(
                  child: AppointmentsListScreen(
                    appointmentStatus: AppointmentStatus.booked,
                    title: Strings.upcoming,
                    showHeader: true,
                  ),
                ),
                Expanded(
                  child: AppointmentsListScreen(
                    appointmentStatus: AppointmentStatus.completed,
                    title: Strings.completed,
                    showHeader: true,
                  ),
                ),
              ],
            ),
            AppointmentsListScreen(
              appointmentStatus: AppointmentStatus.cancelledByUser,
              title: Strings.cancelled,
            ),
          ]),
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
