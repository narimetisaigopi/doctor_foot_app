import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/booked_appointment_details_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentConfirmScreen extends StatefulWidget {
  final AppointmentModel appointmentModel;
  const AppointmentConfirmScreen({super.key, required this.appointmentModel});

  @override
  State<AppointmentConfirmScreen> createState() =>
      _AppointmentConfirmScreenState();
}

class _AppointmentConfirmScreenState extends State<AppointmentConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const SizedBox(
            height: 78,
          ),
          const CustomImage(
            height: 198,
            width: 248,
            path: AssetsConstants.appointment_done,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Your Appointment Confirmed!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.blackBold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Appointment Id #${widget.appointmentModel.appointmentId}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey5,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            // "Date: ${Utility().formatDate(widget.appointmentModel.appointmentTimestamp!.toDate())}",
            "Date: ${widget.appointmentModel.appointmentDate}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            // Utility().formatTime(
            //     widget.appointmentModel.appointmentTimestamp!.toDate()),
            widget.appointmentModel.appointmentTime,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey5,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Thank you !\n We ensure awesome hospital\n experience with no waiting time.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey5,
            ),
          ),
          const Spacer(),
          CustomButton(
            buttonName: "View details",
            onPress: () {
              Get.to(() => BookedAppointmentDetailsScreen(
                    appointmentModel: widget.appointmentModel,
                  ));
            },
          ),
        ]),
      )),
    );
  }
}
