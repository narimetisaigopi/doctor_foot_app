import 'package:drfootapp/controllers/review_rating_controller.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/screens/reviewrating/add_review_ratings_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ReviewRatingWidget extends StatefulWidget {
  final ReviewRatingModel reviewRatingModel;
  final bool isAdmin;
  const ReviewRatingWidget({
    super.key,
    this.isAdmin = false,
    required this.reviewRatingModel,
  });

  @override
  State<ReviewRatingWidget> createState() => _ReviewRatingWidgetState();
}

class _ReviewRatingWidgetState extends State<ReviewRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColors.patientReviewBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 6),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomNetworkImageWidget(
                      path: widget.reviewRatingModel.profileUrl,
                      isCircle: true,
                      radius: 25,
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.reviewRatingModel.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.whiteBgColor,
                          ),
                        ).tr(),
                        IgnorePointer(
                          ignoring: true,
                          child: RatingBar.builder(
                            itemSize: 12,
                            initialRating: widget.reviewRatingModel.noOfStars,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: AppColors.ratingBarColor,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  Jiffy.parseFromDateTime(
                          widget.reviewRatingModel.timestamp!.toDate())
                      .fromNow(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteBgColor,
                  ),
                ).tr(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.reviewRatingModel.reviewText,
                textAlign: TextAlign.justify,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteBgColor,
                ),
              ).tr(),
            ),
            if (widget.isAdmin) adminLayout()
          ],
        ),
      ),
    );
  }

  Widget adminLayout() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Utility.myBottomSheet(context,
                  widget: AddReviewRatingsScreen(
                    docId: "",
                    isAdmin: true,
                    reviewType: ReviewType.admin,
                    reviewRatingModel: widget.reviewRatingModel,
                  ),
                  heightFactor: 0.7);
            },
            icon: const CircleAvatar(child: Icon(Icons.edit_outlined))),
        IconButton(
            onPressed: () async {
              Utility.showAlertDialogger(
                  context: context,
                  yes: () async {
                    Get.back();
                    await Get.put(ReviewRatingController())
                        .deleteBanner(widget.reviewRatingModel);
                    setState(() {});
                  });
            },
            icon: const CircleAvatar(child: Icon(Icons.delete_outline))),
      ],
    );
  }
}
