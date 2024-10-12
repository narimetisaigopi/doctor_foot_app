import 'package:drfootapp/models/payment_new_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentDetailsWidget extends StatefulWidget {
  final PaymentNewModel paymentNewModel;
  const PaymentDetailsWidget({
    super.key,
    required this.paymentNewModel,
  });

  @override
  State<PaymentDetailsWidget> createState() => _PaymentDetailsWidgetState();
}

class _PaymentDetailsWidgetState extends State<PaymentDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Date: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black2,
                ),
              ),
              Text(
                widget.paymentNewModel.date,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.whiteBgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.grey4,
                  width: 1,
                )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          widget.paymentNewModel.statusImage,
                          height: 34,
                          width: 34,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.paymentNewModel.statusTitle,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: widget.paymentNewModel.statusTitle ==
                                            "Refund Initiated"
                                        ? AppColors.warningColor
                                        : widget.paymentNewModel.statusTitle ==
                                                "Refund Successful"
                                            ? AppColors.successColor
                                            : AppColors.rejectColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Image.asset(
                                    widget.paymentNewModel.statusSubImage,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.paymentNewModel.statusSubTitle,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.payTextColor,
                              ),
                            ),
                            Text(
                              widget.paymentNewModel.statusDisc,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.payTextColor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "ID : ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.payTextColor,
                            ),
                          ),
                          Text(
                            widget.paymentNewModel.transactionId,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.payTextColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Amount :",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.payTextColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.paymentNewModel.amount,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.payTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
