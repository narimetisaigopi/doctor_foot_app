import 'package:drfootapp/controllers/doctor_appointment_controller.dart';
import 'package:drfootapp/screens/dash_board/profile/foot_appointments/foot_appointments_list_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFootAppointmentsScreen extends StatefulWidget {
  const MyFootAppointmentsScreen({super.key});

  @override
  State<MyFootAppointmentsScreen> createState() =>
      _MyFootAppointmentsScreenState();
}

class _MyFootAppointmentsScreenState extends State<MyFootAppointmentsScreen>
    with TickerProviderStateMixin {
  final DoctorAppointmentController appointmentController =
      Get.put(DoctorAppointmentController());

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorAppointmentController>(builder: (context) {
      return DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
              backgroundColor: AppColors.secondary,
              appBar: AppBar(
                backgroundColor: AppColors.primaryBlue,
                title: const Text(
                  "Booked Services",
                  style: TextStyle(
                    color: AppColors.whiteBgColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ).tr(),
                centerTitle: true,
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: AppColors.whiteBgColor,
                  ),
                ),
              ),
              body: TabBarView(children: [
                Column(
                  children: [
                    _tabBar(),
                    const Expanded(
                      child: FootAppointmentsListScreen(
                        appointmentStatus: AppointmentStatus.booked,
                        title: Strings.upcoming,
                        showHeader: true,
                      ),
                    ),
                    const Expanded(
                      child: FootAppointmentsListScreen(
                        appointmentStatus: AppointmentStatus.completed,
                        title: Strings.upcoming,
                        showHeader: true,
                      ),
                    ),
                  ],
                ),
                const FootAppointmentsListScreen(
                  appointmentStatus: AppointmentStatus.cancelled,
                  title: Strings.cancelled,
                ),
              ])));
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
