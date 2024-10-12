import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/book_appointement/appointment_view_details_page.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
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
          Container(
            height: 196,
            width: double.infinity,
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
            "Date: ${Utility().formatDate(widget.appointmentModel.appointmentTimestamp!.toDate())}",
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
            Utility().formatTime(
                widget.appointmentModel.appointmentTimestamp!.toDate()),
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
              Get.to(() => AppointemntViewDetailsPage(
                    appointmentModel: widget.appointmentModel,
                  ));
            },
          ),
        ]),
      )),
    );
  }
}
