import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/reviews/review_rating_widget.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

class HomeScreenReviewsLayout extends StatefulWidget {
  const HomeScreenReviewsLayout({
    super.key,
  });

  @override
  State<HomeScreenReviewsLayout> createState() =>
      _HomeScreenReviewsLayoutState();
}

class _HomeScreenReviewsLayoutState extends State<HomeScreenReviewsLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Text(
            "Patient Reviews".toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ).tr(),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: FirestorePagination(
            shrinkWrap: false,
            query: getQuery(),
            viewType: ViewType.list,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            onEmpty: const Center(child: EmptyState()),
            itemBuilder: (context, documentSnapshots, index) {
              ReviewRatingModel reviewRatingModel = ReviewRatingModel.fromMap(
                  documentSnapshots[index].data() as Map);
              return ReviewRatingWidget(
                reviewRatingModel: reviewRatingModel,
              );
            },
          ),
        ),
      ],
    );
  }

  Query getQuery() {
    Query query = adminReviewsCollectionReference.orderBy("timestamp");
    return query;
  }
}
