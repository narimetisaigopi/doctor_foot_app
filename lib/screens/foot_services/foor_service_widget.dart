import 'package:drfootapp/models/foot_service_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'foot_service_date_time_screen.dart';

class FootServiceWidget extends StatefulWidget {
  final FootServiceModel nurseServiceModel;
  const FootServiceWidget({
    super.key,
    required this.nurseServiceModel,
  });

  @override
  State<FootServiceWidget> createState() => _FootServiceWidgetState();
}

class _FootServiceWidgetState extends State<FootServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteBgColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Stack(children: [
                        CustomImage(
                          path: widget.nurseServiceModel.image,
                          height: 125,
                          width: 98,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                            top: 5,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.grey)),
                              child: const Icon(
                                size: 15,
                                Icons.favorite_border,
                                color: AppColors.primaryBlue,
                              ),
                            ))
                      ]),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.ratingBarColor,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${widget.nurseServiceModel.averageRating}"
                                .toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black2,
                            ),
                          ).tr(),
                          Text(
                            "(${widget.nurseServiceModel.reviewCount})"
                                .toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey2,
                            ),
                          ).tr(),
                        ],
                      ),
                    ],
                  )),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.nurseServiceModel.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black1,
                              ),
                            ).tr(),
                            if (widget.nurseServiceModel.dayRemain.isNotEmpty)
                              Text(
                                "(${widget.nurseServiceModel.dayRemain})"
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.pastTextColor,
                                ),
                              ).tr(),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.nurseServiceModel.description,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.pastTextColor,
                          ),
                        ).tr(),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "${Utility().toIndianFormat(widget.nurseServiceModel.offerPrice)}/-",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black2,
                              ),
                            ).tr(),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${Utility().toIndianFormat(widget.nurseServiceModel.actualPrice)}/-",
                              style: const TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey2,
                              ),
                            ).tr(),
                          ],
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            Get.to(() => FootServiceDateTimeScreen(
                                  nurseServiceModel: widget.nurseServiceModel,
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 3, bottom: 3),
                              child: const Text(
                                "ADD",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteBgColor,
                                ),
                              ).tr(),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
