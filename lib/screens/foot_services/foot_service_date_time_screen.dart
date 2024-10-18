import 'package:drfootapp/controllers/appointment_booking_controller.dart';
import 'package:drfootapp/models/nurse_service_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/choose_appointment_date_time.dart';
import 'package:drfootapp/screens/foot_services/foor_service_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootServiceDateTimeScreen extends StatefulWidget {
  final NurseServiceModel nurseServiceModel;
  const FootServiceDateTimeScreen({super.key, required this.nurseServiceModel});

  @override
  State<FootServiceDateTimeScreen> createState() =>
      _FootServiceDateTimeScreenState();
}

class _FootServiceDateTimeScreenState extends State<FootServiceDateTimeScreen> {
  AppointmentBookingController appointmentBookingController =
      AppointmentBookingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Dressing at home",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FootServiceWidget(nurseServiceModel: widget.nurseServiceModel),
            const ChooseAppointmentDateTime(),
            Container(
              color: AppColors.whiteBgColor,
              padding: const EdgeInsets.all(8),
              child: Center(
                child: CustomButton(
                  bgColor: appointmentBookingController.isDateAndTimeSelected()
                      ? AppColors.primaryBlue
                      : AppColors.nextButonBg,
                  buttonName: "Next",
                  textColor:
                      !appointmentBookingController.isDateAndTimeSelected()
                          ? AppColors.grey2
                          : AppColors.nextButonBg,
                  onPress: appointmentBookingController.isDateAndTimeSelected()
                      ? () {
                          // Get.to(
                          //   () => HomeFootPayment(
                          //     doctorModel: widget.doctorModel,
                          //   ),
                          // );
                        }
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
