import 'package:drfootapp/models/payment_model.dart';
import 'package:drfootapp/models/payment_new_model.dart';
import 'package:drfootapp/screens/dash_board/profile/service_bookings/payment_details_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PaymentsAndRefundScreen extends StatefulWidget {
  final PaymentNewModel? paymentNewModel;
  const PaymentsAndRefundScreen({
    super.key,
    this.paymentNewModel,
  });

  @override
  State<PaymentsAndRefundScreen> createState() =>
      _PaymentsAndRefundScreenState();
}

class _PaymentsAndRefundScreenState extends State<PaymentsAndRefundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Payments & Refunds",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
      ),
      // body: Container(
      //   margin: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
      //   child: FirestorePagination(
      //       limit: 10,
      //       onEmpty: const Center(
      //         child: Text("No transactions"),
      //       ),
      //       viewType: ViewType.list,
      //       bottomLoader: const Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.blue,
      //         ),
      //       ),
      //       query: paymentsCollectionReference
      //           .where("uid", isEqualTo: getCurrentUserId())
      //           .orderBy('timestamp', descending: true),
      //       itemBuilder: (context, documentSnapshots, index) {
      //         PaymentModel paymentModel =
      //             PaymentModel.fromSnapshot(documentSnapshots[index]);
      //         return PaymentWidget(paymentModel: paymentModel);
      //       }),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                  itemCount: paymentsList.length,
                  itemBuilder: (context, index) {
                    PaymentNewModel paymentItemList = paymentsList[index];
                    return PaymentDetailsWidget(
                      paymentNewModel: paymentItemList,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
