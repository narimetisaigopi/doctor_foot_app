import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';

class ArticleAndBlogModel {
  String image;
  String title;
  String discription;
  ArticleAndBlogModel({
    this.image = "",
    this.title = "",
    this.discription = "",
  });
}

List<ArticleAndBlogModel> articleAndBlogModelList = [
  ArticleAndBlogModel(
    image: AssetsConstants.articles,
    title: Strings.articleTitle,
    discription: Strings.articleDiscription,
  ),
  ArticleAndBlogModel(
    image: AssetsConstants.articles,
    title: Strings.articleTitle,
    discription: Strings.articleDiscription,
  ),
  ArticleAndBlogModel(
    image: AssetsConstants.articles,
    title: Strings.articleTitle,
    discription: Strings.articleDiscription,
  ),
 
];
