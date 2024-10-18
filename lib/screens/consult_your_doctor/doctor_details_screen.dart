import 'package:cached_network_image/cached_network_image.dart';
import 'package:drfootapp/controllers/appointment_booking_controller.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/booking_summary_screen.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/choose_appointment_date_time.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/exp_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final DoctorModel doctorModel;
  const DoctorDetailsScreen({super.key, required this.doctorModel});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  final AppointmentBookingController _appointmentBookingController =
      Get.put(AppointmentBookingController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentBookingController>(
        builder: (appointmentBookingController) {
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
            "Doctor Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteBgColor,
            ),
          ).tr(),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 84,
              child: Container(
                color: AppColors.whiteBgColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: AppColors.whiteBgColor,
                        height: MediaQuery.of(context).size.height * 0.34,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  const CustomImage(
                                    path:
                                        AssetsConstants.doctor_details_bg_image,
                                    height: 228,
                                    width: 206,
                                  ),
                                  Positioned(
                                    left: 25,
                                    right: 25,
                                    top: 25,
                                    bottom: 25,
                                    child: CircleAvatar(
                                      radius: 45,
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: widget.doctorModel.image,
                                          fit: BoxFit.contain,
                                          width: 158,
                                          height: 158,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Positioned(
                                top: 10,
                                right: 10,
                                child: Icon(
                                  Icons.favorite_border,
                                  color: AppColors.primaryBlue,
                                ))
                          ],
                        ),
                      ),

                      // const Stack(children: [
                      //   Positioned(
                      //       top: 6,
                      //       right: 6,
                      //       child: Icon(
                      //         Icons.favorite_border,
                      //       ))
                      // ]),
                      const SizedBox(height: 8),
                      Text(
                        "DR. ${widget.doctorModel.name}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black2,
                        ),
                      ).tr(),
                      const Text(
                        "General",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2,
                        ),
                      ).tr(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ExpWidget(
                            image: AssetsConstants.patients,
                            totolCount: "${widget.doctorModel.noOfPatients}+",
                            title: "General",
                            bgColor: AppColors.expBg,
                          ),
                          ExpWidget(
                            image: AssetsConstants.experience,
                            totolCount:
                                "${widget.doctorModel.yearsOfExperiance}years+",
                            title: "Experience",
                            bgColor: AppColors.expBg,
                          ),
                          const ExpWidget(
                            image: AssetsConstants.star_image,
                            totolCount: "4.8",
                            title: "Rating",
                            bgColor: AppColors.expBg,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(
                        color: AppColors.bggrey,
                        thickness: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 12, bottom: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "About",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ).tr(),
                            ),
                            const SizedBox(height: 6),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                widget.doctorModel.about,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.start,
                              ).tr(),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: AppColors.bggrey,
                        thickness: 10,
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ChooseAppointmentDateTime(),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                          Get.to(
                            () => BookingSummaryScreen(
                              doctorModel: widget.doctorModel,
                            ),
                          );
                        }
                      : null,
                ),
              ),
            ),
          ],
        ),
      );
    }
    );
  }
}
