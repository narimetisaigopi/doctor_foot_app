// ignore_for_file: unnecessary_import
import 'package:doctor_foot_app/controllers/address_controller.dart';
import 'package:doctor_foot_app/models/home_dressing/home_dressing_model.dart';
import 'package:doctor_foot_app/screens/home_dressing_services/available_offers.dart';
import 'package:doctor_foot_app/screens/home_dressing_services/payment_gatway.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';

import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/utility.dart';
import 'package:doctor_foot_app/utils/widgets/custom_button.dart';
import 'package:doctor_foot_app/utils/widgets/home_dressing_service_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
  final Function onPress;
  const HomeDressingPayment({
    super.key,
    this.height = 160,
    this.width = double.infinity,
    this.imagePath = "assets/images/home_dressing/wounded_foot.svg",
    this.description = "If your wound is < 25cm , Then it is recommended.",
    this.oldPrice = 0,
    this.newPrice = 800,
    this.isAdded = false,
    this.textDescription = "1 Day",
    this.title = "Small",
    required this.onPress,
  });

  @override
  State<HomeDressingPayment> createState() => _HomeDressingPaymentState();
}

class _HomeDressingPaymentState extends State<HomeDressingPayment> {
  int selectedContainerIndex = 0;

  final AddressesController _addressesController =
      Get.put(AddressesController());
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
        ),
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              HomeDressingServiceWidget(
                description: widget.description,
                imagePath: widget.imagePath,
                title: widget.title,
                newPrice: widget.newPrice,
                oldPrice: widget.oldPrice,
                textDescription: widget.textDescription,
                isAdded: isAdded,
                onPress: () {
                  setState(() {
                    isAdded = !isAdded;
                  });
                },
              ),
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
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Bill Details",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    paymentText(),
                    const SizedBox(
                      height: 20,
                    ),
                    paymentText(defaultText: "Discount amount ", amount: 0),
                    const SizedBox(
                      height: 20,
                    ),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(),
                    )),
                    const SizedBox(
                      height: 20,
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextButton(onPressed: () {}, child: const Text("Edit"))
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    "House No: 124-3, Main Road, near forum mall, KPHB, Hyderabad- 560058",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  " Address",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
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
                      icon: const Icon(
                        Icons.work,
                        size: 18,
                      ),
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
                      icon: const Icon(
                        Icons.family_restroom_outlined,
                        size: 18,
                      ),
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
                      width: 100,
                      icon: const Icon(Icons.location_on),
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
                  Utility.myBottomSheet(context,
                      widget: const PaymentGateWay());
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
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
        ),
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
        Get.to(() => const AvailableOffers());
      },
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    containerText,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                icon
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined))
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
