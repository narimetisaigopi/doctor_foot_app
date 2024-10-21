import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/ulcer/have_ulcer_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

import 'health_record_image.dart';

class AllRecentImages extends StatefulWidget {
  const AllRecentImages({super.key});

  @override
  State<AllRecentImages> createState() => _AllRecentImagesState();
}

class _AllRecentImagesState extends State<AllRecentImages> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: Column(
        children: [
          const Text(
            "Recently Upload",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.imagesTextColor,
            ),
          ),
          const SizedBox(height: 8),
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
                List imagesList = haveUlcerModel.haveUlcer
                    ? haveUlcerModel.yesImages
                    : haveUlcerModel.noImages;
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: imagesList.length,
                      itemBuilder: (ctx, index) {
                        String url = imagesList[index];
                        return imageAndFileName(
                            url: url, width: 60, height: 60);
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Query getQuery() {
    Query query = haveUlcerCollectionReference
        .where("uid", isEqualTo: Utility().getCurrentUserId())
        .limit(1)
        .orderBy("timestamp");
    return query;
  }
}
