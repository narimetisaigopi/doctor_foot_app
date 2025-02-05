import 'package:drfootapp/controllers/foot_service_appointment_controller.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/models/foot_service_appointment_model.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/contact_us_screen.dart';
import 'package:drfootapp/screens/foot_services/foor_service_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FootServiceAppointmentDetailsScreen extends StatefulWidget {
  final FootServiceAppointmentModel footServiceAppointmentModel;
  const FootServiceAppointmentDetailsScreen(
      {super.key, required this.footServiceAppointmentModel});

  @override
  State<FootServiceAppointmentDetailsScreen> createState() =>
      _FootServiceAppointmentDetailsScreenState();
}

class _FootServiceAppointmentDetailsScreenState
    extends State<FootServiceAppointmentDetailsScreen> {
  DoctorModel doctorModel = DoctorModel();
  @override
  void initState() {
    // Get.put(DoctorsController())
    //     .getDoctorDetailsByUid(widget.appointmentModel.doctorId)
    //     .then((data) {
    //   setState(() {
    //     doctorModel = data;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Booking History",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
        centerTitle: true,
        actions: [
          if (!Utility.isAppointmentCancelled(
              widget.footServiceAppointmentModel.appointmentStatus))
            PopupMenuButton(
              icon: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Icon(
                      Icons.question_mark_sharp,
                      color: AppColors.black1,
                      size: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    "Help",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteBgColor,
                    ),
                  )
                ],
              ),
              itemBuilder: (ctx) => [
                _buildPopupMenuItem(
                  'Cancel Booking',
                  AppColors.redColor,
                  () {
                    customAlert(
                      // title: ' Are sure you want to  \n  Cancel Booking ',
                      no: () {
                        Get.back();
                      },
                      yes: () {
                        Get.put(FootServiceAppointmentController())
                            .cancelAppointment(
                                widget.footServiceAppointmentModel)
                            .then((e) {
                          Utility.stateAlertDialog(
                              title: "Appointment Canceled",
                              description:
                                  "You have canceled Your \nappointment",
                            onDone: Utility.goToHome,
                            // ignore: use_build_context_synchronously
                            context: context,
                              buttonText: "Back to Home"
                          );
                        });
                      },
                    );
                  },
                ),
                _buildPopupMenuItem(
                  'Contact us',
                  AppColors.black1,
                  () {
                    Get.to(() => const ContactUsScreen());
                  },
                ),
              ],
            )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 84,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FootServiceWidget(
                      nurseServiceModel:
                          widget.footServiceAppointmentModel.footServiceModel!),
                  const SizedBox(height: 20),
                  // DoctorDetailWidget(
                  //   appointmentModel: widget.footServiceAppointmentModel.appointmentStatus,
                  //   doctorModel: doctorModel,
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Center(
                child: CustomButton(
                  bgColor: AppColors.primaryBlue,
                  buttonName: "Back to Home",
                  textColor: AppColors.whiteBgColor,
                  onPress: () {
                    Get.to(() => const DashBoardScreen());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, Color color, Function()? onPress) {
    return PopupMenuItem(
      onTap: onPress,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
    );
  }

  Future<bool?> customAlert({
    required VoidCallback no,
    required VoidCallback yes,
  }) {
    return Alert(
      context: context,
      content: const Column(
        children: [
          CustomImage(
            path: AssetsConstants.cancel_booking,
            height: 64,
            width: 64,
          ),
          Text(
            "Are sure you want to \nCancel Booking",
            style: TextStyle(
              color: AppColors.black1,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: no,
          color: AppColors.redBgColor,
          child: const Text(
            "No",
            style: TextStyle(
              color: AppColors.redColor,
              fontSize: 20,
            ),
          ),
        ),
        DialogButton(
          onPressed: yes,
          color: AppColors.primaryBlue,
          child: const Text(
            "Yes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        )
      ],
    ).show();
  }
}
