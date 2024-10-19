import 'package:drfootapp/controllers/doctor_appointment_booking_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ChooseAppointmentDateTime extends StatefulWidget {
  const ChooseAppointmentDateTime({super.key});
  @override
  State<ChooseAppointmentDateTime> createState() =>
      _ChooseAppointmentDateTimeState();
}

class _ChooseAppointmentDateTimeState extends State<ChooseAppointmentDateTime> {
  final DoctorAppointmentBookingController appointmentController =
      Get.put(DoctorAppointmentBookingController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorAppointmentBookingController>(
        builder: (appointmentController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Seleted Date",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ).tr(),
          MyTextField(
            // label: Strings.dateOfBirthTextFieldLabel,
            hint: Strings.dateOfBirthTextFieldHint,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.date(),
            ]),
            textEditingController:
                appointmentController.dateTextEditingController,
            iconNeeded: true,
            suffixIcon: InkWell(
              onTap: () async {
                Utility().closeKeyboard();
                var date = await Utility.showMyDatePicker(context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 5)));
                appointmentController.selectDate(date.toString());
              },
              child: const Icon(
                Icons.edit_square,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Please choose the time:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ).tr(),
          const SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 4 / 1),
                itemCount: chooseTimes.length,
                itemBuilder: (context, index) {
                  final timings = chooseTimes[index];
                  return selectDate(
                      text: timings,
                      isSelected: appointmentController.selectedTime == timings,
                      isDisabled: index % 3 == 0);
                }),
          ),
        ],
      );
    });
  }

  Widget selectDate({
    required String text,
    bool isSelected = false,
    bool isDisabled = false,
  }) {
    Color bgColor = AppColors.whiteBgColor;
    Color borderColor = AppColors.grey;
    Color textColor = AppColors.blackBold;
    if (isSelected) {
      bgColor = AppColors.patientReviewBg;
      borderColor = AppColors.whiteBgColor;
      textColor = AppColors.whiteBgColor;
    }
    if (isDisabled) {
      bgColor = AppColors.whiteBgColor;
      borderColor = AppColors.grey;
      textColor = AppColors.black1.withOpacity(0.5);
    }
    return InkWell(
      onTap: isDisabled
          ? null
          : () {
              appointmentController.selectTime(text);
            },
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 22, right: 22, top: 10, bottom: 8),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ).tr(),
        ),
      ),
    );
  }
}
