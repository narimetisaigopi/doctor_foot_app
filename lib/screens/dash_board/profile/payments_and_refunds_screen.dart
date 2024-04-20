import 'package:drfootapp/screens/dash_board/profile/pr_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PaymentsAndRefundScreen extends StatefulWidget {
  const PaymentsAndRefundScreen({super.key});

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
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Payments & Refunds",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ).tr(),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, top: 22, right: 16),
        child: const Column(
          children: [
            PrScreen(),
           SizedBox(
              height: 16,
            ),
            PrScreen(),
            SizedBox(
              height: 16,
            ),
            PrScreen(),
            SizedBox(
              height: 16,
            ),
            PrScreen(),
            SizedBox(
              height: 16,
            ),
            PrScreen(),
          ],
        ),
      ),
    );
  }
}
