// ignore_for_file: unnecessary_import
import 'package:drfootapp/controllers/address_controller.dart';
import 'package:drfootapp/controllers/coupon_code_controller.dart';
import 'package:drfootapp/controllers/home_dressing_controller.dart';
import 'package:drfootapp/controllers/payment_controller.dart';

import 'package:drfootapp/screens/home_dressing_services/available_offers.dart';

import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';

import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/home_dressing_service_widget.dart';
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
                          couponCodeController.selectedCouponCodeModel == null
                              ? Get.back()
                              : Null;
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
                  height: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      paymentText(
                        amount: homeDressingController.finalAmount,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      paymentText(
                        defaultText: "Discount amount ",
                        amount: homeDressingController.discountAmount,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      couponCodeController.selectedCouponCodeModel == null
                          ? const SizedBox.shrink()
                          : paymentText(
                              defaultText: "Coupon Applied",
                              textColor: Colors.green,
                              amount: double.parse(
                                couponCodeController
                                    .selectedCouponCodeModel!.maxDiscount
                                    .toString(),
                              )),
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
                        amount:
                            couponCodeController.selectedCouponCodeModel == null
                                ? homeDressingController.payableAmount
                                : homeDressingController.payableAmount -
                                    couponCodeController
                                        .selectedCouponCodeModel!.maxDiscount,
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
                        onTap: (value) {
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
                        onTap: (value) {
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
                        onTap: (value) {
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
                        onTap: (value) {
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
                  buttonName:
                      "Make Payment | ₹ ${homeDressingController.finalAmount}",
                  onPress: () {
                    homeDressingController.proceedToPayment();
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
      Color textColor = Colors.black,
      double fontSize = 14,
      TextStyle textStyle = const TextStyle()}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          defaultText,
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontSize, color: textColor),
        ).tr(),
        Text(
          "₹${amount.round()}",
          style: TextStyle(
              fontWeight: fontWeight, fontSize: fontSize, color: textColor),
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
                      couponCodeController.selectedCouponCodeModel == null
                          ? containerText
                          : "${couponCodeController.selectedCouponCodeModel!.couponCode}% OFF",
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
                            setState(() {});
                          },
                          icon: const Icon(FontAwesomeIcons.xmark,
                              color: Colors.green))
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget addressContainer(AddressesController addressesController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 0))
          ]),
      child: addressesController.addressesList.isEmpty
          ? Center(
              child: TextButton.icon(
                  onPressed: () {
                    //     Get.to(() => const MyAddresses());
                  },
                  icon: const Icon(
                    Icons.add_location,
                    size: 50,
                    color: Colors.blue,
                  ),
                  label: const Text(
                    "Add Address ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  )),
            )
          : Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        addressesController.selectedAddressModel.addressLabel,
                        // textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          //  Get.to(() => const MyAddresses());
                        },
                        child: const Text(
                          "change address",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${addressesController.selectedAddressModel.state}, ${addressesController.selectedAddressModel.area}, ",
                          maxLines: 3,
                          //textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.blueGrey),
                        ),
                        Text(
                          addressesController.selectedAddressModel.landMark,
                          maxLines: 3,
                          // textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
