// ignore_for_file: unnecessary_import
import 'package:doctor_foot_app/controllers/address_controller.dart';
import 'package:doctor_foot_app/controllers/coupon_code_controller.dart';
import 'package:doctor_foot_app/controllers/home_dressing_controller.dart';
import 'package:doctor_foot_app/controllers/payment_controller.dart';

import 'package:doctor_foot_app/screens/home_dressing_services/available_offers.dart';

import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/assets_constants.dart';

import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:doctor_foot_app/utils/widgets/home_dressing_service_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeDressingPayment extends StatefulWidget {
  final String imagePath;
  final bool isAdded;
  final String description;
  final String title;
  final String textDescription;
  final double height;
  final double width;
  final double oldPrice;
  final double newPrice;

  const HomeDressingPayment({
    super.key,
    this.height = 160,
    this.width = double.infinity,
    this.imagePath = AssetsConstants.wounded_foot,
    this.description = Strings.home_dressing_description,
    this.oldPrice = 0,
    this.newPrice = 800,
    this.isAdded = false,
    this.textDescription = "1 Day",
    this.title = Strings.small,
  });

  @override
  State<HomeDressingPayment> createState() => _HomeDressingPaymentState();
}

class _HomeDressingPaymentState extends State<HomeDressingPayment> {
  int selectedContainerIndex = 0;
  final HomeDressingController homeDressingController =
      Get.put(HomeDressingController());

  final PaymentController paymentController = Get.put(PaymentController());

  final AddressesController _addressesController =
      Get.put(AddressesController());
  final CouponCodeController couponCodeController =
      Get.put(CouponCodeController());
  String selectedLabel = "";
  bool isAdded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Payment",
          style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ).tr(),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primary,
            )),
      ),
      body:
          GetBuilder<HomeDressingController>(builder: (homeDressingController) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 2),
            child: Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeDressingController
                        .homeDressingServicesAddedList.length,
                    itemBuilder: (context, index) {
                      final homeDressingService = homeDressingController
                          .homeDressingServicesAddedList[index];
                      return HomeDressingServiceWidget(
                        homeDressingModel: homeDressingService,
                        onPress: () {
                          homeDressingController.addOrRemoveFromList(
                              homeDressingModel: homeDressingService);
                        },
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                labelContainers(icon: true),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Bill Details",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              decoration: TextDecoration.underline),
                        ).tr(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      paymentText(),
                      const SizedBox(
                        height: 10,
                      ),
                      paymentText(defaultText: "Discount amount ", amount: 0),
                      const SizedBox(
                        height: 10,
                      ),
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      paymentText(
                        defaultText: "Pay you",
                        amount: 0,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Selected Address",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ).tr(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Edit",
                          style: TextStyle(color: AppColors.primary),
                        ).tr())
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: const Text(
                      "House No: 124-3, Main Road, near forum mall, KPHB, Hyderabad- 560058",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ).tr(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    " Address",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ).tr(),
                ),
                const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Enter Locality (optional) ",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "Flat No / Street No (optional) ",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "Enter alternate mobile number (optional) ",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Utility.customChoiceChip(
                        iconData: Icons.home,
                        title: Strings.home,
                        isSelected: selectedContainerIndex == 1,
                        onTap: () {
                          setState(() {
                            selectedContainerIndex = 1;
                            _addressesController.addressLabelController.text =
                                Strings.home;
                          });
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    Utility.customChoiceChip(
                        iconData: Icons.work,
                        title: Strings.work,
                        isSelected: selectedContainerIndex == 2,
                        onTap: () {
                          setState(() {
                            selectedContainerIndex = 2;
                            _addressesController.addressLabelController.text =
                                Strings.home;
                          });
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    Utility.customChoiceChip(
                        iconData: Icons.family_restroom_outlined,
                        title: Strings.friendsAndFamily,
                        isSelected: selectedContainerIndex == 3,
                        onTap: () {
                          setState(() {
                            selectedContainerIndex = 3;
                            _addressesController.addressLabelController.text =
                                Strings.home;
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Utility.customChoiceChip(
                        iconData: Icons.location_on,
                        width: 100,
                        title: Strings.others,
                        isSelected: selectedContainerIndex == 4,
                        onTap: () {
                          setState(() {
                            selectedContainerIndex = 4;
                            _addressesController.addressLabelController.text =
                                Strings.home;
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  buttonName: "Make Payment | Rs.1500",
                  onPress: () {
                    paymentController.startPayment();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget paymentText(
      {String defaultText = "Service total",
      double amount = 1500,
      FontWeight fontWeight = FontWeight.w500,
      double fontSize = 14,
      TextStyle textStyle = const TextStyle()}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          defaultText,
          style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
        ).tr(),
        Text(
          "₹${amount.round()}",
          style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
        )
      ],
    );
  }

  Widget labelContainers({
    String title = "Offers & Benefits",
    String containerText = "Apply Coupon",
    bool icon = false,
  }) {
    return InkWell(
      onTap: () {
        Get.to(() => const AvailableOffers())!.then((value) {
          setState(() {});
        });
      },
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ).tr(),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<CouponCodeController>(builder: (context) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      // containerText,
                      couponCodeController.selectedCouponCodeModel == null
                          ? containerText
                          : couponCodeController
                              .selectedCouponCodeModel!.couponCode,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: couponCodeController.selectedCouponCodeModel ==
                                  null
                              ? Colors.black
                              : Colors.green),
                    ).tr(),
                  ),
                  couponCodeController.selectedCouponCodeModel == null
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_outlined))
                      : IconButton(
                          onPressed: () {
                            couponCodeController.removeSelectedCoupon();
                          },
                          icon: const Icon(FontAwesomeIcons.remove,
                              color: Colors.green))
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
