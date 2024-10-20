class UlcerMonitoringRecordModel {
  String docId;
  String uid;
  List uploadedFilesList; // List of file URLs or paths
  List<String>
      doctorUploadedList; // List of file URLs or paths uploaded by doctor
  var timestamp; // Time when the record was created
  var modifiedAt; // Time when the record was last modified

  // Constructor
  UlcerMonitoringRecordModel({
    this.docId = "",
    this.uid = "",
    this.uploadedFilesList = const [],
    this.doctorUploadedList = const [],
    this.timestamp,
    this.modifiedAt,
  });

  // Named constructor for creating an instance from JSON data
  factory UlcerMonitoringRecordModel.fromJson(Map json) {
    return UlcerMonitoringRecordModel(
      docId: json['docId'] as String,
      uid: json['uid'] as String,
      uploadedFilesList: json['uploadedFilesList'] != null
          ? List<String>.from(json['uploadedFilesList'])
          : [],
      doctorUploadedList: json['doctorUploadedList'] != null
          ? List<String>.from(json['doctorUploadedList'])
          : [],
      timestamp: json['timestamp'] ?? "",
      modifiedAt: json['modifiedAt'] ?? '',
    );
  }

  // Method to convert an instance to JSON format
  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'uid': uid,
      'uploadedFilesList': uploadedFilesList,
      'doctorUploadedList': doctorUploadedList,
      'timestamp': DateTime.now(),
    };
  }
}
