import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewRatingModel {
  String uid;
  String review;
  double rating;
  Timestamp? timestamp;

  ReviewRatingModel(
      {this.uid = "", this.review = "", this.timestamp, this.rating = 0.0});

  factory ReviewRatingModel.fromMap(Map map) {
    return ReviewRatingModel(
      uid: map['uid'] ?? "",
      review: map['review'] ?? "",
      timestamp: map['timestamp'] ?? "",
      rating: map['rating'] ?? 0.0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "review": review,
      "timestamp": DateTime.now(),
      "rating": rating
    };
  }
}
