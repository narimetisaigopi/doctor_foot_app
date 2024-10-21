import 'package:drfootapp/utils/enums.dart';

class HealthRecordModel {
  String docId;
  String uid;
  var timestamp;
  var modifiedAt;
  String name;
  String url;
  FileType fileType;
  HealthRecordType healthRecordType;

  // Constructor with default values
  HealthRecordModel(
      {this.docId = '',
      this.uid = '',
      DateTime? timestamp,
      DateTime? modifiedAt,
      this.name = '',
      this.url = '',
      this.fileType = FileType.image,
      this.healthRecordType = HealthRecordType.image});

  // Factory method to create a HealthRecordModel from a JSON map
  factory HealthRecordModel.fromJson(Map<String, dynamic> json) {
    return HealthRecordModel(
      docId: json['docId'] ?? '',
      uid: json['uid'] ?? '',
      timestamp: json['timestamp'],
      modifiedAt: json['modifiedAt'],
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      fileType: json['fileType'] != null
          ? FileType.values[json['fileType']]
          : FileType.image,
      healthRecordType: json['healthRecordType'] != null
          ? HealthRecordType.values[json['healthRecordType']]
          : HealthRecordType.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'uid': uid,
      'timestamp': DateTime.now(),
      'modifiedAt': modifiedAt,
      'name': name,
      'url': url,
      'fileType': fileType.index,
      'healthRecordType': healthRecordType.index,
    };
  }
}
