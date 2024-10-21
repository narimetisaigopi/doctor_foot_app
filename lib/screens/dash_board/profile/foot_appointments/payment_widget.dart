import 'package:drfootapp/models/payment_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';

class PaymentWidget extends StatefulWidget {
  final PaymentModel paymentModel;
  const PaymentWidget({
    super.key,
    required this.paymentModel,
  });

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
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
                Utility.convertTimeStamp(
                    widget.paymentModel.timestamp!.toDate()),
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
                          getImage(),
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
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    "widget.paymentNewModel.statusTitle",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: getColor(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: Image.asset(
                                      getSubImage(),
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "widget.paymentNewModel.statusSubTitle",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.payTextColor,
                              ),
                            ),
                            const Text(
                              "widget.paymentNewModel.statusDisc",
                              style: TextStyle(
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
                            widget.paymentModel.paymentId.toString(),
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
                            Utility()
                                .toIndianFormat(widget.paymentModel.paidAmount),
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

  Color getColor() {
    Color color = Colors.black;
    if (widget.paymentModel.refundStatus != PaymentStatus.none) {
      color = AppColors.warningColor;
    } else if (widget.paymentModel.paymentStatus == PaymentStatus.completed) {
      color = AppColors.successColor;
    } else if (widget.paymentModel.paymentStatus == PaymentStatus.cancelled) {
      color = AppColors.rejectColor;
    }
    return color;
  }

  String getImage() {
    String image = AssetsConstants.refund_intiated;
    if (widget.paymentModel.refundStatus != PaymentStatus.none) {
      image = AssetsConstants.refund_intiated;
    } else if (widget.paymentModel.paymentStatus == PaymentStatus.completed) {
      image = AssetsConstants.payment_success;
    } else if (widget.paymentModel.paymentStatus == PaymentStatus.cancelled) {
      image = AssetsConstants.payment_reject;
    }
    return image;
  }

  String getSubImage() {
    String image = AssetsConstants.payment_process;
    if (widget.paymentModel.refundStatus != PaymentStatus.none) {
      image = AssetsConstants.payment_process;
    } else if (widget.paymentModel.paymentStatus == PaymentStatus.completed) {
      image = AssetsConstants.payment_done;
    } else if (widget.paymentModel.paymentStatus == PaymentStatus.cancelled) {
      image = AssetsConstants.payment_failed;
    }
    return image;
  }
}
