import 'dart:developer';

import 'package:doctor_foot_app/screens/home_dressing_services/order_successful_screen.dart';

import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGateWay extends StatefulWidget {
  const PaymentGateWay({super.key});

  @override
  State<PaymentGateWay> createState() => _PaymentGateWayState();
}

class _PaymentGateWayState extends State<PaymentGateWay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(FontAwesomeIcons.remove))
                ],
              ),
              Image.asset(
                AssetsConstants.phonepe,
              ),
              // const SvgImageWidget(
              //   path: AssetsConstants.phonepe,
              //   height: 150,
              // ),

              const Text(
                "PhonePe UPI",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const Text(
                "Total : ₹800",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonName: "PAY VIA PHONEPE",
                onPress: () => startPayment(),
              )
            ],
          ),
        ),
      ),
    );
  }

  startPayment() {
    Razorpay _razorpay = Razorpay();

    var options = {
      'key': 'rzp_test_sBvW9FmfSuEcOz',
      //'key': "rzp_live_0KkXRascl6tEQL",
      'amount': 1000 * 100,
      'name': 'bharosa',
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
    Navigator.pop(context);
    // Utils().showToast("Payment failed due to ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log("_handleExternalWallet response ${response.toString()}");

    // Utils().showToast("Payment handleExternalWallet  ${response.walletName}");
  }
}
