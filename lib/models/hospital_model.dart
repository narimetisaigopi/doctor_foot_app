class HospitalModel {
  String uid;
  String image;
  String title;
  String address;
  var timestamp;
  bool isActive;
  double lat;
  double lng;

  HospitalModel(
      {this.uid = "",
      this.title = "",
      this.image = "",
      this.address = "",
      this.isActive = true,
      this.timestamp,
      this.lat = 0.0,
      this.lng = 0.0});

  factory HospitalModel.fromMap(Map map) {
    return HospitalModel(
        uid: map["uid"] ?? "",
        title: map["title"] ?? "",
        image: map["image"] ?? "",
        address: map["address"] ?? "",
        isActive: map["isActive"] ?? true,
        timestamp: map["timestamp"],
        lat: map["lat"] ?? 0.0,
        lng: map["lng"] ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "title": title,
      "address": address,
      "isActive": isActive,
      "timestamp": timestamp,
      "image": image,
      "lat": lat,
      "lng": lng,
    };
  }
}
