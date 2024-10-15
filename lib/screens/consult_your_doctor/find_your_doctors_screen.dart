import 'package:drfootapp/controllers/appointment_booking_controller.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/all_doctors_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';

class FindYourDoctorsScreen extends StatefulWidget {
  const FindYourDoctorsScreen({super.key});

  @override
  State<FindYourDoctorsScreen> createState() => _FindYourDoctorsScreenState();
}

class _FindYourDoctorsScreenState extends State<FindYourDoctorsScreen> {
  AppointmentBookingController appointmentController =
      Get.put(AppointmentBookingController());

  @override
  void initState() {
    appointmentController.isDateSelected = false;
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentBookingController>(
        builder: (appointmentController) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
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
                activeBackgroundColor: AppColors.patientReviewBg,
                activeTextColor: AppColors.whiteBgColor,
                inactiveBackgroundColor: AppColors.whiteBgColor,
                inactiveTextColor: AppColors.grey,
                disabledTextColor: Colors.grey,
                disabledBackgroundColor: AppColors.whiteBgColor,
                activeNavigatorColor: AppColors.primaryBlue,
                inactiveNavigatorColor: AppColors.whiteBgColor,
                monthColor: AppColors.primaryBlue,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
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
                    const AllDoctorsScreen()
                  ],
                ),
              ),
            ],
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
