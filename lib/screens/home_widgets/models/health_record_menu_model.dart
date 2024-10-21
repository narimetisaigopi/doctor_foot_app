import '../../../utils/constants/assets_constants.dart';
import '../../../utils/constants/string_constants.dart';

class HealthRecordMenuModel {
  String image;
  String serviceNames;

  HealthRecordMenuModel({this.image = "", this.serviceNames = ""});
}

List<HealthRecordMenuModel> healthRecordsMenuList = [
  HealthRecordMenuModel(
      image: AssetsConstants.images, serviceNames: Strings.images),
  HealthRecordMenuModel(
      image: AssetsConstants.lab_reports, serviceNames: Strings.labReports),
  HealthRecordMenuModel(
    image: AssetsConstants.hopspatil_documents,
    serviceNames: Strings.hospitalDocuments,
  ),
];
