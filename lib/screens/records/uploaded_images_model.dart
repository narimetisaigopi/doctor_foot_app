import 'package:drfootapp/utils/constants/assets_constants.dart';

class UploadedImagesModel {
  String date;
  List<String> image;
  String type;
  UploadedImagesModel({
    this.date = "",
    this.image = const [],
    this.type = "",
  });
}

List<UploadedImagesModel> recentUploadModelList = [
  UploadedImagesModel(
    date: "24/06/24",
    image: [AssetsConstants.report_image1],
    type: "Img2124.jpg",
  ),
  UploadedImagesModel(
    date: "24/06/24",
    image: [
      AssetsConstants.report_image1,
      AssetsConstants.report_image2,
      AssetsConstants.report_image3,
    ],
    type: "Img2124.jpg",
  ),
  UploadedImagesModel(
    date: "24/06/24",
    image: [
      AssetsConstants.report_image2,
      AssetsConstants.report_image3,
    ],
    type: "Img2124.jpg",
  ),
];
