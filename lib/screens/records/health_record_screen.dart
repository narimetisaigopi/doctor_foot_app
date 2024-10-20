import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/ulcer/have_ulcer_model.dart';
import 'package:drfootapp/screens/records/all_recent_images.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'uploaded_image.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Images",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
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
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteBgColor,
              ),
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recently Upload",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.imagesTextColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    AllRecentImages()
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: FirestorePagination(
            shrinkWrap: false,
            query: getQuery(),
            viewType: ViewType.grid,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            onEmpty: const Center(child: EmptyState()),
            itemBuilder: (context, documentSnapshots, index) {
              HaveUlcerModel haveUlcerModel = HaveUlcerModel.fromMap(
                  documentSnapshots[index].data() as Map);
              return UploadedImage(
                date: haveUlcerModel.timestamp.toString(),
                imagesList: haveUlcerModel.haveUlcer
                    ? haveUlcerModel.yesImages
                    : haveUlcerModel.noImages,
              );
            },
          )),
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
    Query query = haveUlcerCollectionReference.orderBy("timestamp");
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
