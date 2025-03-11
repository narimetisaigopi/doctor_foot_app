import 'package:drfootapp/models/address_model.dart';

class PartnerModel {
  String docId;
  String regNo;
  String userName;
  String gender;
  int age;
  String mobileNumber;
  String city;
  String profilePic;
  String androidToken;
  String appleToken;
  String degree;
  dynamic timestamp;
  dynamic modifiedAt;
  bool isOnline;
  dynamic onlineTimestamp;
  double rating;
  int noOfRatings;
  AddressModel? addressModel;

  PartnerModel(
      {this.docId = "",
      this.userName = "",
      this.gender = "",
      this.age = 0,
      this.mobileNumber = "",
      this.city = "",
      this.profilePic = "",
      this.androidToken = "",
      this.appleToken = "",
      this.degree = "",
      this.timestamp,
      this.modifiedAt,
      this.isOnline = false,
      this.onlineTimestamp,
      this.regNo = "",
      this.rating = 0.0,
      this.noOfRatings = 0,
      this.addressModel});

  factory PartnerModel.fromJson(Map json) {
    return PartnerModel(
        docId: json['docId'] ?? "",
        userName: json['userName'] ?? "",
        gender: json['gender'] ?? "",
        age: json['age'] ?? 0,
        mobileNumber: json['mobileNumber'] ?? "",
        city: json['city'] ?? "",
        profilePic: json['profilePic'] ?? "",
        androidToken: json['androidToken'] ?? "",
        appleToken: json['appleToken'] ?? "",
        degree: json['degree'] ?? "",
        timestamp: json['timestamp'],
        modifiedAt: json['modifiedAt'],
        isOnline: json["isOnline"] ?? false,
        onlineTimestamp: json["onlineTimestamp"],
        regNo: json["regNo"] ?? "",
        noOfRatings: json["noOfRatings"] ?? 0,
        rating: json["rating"] ?? 0.0,
        addressModel: json["address"] != null
            ? AddressModel.fromMap(json["address"])
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'userName': userName,
      'gender': gender,
      'age': age,
      'mobileNumber': mobileNumber,
      'city': city,
      'profilePic': profilePic,
      'androidToken': androidToken,
      'appleToken': appleToken,
      'degree': degree,
      'timestamp': timestamp,
      'modifiedAt': modifiedAt,
      'isOnline': isOnline,
      'onlineTimestamp': onlineTimestamp,
      "regNo": regNo,
      "noOfRatings": noOfRatings,
      "rating": rating,
      "address": addressModel?.toMap()
    };
  }

  double getAvgRating() {
    if (noOfRatings == 0) return 0.0; // Avoid division by zero
    return rating / noOfRatings;
  }
}
