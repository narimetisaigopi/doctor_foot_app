import 'package:drfootapp/controllers/review_rating_controller.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/screens/reviewrating/review_rating_item.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class ReviewRatingsListScreen extends StatefulWidget {
  final ReviewType reviewType;
  final String docId;
  const ReviewRatingsListScreen(
      {Key? key, required this.reviewType, required this.docId})
      : super(key: key);

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
      body: PaginateFirestore(
        itemsPerPage: 10,
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
        itemBuilderType: PaginateBuilderType.listView,
        isLive: false,
      ),
    );
  }
}
