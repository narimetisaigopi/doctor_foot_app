import 'package:doctor_foot_app/utils/constants/assets_constants.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
              const Text(
                "PhonePe UPI",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ).tr(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
