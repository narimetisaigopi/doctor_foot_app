import 'dart:ffi';

import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';

class CouponCodeModel {
  double offerPercentage;
  double maxDiscount;
  String description;
  String couponTitle;
  int id;

  CouponCodeModel({
    this.offerPercentage = 0,
    this.maxDiscount = 100,
    this.description = "",
    this.couponTitle = Strings.couponTitle1,
    this.id = 0,
  });
}

List<CouponCodeModel> couponCodesList = [
  CouponCodeModel(
    maxDiscount: 200,
    offerPercentage: 0,
    couponTitle: Strings.couponTitle1,
    id: 1,
    description: Strings.couponDescription1,
  ),
  CouponCodeModel(
    maxDiscount: 0,
    offerPercentage: 0,
    couponTitle: Strings.couponTitle2,
    id: 2,
    description: Strings.couponDescription2,
  ),
  CouponCodeModel(
    maxDiscount: 300,
    offerPercentage: 0,
    couponTitle: Strings.couponTitle3,
    id: 3,
    description: Strings.couponDescription3,
  ),
];
