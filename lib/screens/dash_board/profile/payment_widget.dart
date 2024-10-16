import 'package:drfootapp/models/payment_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/extenstions.dart';
import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {
  final PaymentModel paymentModel;
  const PaymentWidget({super.key, required this.paymentModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
            color: AppColors.whiteBgColor,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            item(
                paymentModel.paymentStatus == PaymentStatus.refunded
                    ? "Refund Id"
                    : "Transaction Id",
                "#${paymentModel.paymentId.toString()}"),
            item("Refund amount",
                paymentModel.totalAmount.toInt().inRupeesFormat()),
          ],
        ),
      ),
    );
  }

  item(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey2,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackBold,
          ),
        ),
      ],
    );
  }
}
