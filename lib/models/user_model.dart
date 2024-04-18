class UserModel {
  String userName;
  String docId;
  String dateOfBirth;
  String gender;
  String mobileNumber;
  dynamic timestamp;
  List<String> androidTokensList;
  List<String> appleTokensList;

  UserModel({
    this.userName = "",
    this.dateOfBirth = "",
    this.gender = "",
    this.mobileNumber = "",
    this.docId = "",
    this.androidTokensList = const [],
    this.appleTokensList = const [],
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
        androidTokensList: map["androidTokensList"] ?? [],
        appleTokensList: map["appleTokensList"] ?? []);
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
