import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/firebase_storage_controller.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ReviewRatingController extends GetxController {
  TextEditingController messageTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  int selectedRating = 0;
  bool isLoading = false;

  XFile? xFile;

  // Method to pick an image file
  Future<void> pickFile() async {
    xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

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

  Future<void> addReview(ReviewType reviewType, String docId,
      {bool isAdmin = false, ReviewRatingModel? reviewRatingModel}) async {
    try {
      _updateLoading(true);
      final String currentUserId = Utility().getCurrentUserId();
      CollectionReference collectionReference = reviewsCollectionReference;
      ReviewRatingModel newReviewRatingModel =
          reviewRatingModel ?? ReviewRatingModel();
      newReviewRatingModel.noOfStars = selectedRating.toInt();
      newReviewRatingModel.reviewText = messageTextEditingController.text;
      newReviewRatingModel.uid = currentUserId;
      newReviewRatingModel.reviewType = reviewType;
      newReviewRatingModel.serviceId = docId;
      if (isAdmin) {
        collectionReference = adminReviewsCollectionReference;
        if (xFile != null) {
          String url = await Get.put(FirebaseStorageController())
              .uploadImageToFirebase(
                  directoryName: storageAdminReviews, uploadFile: xFile!);
          newReviewRatingModel.profileUrl = url;
        }
        newReviewRatingModel.name = nameTextEditingController.text;
      }
      if (reviewRatingModel == null) {
        newReviewRatingModel.docId = collectionReference.doc().id;
        await collectionReference
            .doc(newReviewRatingModel.docId)
            .set(newReviewRatingModel.toMap());
      } else {
        await collectionReference
            .doc(newReviewRatingModel.docId)
            .update(newReviewRatingModel.toMap());
      }

      if (reviewType == ReviewType.doctor) {
        await addReviewInDoctor(reviewType, docId);
      }
      _onReviewSubmitted();
    } catch (e, stackTrace) {
      logger("Failed to add review: $e");
      logger(stackTrace.toString());
      Utility.toast("Failed to submit review. Please try again.");
    } finally {
      _updateLoading(false);
    }
  }

  void _onReviewSubmitted() {
    resetFields();
    Utility.toast("Thank you,\nreview submitted successfully.");
    Get.back();
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

  deleteBanner(ReviewRatingModel reviewRatingModel) async {
    await adminReviewsCollectionReference.doc(reviewRatingModel.docId).delete();
    await Get.put(FirebaseStorageController())
        .deleteImage(reviewRatingModel.profileUrl);
    Utility.toast("Deleted successfully.");
  }
}
