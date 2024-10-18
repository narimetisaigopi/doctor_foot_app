// ignore_for_file: unnecessary_import
import 'package:drfootapp/controllers/address_controller.dart';
import 'package:drfootapp/controllers/coupon_code_controller.dart';
import 'package:drfootapp/controllers/foot_services_controller.dart';
import 'package:drfootapp/controllers/payment_controller.dart';
import 'package:drfootapp/screens/foot_services/available_offers.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/foot_service_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'foot_payment_address.dart';

class HomeFootPayient extends StatefulWidget {
  final double height;
  final double width;
  const HomeFootPayment({
    super.key,
    this.height = 160,
    this.width = double.infinity,
  });

  @override
  State<HomeFootPayment> createState() => _HomeFootPaymentState();
}

class _HomeFootPaymentState extends State<HomeFootPayment> {
  int selectedContainerIndex = 0;
  final FootServiceController homeDressingController =
      Get.put(FootServiceController());

  final PaymentController paymentController = Get.put(PaymentController());

  final AddressesController _addressesController =
      Get.put(AddressesController());
  final CouponCodeController couponCodeController =
      Get.put(CouponCodeController());

  String selectedLabel = "";
  bool isAdded = true;

  @override
  void initState() {
    if (_addressesController.selectedAddressModel.docId.isEmpty) {
      if (_addressesController.addressesList.isEmpty) {
        _addressesController.getMyAddress().then((value) {
          if (value.isNotEmpty) {
            homeDressingController.updateAddressSelection(value.first);
          }
        });
      } else {
        homeDressingController
            .updateAddressSelection(_addressesController.addressesList.first);
      }
    }
    super.initState();
  }

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
              color: AppColors.primaryBlue,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ).tr(),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primaryBlue,
            )),
      ),
      body: GetBuilder<FootServiceController>(builder: (footServiceController) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 2),
            child: Column(
              children: [
                FootServiceWidget(
                  footServiceModel:
                      footServiceController.selectedFootServiceModel,
                  onPress: () {
                    couponCodeController.selectedCouponCodeModel == null
                        ? Get.back()
                        : Null;
                    footServiceController.addOrRemoveFromList(
                        footServiceModel:
                            footServiceController.selectedFootServiceModel);
                  },
                ),
                // ListView.builder(
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: homeDressingController
                //         .homeDressingServicesAddedList.length,
                //     itemBuilder: (context, index) {
                //       final homeDressingService = homeDressingController
                //           .homeDressingServicesAddedList[index];
                //       return FootServiceWidget(
                //         footServiceModel: homeDressingService,
                //         onPress: () {
                //           couponCodeController.selectedCouponCodeModel == null
                //               ? Get.back()
                //               : Null;
                //           homeDressingController.addOrRemoveFromList(
                //               homeDressingModel: homeDressingService);
                //         },
                //       );
                //     }),
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
                        amount: footServiceController.finalAmount,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      paymentText(
                        defaultText: "Discount amount ",
                        amount: footServiceController.discountAmount,
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
                                ? footServiceController.finalAmount
                                : footServiceController.finalAmount -
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
                GetBuilder<AddressesController>(builder: (context) {
                  return FootPaymentWidget(
                    addressModel: footServiceController.selectedAddressModel,
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                footServiceController.isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        buttonName:
                            "Make Payment | ₹ ${footServiceController.finalAmount}",
                        onPress: () {
                          if (footServiceController
                              .selectedAddressModel.docId.isEmpty) {
                            Utility.toast("Please select address");
                          } else {
                            footServiceController.proceedToPayment();
                          }
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

  addressLayout() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: const Text(
            "Address",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ).tr(),
        ),
        const TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hintText: "Enter Locality (optional) ",
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        ),
        const TextField(
          decoration: InputDecoration(
              hintText: "Flat No / Street No (optional) ",
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        ),
        const TextField(
          decoration: InputDecoration(
              hintText: "Enter alternate mobile number (optional) ",
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
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
      ],
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
