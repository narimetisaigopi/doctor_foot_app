import 'package:drfootapp/models/homeScreenModels/order_model.dart';
import 'package:drfootapp/screens/dash_board/dash_board_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSuccessfulScreen extends StatefulWidget {
  final OrderModel orderModel;
  const OrderSuccessfulScreen({super.key, required this.orderModel});

  @override
  State<OrderSuccessfulScreen> createState() => _OrderSuccessfulScreenState();
}

class _OrderSuccessfulScreenState extends State<OrderSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SvgImageWidget(path: AssetsConstants.successful),
              const Text(
                "booking_confirmed",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ).tr(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                Strings.orderId,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF6B6B6B)),
              ).tr(),
              const Text(
                "orderDate",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF6B6B6B)),
              ).tr(),
              Text(
                widget.orderModel.timestamp.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF6B6B6B)),
              ).tr(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                Strings.orderSuccessfulDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.grey5),
              ).tr(),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonName: "View details",
                onPress: () {
                  Get.offAll(() => const DashBoardScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
