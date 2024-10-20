import 'package:drfootapp/models/appointment_models/doctor_appointment_model.dart';
import 'package:drfootapp/models/foot_service_appointment_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/doctor_booked_appointment_details_screen.dart';
import 'package:drfootapp/screens/foot_services/foot_service_appointment_details_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentSuccessScreen extends StatefulWidget {
  final DoctorAppointmentModel? doctorAppointmentModel;
  final FootServiceAppointmentModel? footServiceAppointmentModel;
  const AppointmentSuccessScreen(
      {super.key,
      this.doctorAppointmentModel,
      this.footServiceAppointmentModel});

  @override
  State<AppointmentSuccessScreen> createState() =>
      _AppointmentSuccessScreenState();
}

class _AppointmentSuccessScreenState extends State<AppointmentSuccessScreen> {
  String appointmentId = "", appointmentDate = "", appointmentTime = "";
  @override
  void initState() {
    if (widget.doctorAppointmentModel != null) {
      appointmentDate = widget.doctorAppointmentModel!.appointmentDate;
      appointmentTime = widget.doctorAppointmentModel!.appointmentTime;
      appointmentId = widget.doctorAppointmentModel!.appointmentId.toString();
    }
    if (widget.footServiceAppointmentModel != null) {
      appointmentDate = widget.footServiceAppointmentModel!.appointmentDate;
      appointmentTime = widget.footServiceAppointmentModel!.appointmentTime;
      appointmentId =
          widget.footServiceAppointmentModel!.appointmentId.toString();
    }
    super.initState();
  }

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
            "Appointment Id #$appointmentId",
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
            // "Date: ${Utility().formatDate(widget.doctorAppointmentModel.appointmentTimestamp!.toDate())}",
            "Date: $appointmentDate",
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
            appointmentTime,
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
              if (widget.doctorAppointmentModel != null) {
                Get.to(() => DoctorBookedAppointmentDetailsScreen(
                      appointmentModel: widget.doctorAppointmentModel!,
                    ));
              } else if (widget.footServiceAppointmentModel != null) {
                Get.to(() => FootServiceAppointmentDetailsScreen(
                      footServiceAppointmentModel:
                          widget.footServiceAppointmentModel!,
                    ));
              }
            },
          ),
        ]),
      )),
    );
  }
}
