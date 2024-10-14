// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/authentication_controller.dart';
import 'package:drfootapp/models/admin_model.dart';
import 'package:drfootapp/models/payment_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
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
        'contact': loginUserModel.mobileNumber,
        'email': loginUserModel.emailId
      }
    };
    _razorpay.open(options);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, onExternalWallet);
  }

  Future<int> generatePaymentId() async {
    DocumentSnapshot documentSnapshot =
        await adminCollectionReference.doc("admin").get();
    int paymentId = 1;
    AdminModel adminModel = AdminModel();
    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      adminModel = AdminModel.fromSnapshot(documentSnapshot);
      paymentId = adminModel.paymentId + 1;
      await adminCollectionReference
          .doc("admin")
          .update({"paymentId": paymentId});
    } else {
      await adminCollectionReference.doc("admin").set(adminModel.toMap());
    }
    return paymentId;
  }

  Future<PaymentModel> addPaymentTransaction({
    required double amount,
    String message = "",
    required String subscriptionId,
    String gatewayTransactionId = "",
    required PaymentStatus paymentStatus,
    required PaymentServiceType paymentServiceType,
  }) async {
    int paymentId = await generatePaymentId();
    PaymentModel paymentModel = PaymentModel();
    DocumentReference documentReference = paymentsCollectionReference.doc();
    paymentModel.docId = documentReference.id;
    paymentModel.message = message;
    paymentModel.paymentId = paymentId;
    paymentModel.uid = Utility().getCurrentUserId();
    paymentModel.subscriptionId = subscriptionId;
    paymentModel.paymentStatus = paymentStatus;
    paymentModel.paymentServiceType = paymentServiceType;
    paymentModel.amount = amount;
    paymentModel.timestamp = Timestamp.now();
    await documentReference.set(paymentModel.toMap());
    return paymentModel;
  }
}
