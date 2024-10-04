import 'package:drfootapp/utils/constants/assets_constants.dart';

class ImageUploadModel {
  final String image;
  final String nametext;
  final String descriptiontext;

  ImageUploadModel(
      {this.image = "", this.nametext = "", this.descriptiontext = ""});
}

List<ImageUploadModel> uploadList = [
  ImageUploadModel(
      image: AssetsConstants.foot,
      nametext: "image 1",
      descriptiontext:
          "Image should be taken from the front which should revile the entire ulcer wound along with entire foot as shown in the example image. "),
  ImageUploadModel(
      image: AssetsConstants.foot,
      nametext: "image 2",
      descriptiontext:
          "Image should be taken from the top which should revile the depth of the ulcer as shown in the example image. "),
  ImageUploadModel(
      image: AssetsConstants.foot,
      nametext: "image 3",
      descriptiontext:
          "Image should be taken from side to locate the place of the ulcer on the feet as shown in the example image. "),
];
