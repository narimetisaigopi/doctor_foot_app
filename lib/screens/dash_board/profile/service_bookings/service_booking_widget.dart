import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/rating_book_again.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../../models/homeScreenModels/foot_service_booking_model.dart';

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
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: const SvgImageWidget(
                        path: AssetsConstants.wounded_foot,
                        height: 108,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Lorem Ipsum is...",
                                style: TextStyle(
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
                                    enumToString(OrderStatus.values[widget
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
                          ratingLayout(),
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
                            formatDate(widget
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
              onRateServicePressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget ratingLayout() {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: AppColors.ratingBarColor,
          size: 14,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "4.5",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackBold),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "(123 Reviews)",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor),
        ),
      ],
    );
  }
}
