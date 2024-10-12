import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class ReviewRatingController extends GetxController {
  TextEditingController messageTextEditingController = TextEditingController();
  double selectedRating = 0;
  bool isLoading = false;
  
  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  ReviewRatingModel myRatingModel = ReviewRatingModel();

  CollectionReference getCollection(ReviewType reviewType) {
    CollectionReference collectionReference = footServicesCollectionReference;
    if (reviewType == ReviewType.appointment) {
      collectionReference = appointmentsCollectionReference;
    }
    return collectionReference;
  }

  DocumentReference getServicesReviewsCollection(
      ReviewType reviewType, String docId) {
    return getCollection(reviewType)
        .doc(docId)
        .collection("reviews")
        .doc(Utility().getCurrentUserId());
  }

  Future<ReviewRatingModel> getMyRating(
      ReviewType reviewType, String docId) async {
    _updateLoading(true);
    myRatingModel = ReviewRatingModel();
    DocumentSnapshot documentSnapshot =
        await getServicesReviewsCollection(reviewType, docId).get();
    if (documentSnapshot.exists) {
      myRatingModel = ReviewRatingModel.fromMap(documentSnapshot.data() as Map);
    }
    _updateLoading(false);
    return myRatingModel;
  }

  addReview(ReviewType reviewType, String docId) async {
    _updateLoading(true);
    ReviewRatingModel ratingModel = ReviewRatingModel();
    ratingModel.rating = selectedRating;
    ratingModel.review = messageTextEditingController.text;
    ratingModel.uid = Utility().getCurrentUserId();
    await getServicesReviewsCollection(reviewType, docId)
        .set(ratingModel.toMap());
    if (myRatingModel.uid.isNotEmpty) {
      //removing old reviews from shops
      await removeReviewsInShop(reviewType, docId);
    }
    //adding new reviews
    await addReviewInShops(reviewType, docId);
    selectedRating = 0;
    messageTextEditingController.clear();
    _updateLoading(false);
    Utility.toast("Thank you,\nreview submitted successfully.");
    Get.back();
  }

  addReviewInShops(ReviewType reviewType, String docId) async {
    await getCollection(reviewType).doc(docId).update({
      "review": FieldValue.increment(selectedRating),
      "noOfReviews": FieldValue.increment(1),
    });
  }

  removeReviewsInShop(
    ReviewType reviewType,
    String docId,
  ) async {
    ReviewRatingModel ratingModel = await getMyRating(reviewType, docId);
    await getCollection(reviewType).doc(docId).update({
      "review": FieldValue.increment(-ratingModel.rating),
      "noOfReviews": FieldValue.increment(-1),
    });
  }

  deleteReview(ReviewType reviewType, String docId) async {
    await getServicesReviewsCollection(reviewType, docId).delete();
    await removeReviewsInShop(reviewType, docId);
    Utility.toast("Deleted successfully.!!!");
    update();
  }
}
