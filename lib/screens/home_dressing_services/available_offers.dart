import 'package:doctor_foot_app/controllers/home_dressing_controller.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/widgets/available_offers_widget.dart';
import 'package:doctor_foot_app/utils/widgets/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                hint: "Type coupon code here",
                textEditingController:
                    homeDressingController.searchCouponCodeController,
                labelNeeded: false,
                iconNeeded: false,
                bgColor: Colors.white,
                suffix: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    child: Text("Apply"),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              const AvailableOffersWidget(),
              const SizedBox(
                height: 20,
              ),
              const AvailableOffersWidget(),
              const SizedBox(
                height: 20,
              ),
              const AvailableOffersWidget()
              //const AvailableOffersWidget()
            ],
          ),
        ),
      ),
    );
  }
}
