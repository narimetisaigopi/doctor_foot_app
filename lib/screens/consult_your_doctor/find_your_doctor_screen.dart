import 'package:drfootapp/controllers/appointment_controller.dart';
import 'package:drfootapp/screens/consult_your_doctor/doctor_details_screen.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/all_bookings_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class FindYourDoctorScreen extends StatefulWidget {
  const FindYourDoctorScreen({super.key});

  @override
  State<FindYourDoctorScreen> createState() => _FindYourDoctorScreenState();
}

class _FindYourDoctorScreenState extends State<FindYourDoctorScreen> {
  AppointmentController appointmentController =
      Get.put(AppointmentController());

  @override
  void initState() {
    appointmentController.isDateSelected = false;
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(builder: (appointmentController) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => const DoctorDetailsScreen());
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: AppColors.blackBold,
                ),
              ),
            ),
          ],
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
            "Find Your Doctor",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.blackBold,
            ),
          ).tr(),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // TableCalendar(
                //   calendarBuilders: CalendarBuilders(
                //     selectedBuilder: (context, day, focusedDay) {
                //       return CalenderWidget(
                //         formate: getWeekName(day),
                //         date: "${day.day}",
                //         bgColor: AppColors.primary,
                //       );
                //     },

                //     defaultBuilder: (context, day, focusedDay) {
                //       return CalenderWidget(
                //         formate: getWeekName(day),
                //         date: "${day.day}",
                //       );
                //     },
                //   ),
                //   rowHeight: 60,
                //   locale: "en_US",
                //   calendarStyle: const CalendarStyle(
                //     selectedDecoration: BoxDecoration(
                //       color: AppColors.grey2,
                //     ),
                //   ),
                //   currentDay: DateTime.now(),
                //   selectedDayPredicate: (day) {
                //     if (appointmentController.isDateSelected &&
                //         day.day == appointmentController.selectedDateTime.day &&
                //         day.month == appointmentController.selectedDateTime.month &&
                //         day.year == appointmentController.selectedDateTime.year) {
                //       return true;
                //     }
                //     return false;
                //   },
                //   headerStyle: HeaderStyle(
                //     formatButtonVisible: false,
                //     titleCentered: true,
                //     formatButtonDecoration: BoxDecoration(
                //       color: AppColors.primary,
                //       borderRadius: BorderRadius.circular(4),
                //     ),
                //   ),
                //   firstDay: DateTime.now(),
                //   lastDay: DateTime.now().add(const Duration(days: 30)),
                //   onDaySelected: (s1, s2) {
                //     appointmentController.onDateSelection(s2);
                //   },
                //   focusedDay: appointmentController.selectedDateTime,
                // ),
                MyTextField(
                  borderRadius: 8,
                  bgColor: AppColors.whiteBgColor,
                  hint: "Search for a doctor",
                  textEditingController: searchController,
                  suffixIcon: const Icon(
                    Icons.cancel,
                    color: AppColors.grey,
                  ),
                  iconNeeded: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(height: 8),
                const AllBookingsWidget()
              ],
            ),
          ),
        ),
      );
    });
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
