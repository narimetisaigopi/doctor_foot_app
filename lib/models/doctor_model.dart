class DoctorModel {
  String docId;
  String mobileNumber;
  String email;
  String name;
  dynamic yearsOfExperiance;
  String image;
  String education;
  String address;
  String about;
  var timestamp;
  var modifiedAt;
  bool isActive;
  dynamic lat;
  dynamic lng;
  int actualPrice;
  int offerPrice;
  String? hospitalId;

  DoctorModel(
      {this.docId = "",
      this.education = "",
      this.mobileNumber = "",
      this.email = "",
      this.name = "",
      this.about = "",
      this.yearsOfExperiance = 0.0,
      this.image = "",
      this.address = "",
      this.isActive = true,
      this.timestamp,
      this.modifiedAt,
      this.lat = 0.0,
      this.lng = 0.0,
      this.offerPrice = 0,
      this.actualPrice = 0,
      this.hospitalId});

  factory DoctorModel.fromMap(Map map) {
    return DoctorModel(
        docId: map["docId"] ?? "",
        mobileNumber: map["mobileNumber"] ?? "",
        email: map["email"] ?? "",
        name: map["name"] ?? "",
        about: map["about"] ?? "",
        yearsOfExperiance: map["yearsOfExperiance"] ?? 0.0,
        image: map["image"] ?? "",
        address: map["address"] ?? "",
        education: map["education"] ?? "",
        isActive: map["isActive"] ?? true,
        timestamp: map["timestamp"],
        lat: map["lat"] ?? 0.0,
        lng: map["lng"] ?? 0.0,
        actualPrice: map["actualPrice"] ?? 0,
        offerPrice: map["offerPrice"] ?? 0,
        hospitalId: map["hospitalId"],
        modifiedAt: map["modifiedAt"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "docId": docId,
      "education": education,
      "mobileNumber": mobileNumber,
      "email": email,
      "name": name,
      "about": about,
      "yearsOfExperiance": yearsOfExperiance,
      "address": address,
      "isActive": isActive,
      "timestamp": timestamp,
      "image": image,
      "lat": lat,
      "lng": lng,
      "hospitalId": hospitalId,
      "actualPrice": actualPrice,
      "offerPrice": offerPrice,
      "modifiedAt": modifiedAt
    };
  }
}
