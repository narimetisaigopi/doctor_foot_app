import 'package:drfootapp/controllers/address_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final AddressesController _addressesController =
      Get.put(AddressesController());
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
          "Location",
          style: TextStyle(
              color: AppColors.whiteBgColor,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ).tr(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: AppColors.grey,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.68,
              decoration: const BoxDecoration(
                  color: AppColors.whiteBgColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 24,
                          color: AppColors.primaryBlue,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "700 Colonial Rd, Radhika residency",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackBold,
                              ),
                            ),
                            Text(
                              "West Road, Madhapur.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.pastTextColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Enter Complete Address",
                        style: TextStyle(
                            color: AppColors.blackBold,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ).tr(),
                    ),
                    TextField(
                      maxLength: 1000,
                      maxLines: 1,
                      controller: _addressesController.localityController,
                      decoration: const InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.all(0),
                          hintText: "Enter Locality (optional) ",
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                    TextField(
                      controller: _addressesController.pincodeController,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      decoration: const InputDecoration(
                          counterText: "",
                          hintText: "Flat No / Street No (optional) ",
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                    TextField(
                      controller:
                          _addressesController.alternateMobileNumberController,
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          counterText: "",
                          hintText: "Enter alternate mobile number (optional) ",
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 20),
                    addressTypeLayout(),
                    const SizedBox(height: 32),
                    _addressesController.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            buttonName: "Confirm Location",
                            textColor: Colors.white,
                            onPress: () async {
                              if (_addressesController
                                  .streetNoController.text.isEmpty) {
                                Utility.toast("Please enter street no");
                              } else if (_addressesController
                                  .localityController.text.isEmpty) {
                                Utility.toast("Please enter locality");
                              } else if (_addressesController
                                      .pincodeController.text.isEmpty ||
                                  _addressesController
                                          .pincodeController.text.length <
                                      6) {
                                Utility.toast("Please enter pincode");
                              } else if (_addressesController
                                  .addressLabelController.text.isEmpty) {
                                Utility.toast("Please select landmark");
                              } else {
                                await _addressesController
                                    .validateAddressAndSave();
                              }
                            },
                          ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  addressTypeLayout() {
    return Column(
      children: [
        Row(
          children: [
            Utility.customChoiceChip(
                iconData: Icons.home,
                title: Strings.home,
                isSelected: _addressesController.addressLabelController.text ==
                    Strings.home,
                onTap: (value) {
                  setState(() {
                    _addressesController.addressLabelController.text = value;
                  });
                }),
            const SizedBox(
              width: 10,
            ),
            Utility.customChoiceChip(
                iconData: Icons.work,
                title: Strings.work,
                isSelected: _addressesController.addressLabelController.text ==
                    Strings.work,
                onTap: (value) {
                  setState(() {
                    _addressesController.addressLabelController.text = value;
                  });
                }),
            const SizedBox(
              width: 10,
            ),
            Utility.customChoiceChip(
                iconData: Icons.family_restroom_outlined,
                title: Strings.friendsAndFamily,
                isSelected: _addressesController.addressLabelController.text ==
                    Strings.friendsAndFamily,
                onTap: (value) {
                  setState(() {
                    _addressesController.addressLabelController.text = value;
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
                isSelected: _addressesController.addressLabelController.text ==
                    Strings.others,
                onTap: (value) {
                  setState(() {
                    _addressesController.addressLabelController.text = value;
                  });
                }),
          ],
        ),
      ],
    );
  }
}
