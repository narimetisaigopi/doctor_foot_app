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
  List<dynamic> androidTokensList;
  List<dynamic> appleTokensList;
  // ulcermonitoring
  String ulcerMonitoringPlan;
  Timestamp? ulcerMonitoringSubscriptionDate;

  UserModel(
      {this.userName = "",
      this.dateOfBirth = "",
      this.gender = "",
      this.mobileNumber = "",
      this.docId = "",
      this.androidTokensList = const [],
      this.appleTokensList = const [],
      this.timestamp,
      this.fullName = "",
      this.emailId = "",
      this.bloodgroup = "",
      this.height = "",
      this.weight = "",
      this.regNo = "",
      this.ulcerMonitoringPlan = "0",
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
        androidTokensList: map["androidTokensList"] ?? [],
        appleTokensList: map["appleTokensList"] ?? [],
        fullName: map['fullName'] ?? "",
        emailId: map['emailId'] ?? "",
        bloodgroup: map['bloodgroup'] ?? "",
        height: map['height'] ?? "",
        weight: map['weight'] ?? "",
        regNo: map["regNo"] ?? "",
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
      "androidTokensList": androidTokensList,
      "appleTokensList": appleTokensList,
      'timestamp': DateTime.now().toString(),
      'fullName': fullName,
      'emailId': emailId,
      'bloodgroup': bloodgroup,
      'height': height,
      'weight': weight,
      "regNo": regNo,
      "ulcerMonitoringPlan": ulcerMonitoringPlan,
      "ulcerMonitoringSubscriptionDate": ulcerMonitoringSubscriptionDate
    };
  }

  addNewAndroidToken(String token) {
    if (!androidTokensList.contains(token)) {
      androidTokensList.add(token);
    }
  }

  addNewIosToken(String token) {
    if (!androidTokensList.contains(token)) {
      androidTokensList.add(token);
    }
  }
}
