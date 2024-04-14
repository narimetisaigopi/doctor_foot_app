import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewWidget extends StatefulWidget {
  final String image;
  final String name;
  final String discr;
  final String dateTime;
  const ReviewWidget(
      {super.key,
      required this.image,
      required this.name,
      this.discr = "",
      required this.dateTime});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgImageWidget(
                path: widget.image,
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ).tr(),
                  RatingBar.builder(
                    itemSize: 12,
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: AppColors.ratingBarColor,
                    ), onRatingUpdate: (double value) {  },)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.discr,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlackColors),
              ).tr(),
            ),
            const SizedBox(
              height: 06,
            ),
            Center(
              child: Text(
                widget.dateTime,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey),
              ).tr(),
            ),
          ],
        ),
      );
    
  }
}
