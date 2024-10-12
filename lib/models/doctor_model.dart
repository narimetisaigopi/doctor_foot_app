class DoctorModel {
  String uid;
  String mobileNumber;
  String email;
  String name;
  double yearsOfExperiance;
  String image;
  String title;
  String address;
  String about;
  var timestamp;
  var modifiedAt;
  bool isActive;
  double lat;
  double lng;
  int actualPrice;
  int offerPrice;

  DoctorModel(
      {this.uid = "",
      this.title = "",
      this.mobileNumber = "",
      this.email = "",
      this.name = "",
      this.about = "",
      this.yearsOfExperiance = 0,
      this.image = "",
      this.address = "",
      this.isActive = true,
      this.timestamp,
      this.modifiedAt,
      this.lat = 0.0,
      this.lng = 0.0,
      this.offerPrice = 0,
      this.actualPrice = 0});

  factory DoctorModel.fromMap(Map map) {
    return DoctorModel(
        uid: map["uid"] ?? "",
        title: map["title"] ?? "",
        mobileNumber: map["mobileNumber"] ?? "",
        email: map["email"] ?? "",
        name: map["name"] ?? "",
        about: map["about"] ?? "",
        yearsOfExperiance: map["yearsOfExperiance"] ?? 0,
        image: map["image"] ?? "",
        address: map["address"] ?? "",
        isActive: map["isActive"] ?? true,
        timestamp: map["timestamp"],
        lat: map["lat"] ?? 0.0,
        lng: map["lng"] ?? 0.0,
        actualPrice: map["actualPrice"] ?? 0,
        offerPrice: map["offerPrice"] ?? 0,
        modifiedAt: map["modifiedAt"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "title": title,
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
      "actualPrice": actualPrice,
      "offerPrice": offerPrice,
      "modifiedAt": modifiedAt
    };
  }
}
