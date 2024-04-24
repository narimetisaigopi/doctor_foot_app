import 'package:drfootapp/screens/dash_board/home_screen_widgets/book%20appointement/booking_confirm_screen.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/book%20appointement/calender_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  State<AppointmentBookingScreen> createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  DateTime today = DateTime.now();
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Appointments",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ).tr(),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TableCalendar(
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                return const CalenderWidget(
                  formate: "Sun",
                  date: "09",
                );
              },
            ),
            rowHeight: 60,
            locale: "en_US",
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: AppColors.grey2,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              formatButtonDecoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // availableGestures: AvailableGestures.all,
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2039, 3, 14),
            onDaySelected: onDaySelect,
            selectedDayPredicate: (day) => isSameDay(day, today),
          ),
          const Spacer(),
           CustomButton(
            buttonName: "Book an appointment",
            onPress: (){
              Get.to(const BookingConfirmScreen());
            },
          ),
        ],
      ),
    );
  }

  void onDaySelect(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }
}
