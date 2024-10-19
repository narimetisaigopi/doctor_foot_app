import 'package:drfootapp/controllers/doctor_appointment_controller.dart';
import 'package:drfootapp/screens/dash_board/profile/service_bookings/booking_services_list_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyServiceBookingsScreen extends StatefulWidget {
  const MyServiceBookingsScreen({super.key});

  @override
  
  State<MyServiceBookingsScreen> createState() =>
      _MyServiceBookingsScreenState();
}

class _MyServiceBookingsScreenState extends State<MyServiceBookingsScreen>
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
                bottom: const TabBar(
                  dividerColor: AppColors.secondaryColor,
                  indicatorWeight: 6,
                  indicatorColor: AppColors.primaryBlue,
                  tabs: [
                    Tab(
                      text: Strings.completed,
                    ),
                    Tab(
                      text: Strings.cancelled,
                    ),
                  ],
                ),
              ),
              body: const TabBarView(children: [
                BookingServicesListScreen(
                  orderStatus: OrderStatus.upcoming,
                  title: Strings.upcoming,
                ),
                BookingServicesListScreen(
                  orderStatus: OrderStatus.cancelled,
                  title: "",
                ),
              ])));
    });
  }
}
