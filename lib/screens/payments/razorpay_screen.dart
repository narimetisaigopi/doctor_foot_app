import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayScreen {
  bool isTesting = false;
  String testKey = "rzp_test_sBvW9FmfSuEcOz";
  String realKey = "rzp_test_sBvW9FmfSuEcOz";
  startPayment(
      {required double amount,
      String description = "",
      required Function(PaymentSuccessResponse) onSuccess,
      required Function(PaymentFailureResponse) onError,
      required Function(ExternalWalletResponse) onExternalWallet}) async {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': isTesting ? testKey : realKey,
      'amount': amount * 100,
      'name': appName,
      'description': description,
      'prefill': {
        'contact': loginUserModel.mobileNumber,
        'email': loginUserModel.emailId
      }
    };
    razorpay.open(options);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, onExternalWallet);
  }
}
