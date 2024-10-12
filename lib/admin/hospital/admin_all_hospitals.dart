import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/admin/hospital/create_hospital.dart';
import 'package:drfootapp/models/hospital_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/hospital_widget.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAdminHospitalsScreen extends StatefulWidget {
  const AllAdminHospitalsScreen({super.key});

  @override
  State<AllAdminHospitalsScreen> createState() =>
      _AllAdminHospitalsScreenState();
}

class _AllAdminHospitalsScreenState extends State<AllAdminHospitalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_outlined),
          onPressed: () {
        Get.to(() => const CreateHospital());
      }),
      body: FirestorePagination(
        shrinkWrap: false,
        query: getQuery(),
        viewType: ViewType.list,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        onEmpty: const Center(child: EmptyState()),
        itemBuilder: (context, documentSnapshots, index) {
          HospitalModel hospitalModel =
              HospitalModel.fromMap(documentSnapshots[index].data() as Map);
          return HospitalWidget(
            hospitalModel: hospitalModel,
            isAdmin: true,
          );
        },
      ),
    );
  }

  Query getQuery() {
    Query query = hospitalsCollectionReference.orderBy("timestamp");
    return query;
  }
}
