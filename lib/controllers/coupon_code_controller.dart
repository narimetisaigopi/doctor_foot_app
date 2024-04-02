import 'package:doctor_foot_app/models/home_dressing/coupon_code_model.dart';
import 'package:get/get.dart';

class CouponCodeController extends GetxController {
  CouponCodeModel? selectedCouponCodeModel;

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
    } else if (selectedCouponCodeModel!.id == couponCodeModel.id) {
      return true;
    } else {
      return false;
    }
  }
}
