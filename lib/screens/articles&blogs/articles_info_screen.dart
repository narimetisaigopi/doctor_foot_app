import 'package:drfootapp/models/article_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ArticlesInfoScreen extends StatefulWidget {
  final ArticleModel articleModel;
  const ArticlesInfoScreen({super.key, required this.articleModel});

  @override
  State<ArticlesInfoScreen> createState() => _ArticlesInfoScreenState();
}

class _ArticlesInfoScreenState extends State<ArticlesInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Article",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImageWidget(
              height: 196,
              width: double.infinity,
              path: widget.articleModel.image,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About".toLowerCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackBold,
                    ),
                  ),
                  Text(
                    widget.articleModel.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColors.secondary,
              thickness: 6,
            ),
            const SizedBox(
              height: 12,
            ),
            HtmlWidget(
              widget.articleModel.description,
            ),
          ],
        ),
      ),
    );
  }
}
