import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/small_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookNowWidget extends StatefulWidget {
  const BookNowWidget({
    super.key,
  });

  @override
  State<BookNowWidget> createState() => _BookNowWidgetState();
}

class _BookNowWidgetState extends State<BookNowWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteBgColor,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      CustomImage(
                        path: AssetsConstants.find_doctor,
                        height: 152,
                        width: 104,
                      ),
                      Positioned(
                          top: 3.3,
                          right: 3.3,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.secondary,
                            child: Icon(
                              size: 22,
                              Icons.favorite_border,
                              color: AppColors.primaryBlue,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "DR. Narendranadh Me...",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black2,
                          ),
                        ).tr(),
                        const Text(
                          "BAMMS - 33 YRS. EXP.",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          ),
                        ).tr(),
                        const Text(
                          "Leg related diseases, Foot...",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          ),
                        ).tr(),
                        Row(
                          children: [
                            const Text(
                              "₹399/-",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black2,
                              ),
                            ).tr(),
                            const Text(
                              "₹499/-",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey2,
                              ),
                            ).tr(),
                          ],
                        ),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              itemSize: 20,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: AppColors.ratingBarColor,
                              ),
                              onRatingUpdate: (double value) {},
                            ),
                            const Text(
                              "(134)",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey2,
                              ),
                            ).tr(),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SmallButton(
                          bgColor: AppColors.patientReviewBg,
                          buttonName: "Book Now",
                          textColor: AppColors.whiteBgColor,
                          onPress: (){},
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
