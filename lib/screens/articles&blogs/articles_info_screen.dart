import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ArticlesInfoScreen extends StatefulWidget {
  const ArticlesInfoScreen({super.key});

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
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              height: 196,
              width: double.infinity,
              path: AssetsConstants.article_blog_image,
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "VEINS OF VULNERABILITY:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackBold,
                    ),
                  ),
                  Text(
                    "WOMEN AND THE DANGERS OF DEEP\nVEIN THORMBOSIS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.secondary,
              thickness: 6,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "In the landscape of women's health, certain conditions often lurk in the shadows, their significance overlooked or underestimated. One such condition, deep vein thrombosis (DVT), silently poses a grave risk to women's well-being. From the complexities of pregnancy to the nuances of hormonal influences, the connection between women and DVT warrants closer examination. As we embark on this journey of understanding, it becomes evident that unravelling the mysteries of DVT is not only crucial but potentially life-saving for women worldwide. ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "The factors that make women more\nlikely to get DVT are:",
                    style: TextStyle(
                      fontSize: 1,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackBold,
                    ),
                  ),
                  Text(
                    "In the landscape of women's health, certain conditions often lurk in the shadows, their significance overlooked or underestimated. One such condition, deep vein thrombosis (DVT), silently poses a grave risk to women's well-being. From the complexities of pregnancy to the nuances of hormonal influences, the connection between women and DVT warrants closer examination. As we embark on this journey of understanding, it becomes evident that unravelling the mysteries of DVT is not only crucial but potentially life-saving for women worldwide. ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 12,
                  ), Text(
                    "In the landscape of women's health, certain conditions often lurk in the shadows, their significance overlooked or underestimated. One such condition, deep vein thrombosis (DVT), silently poses a grave risk to women's well-being. From the complexities of pregnancy to the nuances of hormonal influences, the connection between women and DVT warrants closer examination. As we embark on this journey of understanding, it becomes evident that unravelling the mysteries of DVT is not only crucial but potentially life-saving for women worldwide. ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 12,
                  ), Text(
                    "In the landscape of women's health, certain conditions often lurk in the shadows, their significance overlooked or underestimated. One such condition, deep vein thrombosis (DVT), silently poses a grave risk to women's well-being. From the complexities of pregnancy to the nuances of hormonal influences, the connection between women and DVT warrants closer examination. As we embark on this journey of understanding, it becomes evident that unravelling the mysteries of DVT is not only crucial but potentially life-saving for women worldwide. ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
