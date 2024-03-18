import 'dart:developer';

import 'package:doctor_foot_app/screens/home_dressing_services/order_successful_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  startPayment() {
    Razorpay _razorpay = Razorpay();

    var options = {
      'key': 'rzp_test_sBvW9FmfSuEcOz',
      //'key': "rzp_live_0KkXRascl6tEQL",
      'amount': 1000 * 100,
      'name': 'Doctor Foot',
      'description': 'Registration',
      'prefill': {'contact': '1234567890', 'email': 'gowtham@gmail.com'}
    };

    _razorpay.open(options);

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log("_handlePaymentSuccess response ${response.toString()}");

    Get.offAll(() => const OrderSuccessfulScreen());

    // usersCollectionReference
    //     .doc(user!.uid)
    //     .update({"subscriptionTime": DateTime.now()});
    // Get.put(SubscriptionController())
    //     .addTransaction(subScriptionAmount.toString());
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => HomeScreen()),
    //     (route) => false);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log("_handlePaymentError response ${response.toString()}");
    Get.back();
    // Utils().showToast("Payment failed due to ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log("_handleExternalWallet response ${response.toString()}");

    // Utils().showToast("Payment handleExternalWallet  ${response.walletName}");
  }
}
