import 'package:drfootapp/controllers/doctors_controller.dart';
import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:drfootapp/utils/widgets/rating_book_again.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookedAppointmentWidget extends StatefulWidget {
  final AppointmentModel appointmentModel;
  final String title;
  const BookedAppointmentWidget(
      {super.key, required this.appointmentModel, this.title = ""});

  @override
  State<BookedAppointmentWidget> createState() =>
      _BookedAppointmentWidgetState();
}

class _BookedAppointmentWidgetState extends State<BookedAppointmentWidget> {
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
          return widget.appointmentModel.appointmentStatus ==
                      AppointmentStatus.cancelled ||
                  widget.appointmentModel.appointmentStatus ==
                      AppointmentStatus.cancelledByUser ||
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
                        const SizedBox(height: 12),
                        RatingBookAgainWidget(
                          onBookAgainPressed: () {},
                          onRateServicePressed: () {
                            // Utility.myBottomSheet(context,
                            //     widget: AddReviewRatingsScreen(
                            //       docId:
                            //           widget.serviceBookingOrderModel.serviceId,
                            //       reviewType: ReviewType.homeService,
                            //     ),
                            //     heightFactor: 0.7);
                          },
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
            AppointmentStatus.cancelled ||
        widget.appointmentModel.appointmentStatus ==
            AppointmentStatus.cancelledByUser) {
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
            AppointmentStatus.cancelled ||
        widget.appointmentModel.appointmentStatus ==
            AppointmentStatus.cancelledByUser) {
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
    return Padding(
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
                  child: CustomNetworkImageWidget(
                    path: doctorModel.image,
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
                            "Dr. ${doctorModel.name}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackBold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.ratingBarColor,
                            size: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackBold),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "(123 Reviews)",
                            style: TextStyle(
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
                            doctorModel.address,
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
    );
  }
}
