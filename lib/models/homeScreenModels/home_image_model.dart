import 'package:drfootapp/utils/constants/assets_constants.dart';

class HomeImageModel {
  String image;
  String title;
  HomeImageModel({
    this.image = "",
    this.title = "",
  });
}

List<HomeImageModel> homeImagesList = [
  HomeImageModel(
    image: AssetsConstants.home_image,
    title: "rectImageText",
  ),
  HomeImageModel(
    image: AssetsConstants.home_image,
    title: "rectImageText",
  ),
  HomeImageModel(
    image: AssetsConstants.home_image,
    title: "rectImageText",
  ),
  HomeImageModel(
    image: AssetsConstants.home_image,
    title: "rectImageText",
  ),
  HomeImageModel(
    image: AssetsConstants.home_image,
    title: "rectImageText",
  ),
];
