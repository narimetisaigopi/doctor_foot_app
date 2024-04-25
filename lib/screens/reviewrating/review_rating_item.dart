import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/review_rating_controller.dart';
import 'package:drfootapp/models/review_rating_model.dart';
import 'package:drfootapp/models/user_model.dart';
import 'package:drfootapp/screens/reviewrating/add_review_ratings_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ReviewRatingItem extends StatefulWidget {
  final ReviewRatingModel ratingModel;
  final ReviewType reviewType;
  const ReviewRatingItem(
      {Key? key, required this.ratingModel, required this.reviewType})
      : super(key: key);

  @override
  State<ReviewRatingItem> createState() => _ReviewRatingItemState();
}

class _ReviewRatingItemState extends State<ReviewRatingItem> {
  ReviewRatingController reviewRatingController =
      Get.put(ReviewRatingController());
  @override
  Widget build(BuildContext context) {
    return Card(
      child: FutureBuilder<DocumentSnapshot>(
          future: usersCollectionReference.doc(widget.ratingModel.uid).get(),
          builder: (context, snapshot) {
            UserModel userModel = UserModel();
            if (snapshot.hasData && snapshot.data!.data() != null) {
              userModel = UserModel.fromJson(snapshot.data!.data()! as Map);
            }
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(userModel.profilePic),
              ),
              title: Text(
                userModel.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(widget.ratingModel.review), actionLayout()],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IgnorePointer(
                    child: RatingBar.builder(
                      initialRating: widget.ratingModel.rating,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: AppColors.bgColor,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                  Text(Jiffy.parseFromDateTime(
                          widget.ratingModel.timestamp!.toDate())
                      .fromNow()),
                ],
              ),
            );
          }),
    );
  }

  Widget actionLayout() {
    return widget.ratingModel.uid == getCurrentUserId().uid
        ? SizedBox(
            width: 100,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    showAlertDialog(
                      content: "Do you want to delete review?",
                      context: context,
                      yesCallback: () async {
                        Navigator.pop(context);
                        await reviewRatingController.deleteReview(
                            widget.reviewType, widget.ratingModel.uid);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      noCallback: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => AddReviewRatingsScreen(
                                  reviewType: widget.reviewType,
                                  docId: '',
                                )));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
