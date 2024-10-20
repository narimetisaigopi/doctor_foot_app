import 'package:drfootapp/controllers/review_rating_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class AddReviewRatingsScreen extends StatefulWidget {
  final ReviewType reviewType;
  final String docId;
  const AddReviewRatingsScreen(
      {super.key, required this.docId, required this.reviewType});

  @override
  State<AddReviewRatingsScreen> createState() => _AddReviewRatingsScreenState();
}

class _AddReviewRatingsScreenState extends State<AddReviewRatingsScreen> {
  ReviewRatingController reviewRatingController =
      Get.put(ReviewRatingController());

  @override
  void initState() {
    // reviewRatingController
    //     .getMyRating(widget.reviewType, widget.docId)
    //     .then((value) {
    //   reviewRatingController.messageTextEditingController.text = value.review;
    //   reviewRatingController.selectedRating = value.rating;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewRatingController>(
        builder: (reviewRatingController) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close_outlined,
                    size: 32,
                  )),
              const SizedBox(
                height: 12,
              ),
              Text(
                "What is your rating?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              RatingBar.builder(
                initialRating: reviewRatingController.myRatingModel.noOfStars,
                minRating: 1,
                itemSize: 40,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: AppColors.primary,
                ),
                onRatingUpdate: (rating) {
                  reviewRatingController.selectedRating = rating;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Please share your valuable feedback",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller:
                      reviewRatingController.messageTextEditingController,
                  maxLines: 5,
                  maxLength: 1000,
                  decoration: const InputDecoration(
                      hintText: "Describe your review",
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              reviewRatingController.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      onPress: () {
                        validate();
                      },
                      buttonName: "Add Review",
                    ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      );
    });
  }

  validate() {
    if (reviewRatingController.selectedRating == 0) {
      Utility.toast("Please select rating");
    } else if (reviewRatingController
        .messageTextEditingController.text.isEmpty) {
      Utility.toast("Please enter review");
    } else {
      reviewRatingController.addReview(widget.reviewType, widget.docId);
    }
  }
}
