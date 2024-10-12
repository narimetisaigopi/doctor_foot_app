import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/admin/doctor/create_doctor.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/doctor_widget.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAdminDoctorsScreen extends StatefulWidget {
  const AllAdminDoctorsScreen({super.key});

  @override
  State<AllAdminDoctorsScreen> createState() => _AllAdminDoctorsScreenState();
}

class _AllAdminDoctorsScreenState extends State<AllAdminDoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_outlined),
          onPressed: () {
            Get.to(() => const CreateDoctor());
          }),
      body: FirestorePagination(
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
            isAdmin: true,
          );
        },
      ),
    );
  }

  Query getQuery() {
    Query query = doctorsCollectionReference.orderBy("timestamp");
    return query;
  }
}
