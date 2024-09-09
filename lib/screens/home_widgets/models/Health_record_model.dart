
import '../../../utils/constants/assets_constants.dart';
import '../../../utils/constants/string_constants.dart';

class HealthRecordModel {
  String image;
  String serviceNames;

  HealthRecordModel({this.image = "", this.serviceNames = ""});
}

List<HealthRecordModel> healthRecordsList = [
  HealthRecordModel(
      image: AssetsConstants.images, serviceNames: Strings.images),
  HealthRecordModel(
      image: AssetsConstants.lab_reports, serviceNames: Strings.labReports),
  HealthRecordModel(
    image: AssetsConstants.hopspatil_documents,
    serviceNames: Strings.hospitalDocuments,
  ),
];
