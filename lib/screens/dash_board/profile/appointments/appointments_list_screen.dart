import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/screens/dash_board/profile/appointments/booked_appointment_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

class AppointmentsListScreen extends StatefulWidget {
  final AppointmentStatus appointmentStatus;
  final String title;
  final bool showHeader;
  const AppointmentsListScreen(
      {super.key,
      required this.appointmentStatus,
      this.title = "",
      this.showHeader = false});

  @override
  State<AppointmentsListScreen> createState() => _AppointmentsListScreenState();
}

class _AppointmentsListScreenState extends State<AppointmentsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty && widget.showHeader)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.black1,
              ),
            ),
          ),
        Expanded(
          child: FirestorePagination(
            shrinkWrap: false,
            query: getQuery(),
            onEmpty: Center(child: emptyState()),
            itemBuilder: (context, documentSnapshots, index) {
              AppointmentModel appointmentModel =
                  AppointmentModel.fromSnapshot(documentSnapshots[index]);
              return BookedAppointmentWidget(
                appointmentModel: appointmentModel,
                title: widget.title,
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
    logger("getCurrentUserId ${Utility().getCurrentUserId()}");
    Query query = appointmentsCollectionReference
        .where("uid", isEqualTo: Utility().getCurrentUserId())
        .where("appointmentStatus", isEqualTo: widget.appointmentStatus.index);
    return query;
  }
}
