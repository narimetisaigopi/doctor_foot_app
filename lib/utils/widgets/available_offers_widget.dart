import 'package:doctor_foot_app/controllers/coupon_code_controller.dart';
import 'package:doctor_foot_app/models/home_dressing/coupon_code_model.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AvailableOffersWidget extends StatefulWidget {
  final CouponCodeModel? couponCodeModel;

  const AvailableOffersWidget({super.key, this.couponCodeModel});

  @override
  State<AvailableOffersWidget> createState() => _AvailableOffersWidgetState();
}

class _AvailableOffersWidgetState extends State<AvailableOffersWidget> {
  final CouponCodeController couponCodeController =
      Get.put(CouponCodeController());
  CouponCodeModel? couponCodeModel = CouponCodeModel();
  bool isApplied = false;
  @override
  void initState() {
    super.initState();
    // Initialize the couponCodeModel state variable with the initial coupon code model
    couponCodeModel = widget.couponCodeModel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            width: 40,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Transform.rotate(
              angle: -90 * 3.14 / 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Icon(Icons.discount),

                  Text(
                    widget.couponCodeModel!.couponTitle,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 260,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.couponCodeModel!.couponTitle}% OFF ",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isApplied = !isApplied;
                              if (isApplied) {
                                couponCodeController.selectedCouponCodeModel =
                                    couponCodeModel;
                              } else {
                                couponCodeController.selectedCouponCodeModel =
                                    null;
                              }

                              Get.back();
                            });
                          },
                          child: Text(
                            isApplied ? "Applied" : "Apply",
                            style: TextStyle(
                                color: isApplied
                                    ? Colors.green
                                    : AppColors.primary),
                          ))
                    ],
                  ),
                ),
                Text(
                  widget.couponCodeModel!.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12),
                  // textAlign: TextAlign.start,
                ).tr(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  Strings.couponCommonDescription,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                ).tr(),
                Text(
                  "Maximum instant discount of ₹${widget.couponCodeModel!.maxDiscount}",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                ).tr(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => Utility.myBottomSheet(context, widget: widget),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 12,
                      ),
                      Text(
                        "More",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: AppColors.primary),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
