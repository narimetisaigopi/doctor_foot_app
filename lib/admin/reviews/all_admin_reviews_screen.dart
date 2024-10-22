import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/reviews/review_rating_widget.dart';
import 'package:drfootapp/screens/reviewrating/add_review_ratings_screen.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

class AllAdminReviewsScreen extends StatefulWidget {
  const AllAdminReviewsScreen({super.key});

  @override
  State<AllAdminReviewsScreen> createState() => _AllAdminReviewsScreenState();
}

class _AllAdminReviewsScreenState extends State<AllAdminReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_outlined),
          onPressed: () {
            Utility.myBottomSheet(context,
                widget: const AddReviewRatingsScreen(
                  docId: "",
                  isAdmin: true,
                  reviewType: ReviewType.admin,
                ),
                heightFactor: 0.7);
          }),
      body: FirestorePagination(
        shrinkWrap: false,
        query: getQuery(),
        viewType: ViewType.grid,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.2),
        onEmpty: const Center(child: EmptyState()),
        itemBuilder: (context, documentSnapshots, index) {
          ReviewRatingModel reviewRatingModel =
              ReviewRatingModel.fromMap(documentSnapshots[index].data() as Map);
          return ReviewRatingWidget(
            reviewRatingModel: reviewRatingModel,
            isAdmin: true,
          );
        },
      ),
    );
  }

  Query getQuery() {
    Query query = adminReviewsCollectionReference.orderBy("timestamp");
    return query;
  }
}
