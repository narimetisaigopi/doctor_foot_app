import 'package:drfootapp/screens/reviewrating/add_review_ratings_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/rating_book_again.dart';
import 'package:flutter/material.dart';
import '../../../../models/home_screen_models/foot_service_booking_model.dart';

class ServiceBookingWidget extends StatefulWidget {
  final ServiceBookingOrderModel serviceBookingOrderModel;
  const ServiceBookingWidget(
      {super.key, required this.serviceBookingOrderModel});

  @override
  State<ServiceBookingWidget> createState() => _ServiceBookingWidgetState();
}

class _ServiceBookingWidgetState extends State<ServiceBookingWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: footServicesCollectionReference
            .doc(widget.serviceBookingOrderModel.serviceId)
            .get(),
        builder: (context, snapshot) {
          
          // FootServiceModel footServiceModel = FootServiceModel();
          // if (snapshot.hasData && snapshot.data != null) {
          //   footServiceModel = FootServiceModel.fromJson(
          //       snapshot.data!.data() as Map<String, dynamic>);
          // }
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.whiteBgColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Expanded(
                      //   flex: 3,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10)),
                      //       child: CustomNetworkImageWidget(
                      //         path: footServiceModel.image,
                      //         height: 108,
                      //         width: double.infinity,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "footServiceModel.title",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.blackBold),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.task_alt,
                                          color: AppColors.greenColor,
                                          size: 14,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          Utility.enumToString(
                                              OrderStatus.values[widget
                                              .serviceBookingOrderModel
                                              .orderStatus
                                              .index]),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.greenColor),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // ratingLayout(footServiceModel),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      color: AppColors.blackBold,
                                      size: 16,
                                    ),
                                    Text(
                                      widget.serviceBookingOrderModel.address!
                                          .getAddress(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textBlackColor),
                                    ),
                                  ],
                                ),
                                Text(
                                  Utility().formatDate(widget
                                      .serviceBookingOrderModel.timestamp!
                                      .toDate()),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackBold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RatingBookAgainWidget(
                    onBookAgainPressed: () {},
                    onRateServicePressed: () {
                      Utility.myBottomSheet(context,
                          widget: AddReviewRatingsScreen(
                            docId: widget.serviceBookingOrderModel.serviceId,
                            reviewType: ReviewType.homeService,
                          ),
                          heightFactor: 0.7);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  // Widget ratingLayout(FootServiceModel footServiceModel) {
  //   return Row(
  //     children: [
  //       const Icon(
  //         Icons.star,
  //         color: AppColors.ratingBarColor,
  //         size: 14,
  //       ),
  //       const SizedBox(
  //         width: 4,
  //       ),
  //       Text(
  //         "${footServiceModel.review}",
  //         style: const TextStyle(
  //             fontSize: 14,
  //             fontWeight: FontWeight.w500,
  //             color: AppColors.blackBold),
  //       ),
  //       const SizedBox(
  //         width: 4,
  //       ),
  //       Text(
  //         footServiceModel.noOfReviews.ceil() == 1
  //             ? "(${footServiceModel.noOfReviews.ceil()} Review)"
  //             : "(${footServiceModel.noOfReviews.ceil()} Reviews)",
  //         style: const TextStyle(
  //             fontSize: 12,
  //             fontWeight: FontWeight.w400,
  //             color: AppColors.textBlackColor),
  //       ),
  //     ],
  //   );
  // }
}
