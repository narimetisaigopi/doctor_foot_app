import 'package:drfootapp/utils/constants/assets_constants.dart';

class UploadedImagesModel {
  String date;
  String image;
  String type;
  UploadedImagesModel({
    this.date = "",
    this.image = "",
    this.type = "",
  });
}

List<UploadedImagesModel> recentUploadModelList = [
  UploadedImagesModel(
    date: "24/06/24",
    image: AssetsConstants.report_image1,
    type: "Img2124.jpg",
  ),
];
