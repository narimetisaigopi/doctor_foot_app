import 'package:drfootapp/utils/constants/assets_constants.dart';

class PaymentNewModel {
  String date;
  String statusImage;
  String statusTitle;
  String statusSubTitle;
  String statusSubImage;
  String statusDisc;
  String transactionId;
  String amount;

  PaymentNewModel({
    this.date = "",
    this.statusImage = "",
    this.statusTitle = "",
    this.statusSubTitle = "",
    this.statusSubImage = "",
    this.statusDisc = "",
    this.transactionId = "",
    this.amount = "",
  });
}

List<PaymentNewModel> paymentsList = [
  PaymentNewModel(
    date: "15/02/24",
    statusImage: AssetsConstants.refund_intiated,
    statusTitle: "Refund Initiated",
    statusSubTitle: "Hello! Your service has been initiated.",
    statusDisc: "Money will be credited with in 2-3 Business days.",
    statusSubImage: AssetsConstants.payment_process,
    transactionId: "1234567890",
    amount: "₹ 1000/-",
  ),
  PaymentNewModel(
    date: "22/01/24",
    statusImage: AssetsConstants.payment_success,
    statusTitle: "Refund Successful",
    statusSubTitle: "Hello! Your refund is successful",
    statusDisc: "Money has been credited to your account.",
    statusSubImage: AssetsConstants.payment_done,
    transactionId: "1234567890",
    amount: "₹ 2000/-",
  ),
  PaymentNewModel(
    date: "19/11/23",
    statusImage: AssetsConstants.payment_reject,
    statusTitle: "Refund Unsuccessful",
    statusSubTitle: "Hello! Your refund is unsuccessful.",
    statusDisc: "Due to some technical issue your payment will \nbe delayed.",
    statusSubImage: AssetsConstants.payment_failed,
    transactionId: "1234567890",
    amount: "₹ 1200/-",
  ),
];
