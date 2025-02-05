import 'package:drfootapp/controllers/review_rating_controller.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class AddReviewRatingsScreen extends StatefulWidget {
  final ReviewType reviewType;
  final String docId;
  final bool isAdmin;
  final ReviewRatingModel? reviewRatingModel;
  const AddReviewRatingsScreen(
      {super.key,
      required this.docId,
      required this.reviewType,
      this.reviewRatingModel,
      this.isAdmin = false});

  @override
  State<AddReviewRatingsScreen> createState() => _AddReviewRatingsScreenState();
}

class _AddReviewRatingsScreenState extends State<AddReviewRatingsScreen> {
  ReviewRatingController reviewRatingController =
      Get.put(ReviewRatingController());

  @override
  void initState() {
    if (widget.reviewRatingModel != null) {
      reviewRatingController.messageTextEditingController.text =
          widget.reviewRatingModel!.reviewText;
      reviewRatingController.selectedRating =
          widget.reviewRatingModel!.noOfStars;
      reviewRatingController.nameTextEditingController.text =
          widget.reviewRatingModel!.name;
    }
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
              if (widget.isAdmin) adminLayout(),
              Text(
                "What is your rating?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              RatingBar.builder(
                initialRating: reviewRatingController.selectedRating.toDouble(),
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
                  reviewRatingController.selectedRating = rating.toInt();
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
                      onPress: validate,
                      buttonName: widget.reviewRatingModel != null
                          ? "Update Review"
                          : "Add Review",
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

  Widget adminLayout() {
    return Column(
      children: [
        InkWell(
          onTap: reviewRatingController.pickFile,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: reviewRatingController.xFile != null
                ? Image.network(reviewRatingController.xFile!.path)
                : widget.reviewRatingModel != null
                    ? CustomNetworkImageWidget(
                        path: widget.reviewRatingModel!.profileUrl)
                    : const Icon(Icons.image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: reviewRatingController.nameTextEditingController,
            maxLines: 1,
            decoration: const InputDecoration(
                hintText: "Name", border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }

  validate() {
    if (reviewRatingController.selectedRating == 0) {
      Utility.toast("Please select rating");
    } else if (reviewRatingController
        .messageTextEditingController.text.isEmpty) {
      Utility.toast("Please enter review");
    } else {
      reviewRatingController.addReview(widget.reviewType, widget.docId,
          isAdmin: widget.isAdmin, reviewRatingModel: widget.reviewRatingModel);
    }
  }
}
