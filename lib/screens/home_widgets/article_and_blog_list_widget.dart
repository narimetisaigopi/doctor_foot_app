import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/article_model.dart';
import 'package:drfootapp/screens/home_widgets/article_and_blog_widget.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
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
      child: FirestorePagination(
        shrinkWrap: false,
        query: getQuery(),
        scrollDirection: Axis.horizontal,
        onEmpty: const Center(child: EmptyState()),
        itemBuilder: (context, documentSnapshots, index) {
          ArticleModel articleModel =
              ArticleModel.fromMap(documentSnapshots[index].data() as Map);
          return ArticleAndBlogWidget(
            articleAndBlogModel: articleModel,
          );
        },
      ),
      // child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: articleAndBlogModelList.length,
      //     itemBuilder: (context, index) {
      //       ArticleAndBlogModel articleAndBlogItem =
      //           articleAndBlogModelList[index];
      //       return InkWell(
      //         onTap: () {
      //           Get.to(() => const ArticlesInfoScreen());
      //         },
      //         child: ArticleAndBlogWidget(
      //           articleAndBlogModel: articleAndBlogItem,
      //         ),
      //       );
      //     }),
    );
  }

  Query getQuery() {
    Query query = articlesAndBlogsCollectionReference.orderBy("timestamp");
    return query;
  }
}
