import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/screens/dash_board/profile/appointments/book_appointment_widget.dart';
import 'package:drfootapp/screens/dash_board/profile/appointments/rate_and_booking_button.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

class AppointmentsListScreen extends StatefulWidget {
  final AppointmentStatus appointmentStatus;
  final String title;
  const AppointmentsListScreen(
      {super.key, required this.appointmentStatus, this.title = ""});

  @override
  State<AppointmentsListScreen> createState() => _AppointmentsListScreenState();
}

class _AppointmentsListScreenState extends State<AppointmentsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 12),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        const SizedBox(height: 12),
        Expanded(
          child: FirestorePagination(
            shrinkWrap: false,
            query: getQuery(),
            onEmpty: Center(child: emptyState()),
            itemBuilder: (context, documentSnapshots, index) {
              AppointmentModel homeDressingModel =
                  AppointmentModel.fromSnapshot(documentSnapshots);
              return BookAppointmentWidget(
                appointmentModel: homeDressingModel,
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 12),
          child: Text(
            "Completed",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: FirestorePagination(
            shrinkWrap: false,
            query: getQuery(),
            onEmpty: Center(child: emptyState()),
            itemBuilder: (context, documentSnapshots, index) {
              AppointmentModel homeDressingModel =
                  AppointmentModel.fromSnapshot(documentSnapshots);
              return Padding(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.download_done_rounded,
                            color: AppColors.greenColor,
                          ),
                          Text(
                            "Completed",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greenColor,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      BookAppointmentWidget(
                        appointmentModel: homeDressingModel,
                      ),
                      const SizedBox(height: 12),
                      const IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RateAndBookingButton(
                              bgColor: AppColors.buttonBg,
                              buttonName: "Rate Service",
                              fontSize: 14,
                              icon: Icons.star,
                              isIconNeeded: true,
                              iconColor: AppColors.whiteBgColor,
                            ),
                            VerticalDivider(
                              color: AppColors.black2,
                              thickness: 1,
                            ),
                            RateAndBookingButton(
                              bgColor: AppColors.primaryBlue,
                              buttonName: "Book Again",
                              fontSize: 14,
                              icon: Icons.restart_alt_outlined,
                              isIconNeeded: true,
                              iconColor: AppColors.whiteBgColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget emptyState() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.calendar_month_outlined,
            color: AppColors.primary,
            size: 40,
          ),
          Text(
            "No Appointments",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  Query getQuery() {
    Query query = appointmentsCollectionReference.where("uid",
        isEqualTo: getCurrentUserId());
    //.where("appointmentStatus", isEqualTo: widget.appointmentStatus.index);
    return query;
  }
}
