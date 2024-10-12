import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/admin/articles/create_article.dart';
import 'package:drfootapp/models/article_model.dart';
import 'package:drfootapp/screens/home_widgets/article_and_blog_widget.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/widgets/empty_state.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminAllArticles extends StatefulWidget {
  const AdminAllArticles({super.key});

  @override
  State<AdminAllArticles> createState() => _AdminAllArticlesState();
}

class _AdminAllArticlesState extends State<AdminAllArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(() => const CreateArticle());
      }),
      body: FirestorePagination(
        shrinkWrap: false,
        query: getQuery(),
        viewType: ViewType.grid,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        onEmpty: const Center(child: EmptyState()),
        itemBuilder: (context, documentSnapshots, index) {
          ArticleModel articleModel =
              ArticleModel.fromMap(documentSnapshots[index].data() as Map);
          return ArticleAndBlogWidget(
            articleAndBlogModel: articleModel,
          );
        },
      ),
    );
  }

  Query getQuery() {
    Query query = articlesAndBlogsCollectionReference.orderBy("timestamp");
    return query;
  }
}
