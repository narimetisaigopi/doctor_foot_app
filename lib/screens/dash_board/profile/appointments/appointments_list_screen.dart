import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/appointment_models/appointment_model.dart';
import 'package:drfootapp/screens/dash_board/profile/appointments/book_appointment_widget.dart';
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
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        const SizedBox(height: 22),
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
