import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String fullName;
  String emailId;
  String bloodgroup;
  String height;
  String weight;
  String userName;
  String docId;
  String dateOfBirth;
  String gender;
  String mobileNumber;
  dynamic timestamp;
  String regNo;
  String profilePic;
  String androidToken;
  String appleToken;
  // ulcermonitoring
  String ulcerMonitoringPlan;
  Timestamp? ulcerMonitoringSubscriptionDate;

  UserModel(
      {this.userName = "",
      this.dateOfBirth = "",
      this.gender = "",
      this.mobileNumber = "",
      this.docId = "",
      this.androidToken = "",
      this.appleToken = "",
      this.timestamp,
      this.fullName = "",
      this.emailId = "",
      this.bloodgroup = "",
      this.height = "",
      this.weight = "",
      this.regNo = "",
      this.ulcerMonitoringPlan = "0",
      this.profilePic = "",
      this.ulcerMonitoringSubscriptionDate});
  factory UserModel.fromJson(
    Map map,
  ) {
    return UserModel(
        userName: map['userName'] ?? "",
        docId: map['docId'] ?? "",
        dateOfBirth: map['dateOfBirth'] ?? "",
        gender: map['gender'] ?? "",
        mobileNumber: map['mobileNumber'] ?? "",
        timestamp: map['timestamp'] ?? "",
        appleToken: map["appleToken"] ?? "",
        androidToken: map["androidToken"] ?? "",
        fullName: map['fullName'] ?? "",
        emailId: map['emailId'] ?? "",
        bloodgroup: map['bloodgroup'] ?? "",
        height: map['height'] ?? "",
        weight: map['weight'] ?? "",
        regNo: map["regNo"] ?? "",
        profilePic: map["profilePic"] ?? "",
        ulcerMonitoringPlan: map["ulcerMonitoringPlan"] ?? "0",
        ulcerMonitoringSubscriptionDate:
            map["ulcerMonitoringSubscriptionDate"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'docId': docId,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'mobileNumber': mobileNumber,
      "androidToken": androidToken,
      "appleToken": appleToken,
      'timestamp': DateTime.now().toString(),
      'fullName': fullName,
      'emailId': emailId,
      'bloodgroup': bloodgroup,
      'height': height,
      'weight': weight,
      "regNo": regNo,
      "profilePic": profilePic,
      "ulcerMonitoringPlan": ulcerMonitoringPlan,
      "ulcerMonitoringSubscriptionDate": ulcerMonitoringSubscriptionDate
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'timestamp': DateTime.now().toString(),
      'emailId': emailId,
      'bloodgroup': bloodgroup,
      'height': height,
      'weight': weight,
    };
  }
}
