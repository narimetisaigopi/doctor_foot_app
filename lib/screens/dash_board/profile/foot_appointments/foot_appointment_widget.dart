import 'package:drfootapp/controllers/doctors_controller.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/models/foot_service_appointment_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/doctor_appointment_details_date_time_screen.dart';
import 'package:drfootapp/screens/foot_services/foot_service_appointment_details_screen.dart';
import 'package:drfootapp/screens/reviewrating/add_review_ratings_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:drfootapp/utils/widgets/rating_book_again_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootAppointmentWidget extends StatefulWidget {
  final FootServiceAppointmentModel appointmentModel;
  final String title;
  const FootAppointmentWidget(
      {super.key, required this.appointmentModel, this.title = ""});

  @override
  State<FootAppointmentWidget> createState() => _FootAppointmentWidgetState();
}

class _FootAppointmentWidgetState extends State<FootAppointmentWidget> {
  DoctorModel doctorModel = DoctorModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DoctorModel>(
        future: Get.put(DoctorsController())
            .getDoctorDetailsByUid(widget.appointmentModel.doctorId),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            doctorModel = snapshot.data ?? DoctorModel();
          }
          return Utility.isAppointmentCancelled(
                      widget.appointmentModel.appointmentStatus) ||
                  widget.appointmentModel.appointmentStatus ==
                      AppointmentStatus.completed
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.whiteBgColor,
                        border: Border.all(
                          color: AppColors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        headerLabel(),
                        const SizedBox(height: 12),
                        appointmentWidget(),
                        if (!Utility.isAppointmentCancelled(
                            widget.appointmentModel.appointmentStatus))
                          Column(
                            children: [
                              const SizedBox(height: 12),
                              RatingBookAgainLayout(
                                onBookAgainPressed: () {
                                  Get.to(() =>
                                      DoctorAppointmentDetailsDateTimeScreen(
                                          doctorModel: doctorModel));
                                },
                                onRateServicePressed: () {
                                  Utility.myBottomSheet(context,
                                      widget: AddReviewRatingsScreen(
                                        docId: widget.appointmentModel.docId,
                                        reviewType: ReviewType.doctor,
                                      ),
                                      heightFactor: 0.7);
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                )
              : appointmentWidget();
        });
  }

  IconData getIcon() {
    IconData iconData = Icons.download_done_rounded;
    if (widget.appointmentModel.appointmentStatus ==
        AppointmentStatus.cancelled) {
      iconData = Icons.cancel_rounded;
    }
    return iconData;
  }

  Color getColor() {
    Color color = AppColors.black1;
    if (widget.appointmentModel.appointmentStatus ==
        AppointmentStatus.completed) {
      color = AppColors.successColor;
    }
    if (widget.appointmentModel.appointmentStatus ==
        AppointmentStatus.cancelled) {
      color = AppColors.cancelColor;
    }
    return color;
  }

  Widget headerLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          getIcon(),
          color: getColor(),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: getColor(),
          ),
        )
      ],
    );
  }

  Widget appointmentWidget() {
    return InkWell(
      onTap: () {
        Get.to(() => FootServiceAppointmentDetailsScreen(
            footServiceAppointmentModel: widget.appointmentModel));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Container(
          height: 132,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.whiteBgColor,
              border: Border.all(
                color: AppColors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: CustomImage(
                      path: widget.appointmentModel.footServiceModel!.image,
                      height: 108,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${Utility.enumToString(widget.appointmentModel.footServiceModel!.footServiceType).replaceAll(widget.appointmentModel.footServiceModel!.title, "")} - ${widget.appointmentModel.footServiceModel!.title}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackBold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.ratingBarColor,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.appointmentModel.footServiceModel!
                                  .averageRating
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackBold),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "(${widget.appointmentModel.footServiceModel!.reviewCount} Reviews)",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textBlackColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: AppColors.blackBold,
                              size: 16,
                            ),
                            Text(
                              widget.appointmentModel.addressModel!
                                  .getAddress(),
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textBlackColor),
                            ),
                          ],
                        ),
                        Text(
                          widget.appointmentModel.appointmentDate,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackBold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
