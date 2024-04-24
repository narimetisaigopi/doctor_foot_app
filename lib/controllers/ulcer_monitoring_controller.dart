import 'package:drfootapp/models/ulcer_monitor_models/uncler_monitoring_plan_model.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'payment_controller.dart';

class UlcerMonitoringController extends GetxController {
  UlcerMonitoringPlanModel selectedUlcerModel = UlcerMonitoringPlanModel();

  UlcerMonitoringPlanModel freeUlcerMonitoringPlanModel =
      UlcerMonitoringPlanModel(
          planTitle: Strings.basicPlanText,
          planAmount: 0,
          planDuration: Strings.freeText,
          planDetailItems: [
        Strings.weeklyUmText,
        Strings.freePlanText1,
        Strings.freePlanText2
      ]);

  UlcerMonitoringPlanModel paidUlcerMonitoringPlanModel =
      UlcerMonitoringPlanModel(
          planTitle: Strings.premiumPlanText,
          planAmount: 1000,
          planDuration: Strings.weekText,
          planDetailItems: [
        Strings.weeklyUmText,
        Strings.freePlanText1,
        Strings.freePlanText2,
        Strings.premiumPlanText4,
        Strings.premiumPlanText5,
      ]);

  List<UlcerMonitoringPlanModel> ulcerPlansList = [];

  @override
  onInit() {
    ulcerPlansList = [
      freeUlcerMonitoringPlanModel,
      paidUlcerMonitoringPlanModel
    ];
    super.onInit();
  }

  updatePlanSelection(UlcerMonitoringPlanModel plan) {
    selectedUlcerModel = plan;
    update();
  }

  proceedToPayment() {
    PaymentController paymentController = Get.put(PaymentController());
    paymentController.amount = selectedUlcerModel.planAmount.toDouble();
    paymentController.description =
        "Ulcer Monitor - ${selectedUlcerModel.planTitle}";
    paymentController.startPayment(
        onSuccess: (PaymentSuccessResponse paymentSuccessResponse) {},
        onError: (PaymentFailureResponse paymentFailureResponse) {},
        onExternalWallet: (ExternalWalletResponse externalWalletResponse) {});
  }

  onPaymentDone() {}
}
