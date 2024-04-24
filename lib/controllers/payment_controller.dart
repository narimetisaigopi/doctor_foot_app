// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  double amount = 0.0;
  String description = "";
  startPayment(
      {required Function(PaymentSuccessResponse) onSuccess,
      required Function(PaymentFailureResponse) onError,
      required Function(ExternalWalletResponse) onExternalWallet}) async {
    Razorpay _razorpay = Razorpay();

    AuthenticationController authenticationController =
        Get.put(AuthenticationController());

    var options = {
      'key': 'rzp_test_sBvW9FmfSuEcOz',
      'amount': amount * 100,
      'name': appName,
      'description': description,
      'prefill': {
        'contact': authenticationController.loginUserModel.mobileNumber,
        'email': authenticationController.loginUserModel.emailId
      }
    };
    _razorpay.open(options);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, onExternalWallet);
  }
}
