import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PatiantReviewWidget extends StatefulWidget {
  final Function() onPress;
  const PatiantReviewWidget({super.key, required this.onPress});

  @override
  State<PatiantReviewWidget> createState() => _PatiantReviewWidgetState();
}

class _PatiantReviewWidgetState extends State<PatiantReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        height: MediaQuery.of(context).size.height * 0.27,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: 
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: patientReviewsMap.length,
              itemBuilder: (context, index) {
                final review = patientReviewsMap[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgImageWidget(
                          path: "${review["reviewer_image"]}",
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${review["patientName"]}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
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
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${review["discription"]}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textBackColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        "${review["date"]}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
