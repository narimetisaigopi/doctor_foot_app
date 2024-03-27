import 'package:drfootapp/controllers/coupon_code_controller.dart';
import 'package:drfootapp/models/coupon_code_model.dart';
import 'package:drfootapp/models/home_dressing/c_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AvailableOffersWidget extends StatefulWidget {
  final CouponCodeModel couponCodeModel;

  const AvailableOffersWidget({super.key, required this.couponCodeModel});

  @override
  State<AvailableOffersWidget> createState() => _AvailableOffersWidgetState();
}

class _AvailableOffersWidgetState extends State<AvailableOffersWidget> {
  final CouponCodeController couponCodeController =
      Get.put(CouponCodeController());
  CouponCodeModel? couponCodeModel;
  bool isApplied = false;
  @override
  void initState() {
    super.initState();
    couponCodeModel = widget.couponCodeModel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Container(
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
                    //const Icon(Icons.discount),
                    Text(
                      "${widget.couponCodeModel.couponCode}% OFF ",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 80,
            child: Container(
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
                          "${widget.couponCodeModel.couponCode}% OFF ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        GetBuilder<CouponCodeController>(builder: (context) {
                          return TextButton(
                              onPressed: () {
                                couponCodeController.selectedCoupon(
                                    widget.couponCodeModel, isApplied);
                              },
                              child: Text(
                                couponCodeController
                                        .isCouponApplied(widget.couponCodeModel)
                                    ? "Applied"
                                    : "Apply",
                                style: TextStyle(
                                    color: couponCodeController.isCouponApplied(
                                            widget.couponCodeModel)
                                        ? Colors.green
                                        : AppColors.primary),
                              ).tr());
                        })
                      ],
                    ),
                  ),
                  Text(
                    widget.couponCodeModel.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black),
                  ).tr(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    Strings.couponCommonDescription,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                  ).tr(),
                  Text(
                    "Maximum instant discount of ₹${widget.couponCodeModel.maxDiscount}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 10),
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
            ),
          )
        ],
      ),
    );
  }
}
