import 'package:drfootapp/screens/home_widgets/article_and_blog_widget.dart';
import 'package:drfootapp/screens/home_widgets/models/article_and_blog_model.dart';
import 'package:flutter/material.dart';

class ArticleAndBlogWidgetList extends StatefulWidget {
  const ArticleAndBlogWidgetList({super.key});

  @override
  State<ArticleAndBlogWidgetList> createState() =>
      _ArticleAndBlogWidgetListState();
}

class _ArticleAndBlogWidgetListState extends State<ArticleAndBlogWidgetList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.48,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: articleAndBlogModelList.length,
          itemBuilder: (context, index) {
            ArticleAndBlogModel articleAndBlogItem =
                articleAndBlogModelList[index];
            return ArticleAndBlogWidget(
              articleAndBlogModel: articleAndBlogItem,
            );
          }),
    );
  }
}
