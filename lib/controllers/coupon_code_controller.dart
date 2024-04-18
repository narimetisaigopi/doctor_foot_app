import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/coupon_code_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponCodeController extends GetxController {
  CouponCodeModel? selectedCouponCodeModel;
  bool couponApplied = false;
  int couponDiscountedPrice = 0;
  CouponCodeModel couponCodeModel = CouponCodeModel();
  TextEditingController couponNameController = TextEditingController();
  TextEditingController couponDescriptionController = TextEditingController();
  TextEditingController couponMaxDiscountController = TextEditingController();

  Future<CouponCodeModel> checkCouponCode(String couponCode) async {
    QuerySnapshot snapshot = await couponCodesCollectionReference
        .where("couponCode", isEqualTo: couponCode)
        .get();

    logger("checkCouponCode${snapshot.docs.length}");
    if (snapshot.docs.isNotEmpty) {
      couponCodeModel = CouponCodeModel.fromJson(snapshot.docs.first.data());
    }
    return couponCodeModel;
  }

  Future<void> validateCouponCode({
    bool showCouponCode = false,
    int discountPrice = 0,
    Function()? onCouponApplied,
  }) async {
    CouponCodeModel codeModel =
        await checkCouponCode(couponNameController.text);

    if (couponNameController.text.trim().isEmpty) {
      Utility.toast("Enter Coupon Code");
    } else if (couponNameController.text.trim() != codeModel.couponCode) {
      Utility.toast("Invalid coupon code");
    } else if (codeModel.isExpired) {
      Utility.toast("Coupon Code Already Expired");
    } else {
      Utility.toast("Coupon Code Applied successfully");
      couponApplied = !couponApplied;
      update();

      // Flip the showCouponCode flag
      showCouponCode = !showCouponCode;
      update();

      if (codeModel.couponCode.isNotEmpty) {
        // Calculate the discount based on the coupon and update couponDiscountedPrice
        int discount = codeModel.maxDiscount;
        couponDiscountedPrice = discountPrice - discount;
        update();

        // Call the callback function to notify that the coupon has been applied
        if (onCouponApplied != null) {
          onCouponApplied();
        }
      }
    }
  }

  void removeSelectedCoupon() {
    selectedCouponCodeModel = null;
    update();
  }

  void selectedCoupon(CouponCodeModel couponCodeModel, bool isApplied) {
    isApplied = !isApplied;
    update();
    if (isApplied) {
      selectedCouponCodeModel = couponCodeModel;
    } else {
      selectedCouponCodeModel = null;
    }

    Get.back();
    update();
  }

  bool isCouponApplied(CouponCodeModel couponCodeModel) {
    if (selectedCouponCodeModel == null) {
      return false;
    } else if (selectedCouponCodeModel!.docId == couponCodeModel.docId) {
      return true;
    } else {
      return false;
    }
  }
}
