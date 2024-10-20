import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class ReviewRatingController extends GetxController {
  TextEditingController messageTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  double selectedRating = 0;
  bool isLoading = false;

  XFile? selectedXFile;

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  ReviewRatingModel myRatingModel = ReviewRatingModel();

  CollectionReference getCollection(ReviewType reviewType) {
    CollectionReference collectionReference =
        footServicesAppointmentsCollectionReference;
    if (reviewType == ReviewType.doctor) {
      collectionReference = doctorsCollectionReference;
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
    try {
      _updateLoading(true);
      ReviewRatingModel ratingModel = ReviewRatingModel();
      ratingModel.noOfStars = selectedRating;
      ratingModel.reviewText = messageTextEditingController.text;
      ratingModel.uid = Utility().getCurrentUserId();
      DocumentReference documentReference = reviewsCollectionReference.doc();
      ratingModel.docId = documentReference.id;
      ratingModel.reviewType = reviewType;
      ratingModel.serviceId = docId;
      await documentReference.set(ratingModel.toMap());
      //adding new reviews
      if (reviewType == ReviewType.doctor) {
        await addReviewInDoctor(reviewType, docId);
      }
      resetFields();
      Utility.toast("Thank you,\nreview submitted successfully.");
      Get.back();
    } catch (e) {
      logger("addReview $e");
      Utility.toast("Failed to add review $e");
    } finally {
      _updateLoading(false);
    }
  }

  resetFields() {
    selectedRating = 0;
    messageTextEditingController.clear();
  }

  addReviewInDoctor(ReviewType reviewType, String docId) async {
    await getCollection(reviewType).doc(docId).update({
      "totalRating": FieldValue.increment(selectedRating),
      "reviewCount": FieldValue.increment(1),
    });
  }

  removeReview(
    ReviewType reviewType,
    String docId,
  ) async {
    ReviewRatingModel ratingModel = await getMyRating(reviewType, docId);
    await getCollection(reviewType).doc(docId).update({
      "review": FieldValue.increment(-ratingModel.noOfStars),
      "noOfReviews": FieldValue.increment(-1),
    });
  }

  deleteReview(ReviewType reviewType, String docId) async {
    await getServicesReviewsCollection(reviewType, docId).delete();
    await removeReview(reviewType, docId);
    Utility.toast("Deleted successfully.!!!");
    update();
  }

  adminAddReview() async {
    _updateLoading(true);
    ReviewRatingModel ratingModel = ReviewRatingModel();
    ratingModel.noOfStars = selectedRating;
    ratingModel.reviewText = messageTextEditingController.text;
    ratingModel.uid = Utility().getCurrentUserId();
    _updateLoading(false);
    Utility.toast("Thank you,\nreview submitted successfully.");
    Get.back();
  }
}
