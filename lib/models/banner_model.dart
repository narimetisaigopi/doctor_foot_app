class BannerModel {
  String docId;
  String image;
  String descrition;
  String navigationLink;
  var timestamp;
  var modifiedAt;
  bool isActive;

  BannerModel({
    this.docId = "",
    this.descrition = "",
    this.image = "",
    this.navigationLink = "",
    this.isActive = true,
    this.timestamp,
    this.modifiedAt,
  });

  // Convert from a Firestore document (Map) to a BannerModel object
  factory BannerModel.fromMap(Map map) {
    return BannerModel(
      docId: map['docId'] ?? "",
      image: map['image'] ?? "",
      descrition: map['descrition'] ?? "",
      navigationLink: map['navigationLink'] ?? "",
      isActive: map['isActive'] ?? true,
      timestamp: map['timestamp'],
      modifiedAt: map['modifiedAt'],
    );
  }

  // Convert a BannerModel object to a Map (for saving to Firestore)
  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'image': image,
      'descrition': descrition,
      'navigationLink': navigationLink,
      'isActive': isActive,
      'timestamp': timestamp,
      'modifiedAt': modifiedAt,
    };
  }
}
