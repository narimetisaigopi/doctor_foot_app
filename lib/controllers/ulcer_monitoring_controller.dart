import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/ulcer_monitor_models/ulcer_monitoring_subscrption_model.dart';
import 'package:drfootapp/models/ulcer_monitor_models/ulcer_monitoring_plan_model.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'payment_controller.dart';

class UlcerMonitoringController extends GetxController {
  bool isLoading = false;

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  UlcerMonitoringPlanModel selectedUlcerModel = UlcerMonitoringPlanModel();

  UlcerMonitoringPlanModel freeUlcerMonitoringPlanModel =
      UlcerMonitoringPlanModel(
          id: "0",
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
          id: "1",
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
        onSuccess: (PaymentSuccessResponse paymentSuccessResponse) async {
          await addUlcerSubscriptionData(
              PaymentStatus.completed, paymentSuccessResponse.paymentId ?? "");
        },
        onError: (PaymentFailureResponse paymentFailureResponse) {
          addToPayment(
              paymentStatus: PaymentStatus.cancelled,
              message: paymentFailureResponse.message.toString());
        },
        onExternalWallet: (ExternalWalletResponse externalWalletResponse) {});
  }

  addUlcerSubscriptionData(PaymentStatus paymentStatus, String id) async {
    try {
      _updateLoading(true);
      await usersCollectionReference.doc(getCurrentUserId()).update({
        "ulcerMonitoringPlan": selectedUlcerModel.id,
        "ulcerMonitoringSubscriptionDate": Timestamp.now()
      });
      UlcerMonitoringSubscriptionModel ulcerMonitoringSubscriptionModel =
          UlcerMonitoringSubscriptionModel();
      DocumentReference documentReference =
          ulcerSubscrptionsCollectionReference.doc();
      ulcerMonitoringSubscriptionModel.uid = getCurrentUserId();
      ulcerMonitoringSubscriptionModel.docId = documentReference.id;
      ulcerMonitoringSubscriptionModel.subscriptionId = selectedUlcerModel.id;
      ulcerMonitoringSubscriptionModel.amount = selectedUlcerModel.planAmount;
      ulcerMonitoringSubscriptionModel.paymentStatus = paymentStatus;
      ulcerMonitoringSubscriptionModel.timestamp = Timestamp.now();
      await documentReference.set(ulcerMonitoringSubscriptionModel.toMap());
      await addToPayment(paymentStatus: PaymentStatus.completed, id: id);
      goToPaymentCompletePage();
    } catch (e) {
      logger(e.toString());
    } finally {
      _updateLoading(false);
    }
  }

  addToPayment(
      {required PaymentStatus paymentStatus,
      String message = "",
      String id = ""}) async {
    try {
      _updateLoading(true);
      DocumentReference documentReference = paymentsCollectionReference.doc();
      await Get.put(PaymentController()).addPaymentTransaction(
          amount: selectedUlcerModel.planAmount.toDouble(),
          subscriptionId: documentReference.id,
          gatewayTransactionId: id,
          message: message,
          paymentServiceType: PaymentServiceType.ulcerMonitoring,
          paymentStatus: paymentStatus);
      goToPaymentCompletePage();
    } catch (e) {
      logger(e.toString());
    } finally {
      _updateLoading(false);
    }
  }

  goToPaymentCompletePage() {
    Get.offAll(() => const DashBoardScreen());
  }
}
