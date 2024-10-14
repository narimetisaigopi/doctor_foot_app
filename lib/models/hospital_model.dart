class HospitalModel {
  String docId;
  String image;
  String title;
  String address;
  var timestamp;
  var modifiedAt;
  bool isActive;
  double lat;
  double lng;

  HospitalModel(
      {this.docId = "",
      this.title = "",
      this.image = "",
      this.address = "",
      this.isActive = true,
      this.timestamp,
      this.modifiedAt,
      this.lat = 0.0,
      this.lng = 0.0});

  factory HospitalModel.fromMap(Map map) {
    return HospitalModel(
        docId: map["docId"] ?? "",
        title: map["title"] ?? "",
        image: map["image"] ?? "",
        address: map["address"] ?? "",
        isActive: map["isActive"] ?? true,
        timestamp: map["timestamp"],
        lat: map["lat"] ?? 0.0,
        lng: map["lng"] ?? 0.0,
        modifiedAt: map["modifiedAt"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "docId": docId,
      "title": title,
      "address": address,
      "isActive": isActive,
      "timestamp": timestamp,
      "image": image,
      "lat": lat,
      "lng": lng,
      "modifiedAt": modifiedAt
    };
  }
}
