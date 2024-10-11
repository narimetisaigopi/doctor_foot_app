import 'package:drfootapp/screens/home_widgets/models/article_and_blog_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ArticleAndBlogWidget extends StatefulWidget {
  final ArticleAndBlogModel articleAndBlogModel;
  const ArticleAndBlogWidget({
    super.key,
    required this.articleAndBlogModel,
  });

  @override
  State<ArticleAndBlogWidget> createState() => _ArticleAndBlogWidgetState();
}

class _ArticleAndBlogWidgetState extends State<ArticleAndBlogWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.abBorderColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: CustomImage(
                  path: widget.articleAndBlogModel.image,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Text(
                      widget.articleAndBlogModel.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textBackThickColor,
                      ),
                      maxLines: 4,
                    ).tr(),
                    const SizedBox(height: 8),
                    ReadMoreText(
                      widget.articleAndBlogModel.discription,
                      trimMode: TrimMode.Line,
                      trimLines: 3,
                      colorClickableText: AppColors.primaryBlue,
                      trimCollapsedText: 'view more...',
                      trimExpandedText: 'view less...',
                      moreStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
