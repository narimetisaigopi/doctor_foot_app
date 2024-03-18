import 'package:doctor_foot_app/controllers/home_dressing_controller.dart';
import 'package:doctor_foot_app/models/home_dressing/coupon_code_model.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/widgets/available_offers_widget.dart';
import 'package:doctor_foot_app/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class AvailableOffers extends StatefulWidget {
  const AvailableOffers({super.key});

  @override
  State<AvailableOffers> createState() => _AvailableOffersState();
}

class _AvailableOffersState extends State<AvailableOffers> {
  final HomeDressingController homeDressingController =
      Get.put(HomeDressingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                FontAwesomeIcons.remove,
                color: AppColors.greyTextColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Text(
                "Available offers",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.primary),
              ).tr(),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                labelNeeded: false,
                bgColor: Colors.white,
                hint: "Type coupon code here",
                textEditingController:
                    homeDressingController.searchCouponCodeController,
                iconNeeded: true,
                borderRadius: 8,
                suffixIcon: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyTextColor),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: couponCodesList.length,
                      itemBuilder: (context, index) {
                        final availableOffers = couponCodesList[index];
                        return AvailableOffersWidget(
                          couponCodeModel: availableOffers,
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
