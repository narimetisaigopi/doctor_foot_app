import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/foot_service_appointment_model.dart';
import 'package:drfootapp/screens/dash_board/profile/foot_appointments/foot_appointment_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

class FootAppointmentsListScreen extends StatefulWidget {
  final AppointmentStatus appointmentStatus;
  final String title;
  final bool showHeader;
  const FootAppointmentsListScreen(
      {super.key,
      required this.appointmentStatus,
      this.title = "",
      this.showHeader = false});

  @override
  State<FootAppointmentsListScreen> createState() =>
      _FootAppointmentsListScreenState();
}

class _FootAppointmentsListScreenState
    extends State<FootAppointmentsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty && widget.showHeader)
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
              FootServiceAppointmentModel footServiceAppointmentModel =
                  FootServiceAppointmentModel.fromSnapshot(
                      documentSnapshots[index].data() as Map);
              return FootAppointmentWidget(
                appointmentModel: footServiceAppointmentModel,
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
            "No orders",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  Query getQuery() {
    Query query = footServicesAppointmentsCollectionReference
        .where("uid", isEqualTo: Utility().getCurrentUserId())
        .where("appointmentStatus", isEqualTo: widget.appointmentStatus.index)
        .orderBy("timestamp");
    return query;
  }
}
