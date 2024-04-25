import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/utils/enums.dart';

class FootServiceModel {
  String image;
  String docId;
  String uid;
  double originalPrice;
  double offerPrice;
  String title;
  String duration;
  String description;
  FootServices? footService;
  DressingServices? dressingService;
  bool isActive;
  Timestamp? timestamp;
  double review;
  double noOfReviews;

  FootServiceModel(
      {this.image = "",
      this.title = "",
      this.duration = "",
      this.docId = "",
      this.uid = "",
      this.originalPrice = 0.0,
      this.offerPrice = 0.0,
      this.description = "",
      this.isActive = true,
      this.footService = FootServices.dressingService,
      this.dressingService = DressingServices.small,
      this.timestamp,
      this.noOfReviews = 0,
      this.review = 0});

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'docId': docId,
      'uid': uid,
      'title': title,
      'duration': duration,
      'originalPrice': originalPrice,
      'offerPrice': offerPrice,
      'description': description,
      'footService': footService?.index,
      'dressingService': dressingService?.index,
      "isActive": isActive,
      "timestamp": DateTime.now(),
      "review": review,
      "noOfReviews": noOfReviews,
    };
  }

  factory FootServiceModel.fromJson(Map map) {
    return FootServiceModel(
      image: map['image'] ?? "",
      docId: map['docId'] ?? "",
      uid: map['uid'] ?? "",
      title: map['title'] ?? "",
      originalPrice: (map['originalPrice'] ?? 0).toDouble(),
      offerPrice: (map['offerPrice'] ?? 0).toDouble(),
      duration: map['duration'] ?? "",
      isActive: map["isActive"] ?? true,
      description: map['description'] ?? "",
      footService: map['footService'] != null
          ? FootServices.values[map['footService']]
          : null,
      dressingService: map['dressingService'] != null
          ? DressingServices.values[map['dressingService']]
          : null,
      timestamp: map["timestamp"],
      review: (map["review"] ?? 0).toDouble(),
      noOfReviews: (map["noOfReviews"] ?? 0).toDouble(),
    );
  }
}
