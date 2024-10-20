import 'package:drfootapp/controllers/review_rating_controller.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/screens/reviewrating/review_rating_item.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewRatingsListScreen extends StatefulWidget {
  final ReviewType reviewType;
  final String docId;
  const ReviewRatingsListScreen(
      {super.key, required this.reviewType, required this.docId});

  @override
  State<ReviewRatingsListScreen> createState() =>
      _ReviewRatingsListScreenState();
}

class _ReviewRatingsListScreenState extends State<ReviewRatingsListScreen> {
  ReviewRatingController reviewRatingController =
      Get.put(ReviewRatingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: FirestorePagination(
        limit: 10,
        onEmpty: const Text("No Reviews"),
        itemBuilder: (context, documentSnapshots, index) {
          ReviewRatingModel reviewRatingModel =
              ReviewRatingModel.fromMap(documentSnapshots[index].data() as Map);
          return ReviewRatingItem(
            ratingModel: reviewRatingModel,
            reviewType: widget.reviewType,
          );
        },
        query: reviewRatingController
            .getCollection(widget.reviewType)
            .doc(widget.docId)
            .collection("reviews")
            .orderBy("timestamp"),
        viewType: ViewType.list,
        isLive: false,
      ),
    );
  }
}
