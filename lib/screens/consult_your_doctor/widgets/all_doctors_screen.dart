import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/doctor_appointment_details_date_time_screen.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/doctor_widget.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllDoctorsScreen extends StatefulWidget {
  const AllDoctorsScreen({super.key});

  @override
  State<AllDoctorsScreen> createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: FirestorePagination(
        shrinkWrap: false,
        query: getQuery(),
        viewType: ViewType.list,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        onEmpty: const Center(child: EmptyState()),
        itemBuilder: (context, documentSnapshots, index) {
          DoctorModel doctorModel =
              DoctorModel.fromMap(documentSnapshots[index].data() as Map);
          return DoctorWidget(
            doctorModel: doctorModel,
            onPressed: () {
              Get.to(() => DoctorAppointmentDetailsDateTimeScreen(
                    doctorModel: doctorModel,
                  ));
            },
          );
        },
      ),
    );
  }

  Query getQuery() {
    Query query = doctorsCollectionReference
        .where("isActive", isEqualTo: true)
        .orderBy("timestamp");
    return query;
  }
}
