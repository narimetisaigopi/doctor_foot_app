import 'package:drfootapp/screens/nurse/billing_details/addon_list_widget.dart';
import 'package:drfootapp/screens/nurse/billing_details/bill_payments_screen.dart';
import 'package:drfootapp/screens/nurse/billing_details/count_down_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillCheckerScreen extends StatefulWidget {
  const BillCheckerScreen({super.key});

  @override
  State<BillCheckerScreen> createState() => _BillCheckerScreenState();
}

class _BillCheckerScreenState extends State<BillCheckerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.whiteBgColor,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          "Bill Checker",
          style: TextStyle(
              color: AppColors.whiteBgColor,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ).tr(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 84,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Treatment have done in",
                          style: TextStyle(
                            color: AppColors.black1,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.share,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CountDownWidget(),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 500,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.grey,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          color: AppColors.primaryBlue,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12))),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            top: 10,
                                            bottom: 10,
                                            right: 90),
                                        child: Text(
                                          "Bill Details",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.bgColorAppointment,
                                          ),
                                        ),
                                      ),
                                    )),
                                const SizedBox(height: 20),
                                const Expanded(
                                    flex: 9,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Service Total",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "₹" "399",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Discount Amount",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "₹" "0",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Add-onns",
                                            style: TextStyle(
                                                color: AppColors.black1,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 245),
                                            child: Divider(
                                              thickness: 3,
                                              color: AppColors.primaryBlue,
                                            ),
                                          ),
                                          AddonListWidget(),
                                          SizedBox(height: 8),
                                          Divider(),
                                          SizedBox(height: 22),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total Amount",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                "₹" "399",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Center(
                child: CustomButton(
                  bgColor: AppColors.primaryBlue,
                  buttonName: "Collect Cash",
                  textColor: AppColors.whiteBgColor,
                  onPress: () {
                    Get.to(() => const BillPaymentsScreen());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
