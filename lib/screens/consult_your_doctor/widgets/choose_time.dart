import 'package:drfootapp/controllers/appointment_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseTime extends StatefulWidget {
  const ChooseTime({super.key});

  @override
  State<ChooseTime> createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
  final AppointmentController appointmentController =
      Get.put(AppointmentController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(builder: (appointmentController) {
      return SizedBox(
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
              return InkWell(
                onTap: () {
                  appointmentController.selectDate(timings);
                },
                child: selectDate(
                    timings, appointmentController.selectedDate == timings),
              );
            }),
      );
    });
  }

  Widget selectDate(String text, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
          color:
              isSelected ? AppColors.patientReviewBg : AppColors.whiteBgColor,
          border: Border.all(
            color: isSelected ? AppColors.grey : AppColors.patientReviewBg,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22, top: 10, bottom: 8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.whiteBgColor : AppColors.blackBold,
          ),
          textAlign: TextAlign.center,
        ).tr(),
      ),
    );
  }
}
