class PartnerModel {
  String docId;
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

  PartnerModel({
    this.docId = "",
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
  });

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
    );
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
    };
  }
}
