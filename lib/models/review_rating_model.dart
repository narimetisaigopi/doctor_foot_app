import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/utils/enums.dart';

class ReviewRatingModel {
  String docId;
  String uid;
  String reviewText;
  double noOfStars;
  Timestamp? timestamp;
  String serviceId;
  ReviewType reviewType;
  // this is for admin reviews
  String profileUrl;
  String name;

  ReviewRatingModel(
      {this.profileUrl = "",
      this.name = "",
      this.uid = "",
      this.reviewText = "",
      this.timestamp,
      this.noOfStars = 0.0,
      this.docId = "",
      this.serviceId = "",
      this.reviewType = ReviewType.doctor});

  factory ReviewRatingModel.fromMap(Map map) {
    return ReviewRatingModel(
      uid: map['uid'] ?? "",
      reviewText: map['review'] ?? "",
      timestamp: map['timestamp'] ?? "",
      noOfStars: map['rating'] ?? 0.0,
      serviceId: map['serviceId'] ?? "",
      docId: map['docId'] ?? "",
      name: map['name'] ?? "",
      profileUrl: map['profileUrl'] ?? "",
      reviewType: map['reviewType'] != null
          ? ReviewType.values[map['reviewType']]
          : ReviewType.doctor,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "review": reviewText,
      "name": name,
      "profileUrl": profileUrl,
      "timestamp": DateTime.now(),
      "rating": noOfStars,
      "serviceId": serviceId,
      "docId": docId,
      "reviewType": reviewType.index,
    };
  }
}
