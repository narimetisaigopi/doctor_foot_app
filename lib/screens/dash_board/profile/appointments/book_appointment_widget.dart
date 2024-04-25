import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

class BookAppointmentWidget extends StatefulWidget {
  final AppointmentModel appointmentModel;
  const BookAppointmentWidget({super.key, required this.appointmentModel});

  @override
  State<BookAppointmentWidget> createState() => _BookAppointmentWidgetState();
}

class _BookAppointmentWidgetState extends State<BookAppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.whiteBgColor,
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
                  child: const SvgImageWidget(
                    path: AssetsConstants.wounded_foot,
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lorem Ipsum is...",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackBold),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.task_alt,
                                color: AppColors.greenColor,
                                size: 14,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Completed",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greenColor),
                              ),
                            ],
                          )
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
                          Icon(
                            Icons.location_pin,
                            color: AppColors.blackBold,
                            size: 16,
                          ),
                          Text(
                            "Lorem Ipsum is simply",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textBlackColor),
                          ),
                        ],
                      ),
                      Text(
                        "06/Nov/2023",
                        style: TextStyle(
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
