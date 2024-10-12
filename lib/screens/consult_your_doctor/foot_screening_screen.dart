import 'package:drfootapp/screens/consult_your_doctor/widgets/all_hospitals_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';

class FootScreeningScreen extends StatefulWidget {
  const FootScreeningScreen({super.key});

  @override
  State<FootScreeningScreen> createState() => _FootScreeningScreenState();
}

class _FootScreeningScreenState extends State<FootScreeningScreen> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blackBold,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Foot Screening",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryBlue,
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalWeekCalendar(
              minDate: DateTime(2023, 12, 31),
              maxDate: DateTime(2024, 1, 31),
              initialDate: DateTime(2024, 1, 15),
              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              showTopNavbar: false,
              monthFormat: "MMMM yyyy",
              showNavigationButtons: true,
              weekStartFrom: WeekStartFrom.Monday,
              activeBackgroundColor: AppColors.primaryBlue,
              activeTextColor: AppColors.whiteBgColor,
              inactiveBackgroundColor: AppColors.whiteBgColor,
              inactiveTextColor: AppColors.grey,
              disabledTextColor: Colors.grey,
              disabledBackgroundColor: AppColors.whiteBgColor,
              activeNavigatorColor: AppColors.primaryBlue,
              inactiveNavigatorColor: AppColors.whiteBgColor,
              monthColor: AppColors.primaryBlue,
            ),
            const Divider(
              color: AppColors.grey4,
              thickness: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Available Clinics",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1,
                    ),
                  ).tr(),
                  const SizedBox(height: 8),
                  const AllHospitalsScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
