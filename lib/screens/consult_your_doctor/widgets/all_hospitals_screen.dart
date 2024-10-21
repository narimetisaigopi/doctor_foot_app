import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/hospital_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/find_your_doctors_screen.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/hospital_widget.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllHospitalsScreen extends StatefulWidget {
  const AllHospitalsScreen({super.key});

  @override
  State<AllHospitalsScreen> createState() => _AllHospitalsScreenState();
}

class _AllHospitalsScreenState extends State<AllHospitalsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          HospitalModel hospitalModel =
              HospitalModel.fromMap(documentSnapshots[index].data() as Map);
          return HospitalWidget(
            hospitalModel: hospitalModel,
            isAdmin: false,
            onViewPressed: () {
              Get.to(() => FindYourDoctorsScreen(
                    hospitalModel: hospitalModel,
                  ));
            },
          );
        },
      ),
    );
  }

  Query getQuery() {
    Query query = hospitalsCollectionReference
        .where("isActive", isEqualTo: true)
        .orderBy("timestamp");
    return query;
  }
}
