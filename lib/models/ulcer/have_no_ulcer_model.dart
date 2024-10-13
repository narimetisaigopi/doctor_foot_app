class HaveNoUlcerModel {
  String docId;
  String uid;
  var timestamp;
  var modifiedAt;
  List images;

  HaveNoUlcerModel({
    this.docId = "",
    this.uid = "",
    this.timestamp,
    this.modifiedAt,
    this.images = const [],
  });

  // Method to convert a Firestore document to HaveNoUlcerModel
  factory HaveNoUlcerModel.fromMap(Map<String, dynamic> map) {
    return HaveNoUlcerModel(
      docId: map['docId'] ?? "",
      uid: map['uid'] ?? "",
      timestamp: map['timestamp'],
      modifiedAt: map['modifiedAt'],
      images: List<String>.from(map['images'] ?? []),
    );
  }

  // Method to convert HaveNoUlcerModel to a map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'uid': uid,
      'timestamp': timestamp,
      'modifiedAt': modifiedAt,
      'images': images,
    };
  }
}
