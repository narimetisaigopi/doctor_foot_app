import 'package:drfootapp/controllers/appointment_booking_controller.dart';
import 'package:drfootapp/controllers/doctors_controller.dart';
import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/doctor_detail_widget.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/exp_widget.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BookingHistoryScreen extends StatefulWidget {
  final AppointmentModel appointmentModel;
  const BookingHistoryScreen({super.key, required this.appointmentModel});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  DoctorModel doctorModel = DoctorModel();
  @override
  void initState() {
    Get.put(DoctorsController())
        .getDoctorDetailsByUid(widget.appointmentModel.doctorId)
        .then((data) {
      setState(() {
        doctorModel = data;
      });
    });
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
          "Booking  History",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
        centerTitle: true,
        actions: [
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
                    title: ' Are sure you want to  \n  Cancel Booking ',
                    no: () {
                      Get.back();
                    },
                    yes: () {
                      Get.put(AppointmentBookingController())
                          .cancelAppointment(widget.appointmentModel)
                          .then((e) {
                        cancelledAppointmentAlert(
                            title: '', upload: () async {});
                      });
                      // customAlert(
                      //   title: '',
                      //   upload: () {
                      //     Get.back();
                      //     Get.back();
                      //   },
                      // );
                      
                    },
                  );
                },
              ),
              _buildPopupMenuItem(
                'Contact us',
                AppColors.black1,
                () {},
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
                  Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CustomNetworkImageWidget(
                            height: 300,
                            width: double.infinity,
                            path: doctorModel.image,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .3,
                          right: 10.0,
                          left: 10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.whiteBgColor,
                            border: Border.all(
                              color: AppColors.grey4,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "About the Doctor",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black2,
                                  ),
                                ).tr(),
                                Text(
                                  "DR. ${doctorModel.name}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blackBold,
                                  ),
                                ).tr(),
                                Row(
                                  children: [
                                    const Text(
                                      "Speaks ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey,
                                      ),
                                    ).tr(),
                                    Text(
                                      "${doctorModel.speakingLanguagesList.toList()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryBlue,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const ExpWidget(
                                        image: AssetsConstants.patients,
                                        totolCount: "500+",
                                        title: "General",
                                      ),
                                      const VerticalDivider(
                                        color: AppColors.grey,
                                        thickness: 1,
                                      ),
                                      ExpWidget(
                                        image: AssetsConstants.experience,
                                        totolCount:
                                            "${doctorModel.yearsOfExperiance} years+",
                                        title: "Experience",
                                      ),
                                      const VerticalDivider(
                                        color: AppColors.grey,
                                        thickness: 1,
                                      ),
                                      const ExpWidget(
                                        image: AssetsConstants.star_image,
                                        totolCount: "4.8",
                                        title: "Rating",
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DoctorDetailWidget(
                    appointmentModel: widget.appointmentModel,
                    doctorModel: doctorModel,
                  ),
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

  Future<bool?> cancelledAppointmentAlert({
    required String title,
    required VoidCallback upload,
  }) {
    return Alert(
      context: context,
      title: title,
      content: const Column(
        children: [
          Text(
            "Appointment Canceled",
            style: TextStyle(
              color: AppColors.cancelColor,
              fontSize: 20,
            ),
          ),
          Text(
            "You have canceled Your \nappointment",
            style: TextStyle(
              color: AppColors.black2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          CustomImage(
            path: AssetsConstants.cancel_image,
            height: 169,
            width: 223,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: upload,
          color: AppColors.cancelColor,
          child: const Text(
            "Back to Home",
            style: TextStyle(
              color: AppColors.whiteBgColor,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ).show();
  }

  Future<bool?> customAlert({
    required String title,
    required VoidCallback no,
    required VoidCallback yes,
  }) {
    return Alert(
      context: context,
      type: AlertType.error,
      title: title,
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
