import 'package:doctor_foot_app/models/home_dressing/coupon_code_model.dart';
import 'package:get/get.dart';

class CouponCodeController extends GetxController {
  CouponCodeModel? selectedCouponCodeModel;

  void removeSelectedCoupon() {
    selectedCouponCodeModel = null;
    update();
  }
}
