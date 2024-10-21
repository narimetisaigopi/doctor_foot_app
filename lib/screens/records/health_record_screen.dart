import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/ulcer/have_ulcer_model.dart';
import 'package:drfootapp/screens/records/all_recent_images.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'health_record_image.dart';

class HealthRecordScreen extends StatefulWidget {
  const HealthRecordScreen({super.key});

  @override
  State<HealthRecordScreen> createState() => _HealthRecordScreenState();
}

class _HealthRecordScreenState extends State<HealthRecordScreen> {
  XFile? xFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: CustomAppbar(
        title: "Images",
        actions: [
          InkWell(
            onTap: () {
              // Get.to(() => const RiskFactorScreen());
            },
            child: const Icon(
              Icons.search,
              color: AppColors.whiteBgColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(
            Icons.more_vert,
            color: AppColors.whiteBgColor,
            size: 24,
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            decoration: const BoxDecoration(
              color: AppColors.whiteBgColor,
            ),
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: AllRecentImages(),
            ),
          ),
          Expanded(
            child: FirestorePagination(
              shrinkWrap: false,
              query: getQuery(),
              viewType: ViewType.list,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              onEmpty: const Center(child: EmptyState()),
              itemBuilder: (context, documentSnapshots, index) {
                HaveUlcerModel haveUlcerModel = HaveUlcerModel.fromMap(
                    documentSnapshots[index].data() as Map);
                return HealthRecordWidget(
                  date: haveUlcerModel.timestamp,
                  imagesList: haveUlcerModel.haveUlcer
                      ? haveUlcerModel.yesImages
                      : haveUlcerModel.noImages,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {
          pickImage();
          setState(() {});
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: AppColors.whiteBgColor,
          ),
        ),
      ),
    );
  }

  Query getQuery() {
    Query query = haveUlcerCollectionReference
        .where("uid", isEqualTo: Utility().getCurrentUserId())
        .orderBy("timestamp");
    return query;
  }

  pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    xFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      Utility.appointmentCancelledDialog(
        onDone: Utility.goToHome,
        // ignore: use_build_context_synchronously
        context: context,
      );
      setState(() {});
    } else {
      Utility.toast(
        "Image Not Picked",
      );
    }
  }
}
