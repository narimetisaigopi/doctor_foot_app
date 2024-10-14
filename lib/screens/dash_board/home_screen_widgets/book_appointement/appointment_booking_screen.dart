import 'package:drfootapp/controllers/appointment_booking_controller.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/book_appointement/calender_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
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
  AppointmentBookingController appointmentController =
      Get.put(AppointmentBookingController());

  @override
  void initState() {
    appointmentController.isDateSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentBookingController>(
        builder: (appointmentController) {
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
    });
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TableCalendar(
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, day, focusedDay) {
                return CalenderWidget(
                  formate: getWeekName(day),
                  date: "${day.day}",
                  bgColor: AppColors.primary,
                );
              },
              // todayBuilder: (context, day, focusedDay) {
              //   return CalenderWidget(
              //     formate: getWeekName(day),
              //     date: "${day.day}",
              //   );
              // },
              defaultBuilder: (context, day, focusedDay) {
                return CalenderWidget(
                  formate: getWeekName(day),
                  date: "${day.day}",
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
            currentDay: DateTime.now(),
            selectedDayPredicate: (day) {
              if (appointmentController.isDateSelected &&
                  day.day == appointmentController.selectedDateTime.day &&
                  day.month == appointmentController.selectedDateTime.month &&
                  day.year == appointmentController.selectedDateTime.year) {
                return true;
              }
              return false;
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              formatButtonDecoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 30)),
            onDaySelected: (s1, s2) {
              appointmentController.onDateSelection(s2);
            },
            focusedDay: appointmentController.selectedDateTime,
          ),
          const Spacer(),
          appointmentController.isLoading
              ? const CircularProgressIndicator()
              : CustomButton(
                  bgColor: appointmentController.isDateSelected
                      ? AppColors.primary
                      : AppColors.grey4,
                  textColor: appointmentController.isDateSelected
                      ? AppColors.whiteBgColor
                      : AppColors.primary,
                  buttonName: "Book an appointment",
                  onPress: () {
                    if (!appointmentController.isDateSelected) {
                      Utility.toast("Please select appoinment date");
                    } else {
                      Utility().showConfirmationBottomSheet(
                        context: context,
                        title: "Are you sure want to book appointment?",
                        onConfirm: () {
                          Get.back();
                          appointmentController.createAppointment();
                        },
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }

  String getWeekName(DateTime dateTime) {
    // Weekday names
    List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    // Get the day of the week index (0 for Monday, 1 for Tuesday, ...)
    int weekDayIndex = dateTime.weekday - 1;

    // Return the 3-letter week name
    return weekDays[weekDayIndex];
  }
}
