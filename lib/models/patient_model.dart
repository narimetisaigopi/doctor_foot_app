class PatientModel {
  String name;
  String mobileNumber;
  int age;
  String gender;
  String bookingForWhom;

  PatientModel(
      {this.name = "",
      this.mobileNumber = "",
      this.age = 0,
      this.gender = "",
      this.bookingForWhom = ""});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobileNumber': mobileNumber,
      'age': age,
      'gender': gender,
      "bookingForWhom": bookingForWhom
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
        name: map['name'] ?? "",
        mobileNumber: map['mobileNumber'] ?? "",
        age: map['age'] ?? 0,
        gender: map['gender'] ?? "",
        bookingForWhom: map["bookingForWhom"] ?? "");
  }
}
