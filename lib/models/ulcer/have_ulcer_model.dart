class HaveUlcerModel {
  String docId;
  String uid;
  var timestamp;
  var modifiedAt;
  List yesImages;
  List noImages;
  String dischargeDocumentLink;
  String consulationDocumentLink;
  bool haveUlcer;

  HaveUlcerModel(
      {this.docId = "",
      this.uid = "",
      this.timestamp,
      this.modifiedAt,
      this.yesImages = const [],
      this.noImages = const [],
      this.dischargeDocumentLink = "",
      this.consulationDocumentLink = "",
      this.haveUlcer = false});

  // Method to convert a Firestore document to HaveNoUlcerModel
  factory HaveUlcerModel.fromMap(Map map) {
    return HaveUlcerModel(
        docId: map['docId'] ?? "",
        uid: map['uid'] ?? "",
        timestamp: map['timestamp'],
        modifiedAt: map['modifiedAt'],
        yesImages: List<String>.from(
          map['yesImages'] ?? [],
        ),
        noImages: List<String>.from(
          map['noImages'] ?? [],
        ),
        dischargeDocumentLink: map["dischargeDocumentLink"] ?? "",
        consulationDocumentLink: map["consulationDocumentLink"] ?? "",
        haveUlcer: map["haveUlcer"] ?? false);
  }

  // Method to convert HaveNoUlcerModel to a map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'uid': uid,
      'timestamp': timestamp,
      'modifiedAt': modifiedAt,
      'yesImages': yesImages,
      'noImages': noImages,
      "dischargeDocumentLink": dischargeDocumentLink,
      "consulationDocumentLink": consulationDocumentLink,
      "haveUlcer": haveUlcer
    };
  }
}
