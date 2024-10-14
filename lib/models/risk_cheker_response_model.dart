class RiskChekerResponseModel {
  String docId;
  String uid;
  var timestamp;
  String status;
  int score;
  Map<String, dynamic>? responses = {};

  RiskChekerResponseModel({
    this.docId = "",
    this.uid = "",
    this.timestamp = "",
    this.status = "",
    this.score = 0,
    this.responses,
  });

  // Convert Firestore document to a model
  factory RiskChekerResponseModel.fromMap(Map map) {
    return RiskChekerResponseModel(
      docId: map['docId'] ?? '',
      uid: map['userId'] ?? '',
      status: map["status"] ?? "",
      timestamp: map['timestamp'] ?? "",
      score: map['score'] ?? 0,
      responses: Map<String, dynamic>.from(map['responses']),
    );
  }
  // Convert the model to a Map to send to Firestore
  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'uid': uid,
      "status": status,
      'timestamp': DateTime.now(),
      'score': score,
      'responses': responses,
    };
  }
}
