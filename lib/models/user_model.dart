class UserModel {
  final String userName;
  final String docId;
  final String dateOfBirth;
  final String gender;
  final String mobileNumber;

  UserModel({
    this.userName = "",
    this.dateOfBirth = "",
    this.gender = "",
    this.mobileNumber = "",
    this.docId = "",
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'docId': docId,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'mobileNumber': mobileNumber,
    };
  }
}
