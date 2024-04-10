class UserModel {
  String userName;
  String docId;
  String dateOfBirth;
  String gender;
  String mobileNumber;
  var timestamp;

  UserModel({
    this.userName = "",
    this.dateOfBirth = "",
    this.gender = "",
    this.mobileNumber = "",
    this.docId = "",
    this.timestamp,
  });

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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'docId': docId,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'mobileNumber': mobileNumber,
      'timestamp': DateTime.now().toString(),
    };
  }
}
