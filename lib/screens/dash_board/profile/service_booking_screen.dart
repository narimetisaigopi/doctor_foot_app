import 'package:drfootapp/screens/dash_board/profile/oppointments/book_oppointment.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ServiceBookingScreen extends StatefulWidget {
  const ServiceBookingScreen({super.key});

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: AppColors.secondary,
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              "Service Bookings",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary),
            ).tr(),
          ),
          body: const SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: TabBar(
                          tabs: [
                            Expanded(
                              child: Center(
                                child: Tab(
                                  child: Text(
                                    "Completed",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Tab(
                                  child: Text(
                                    "Cancelled",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "UpComing",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                BookOppointment(),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                BookOppointment(),
              ]))),
    );
  }
}