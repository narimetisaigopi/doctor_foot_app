import 'package:drfootapp/controllers/address_controller.dart';
import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddAddressScreen extends StatefulWidget {
  final bool isEdit;
  final AddressModel addressModel;
  const AddAddressScreen({
    super.key,
    this.isEdit = false,
    required this.addressModel,
  });

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final AddressesController _addressesController =
      Get.put(AddressesController());
  @override
  void initState() {
    _addressesController.localityController.clear();
    _addressesController.streetNoController.clear();
    _addressesController.alternateMobileNumberController.clear();
    _addressesController.addressLabelController.clear();
    _addressesController.pincodeController.clear();

    if (widget.isEdit) {
      _addressesController.localityController.text = widget.addressModel.area;
      _addressesController.streetNoController.text =
          widget.addressModel.houseNo;
      _addressesController.alternateMobileNumberController.text =
          widget.addressModel.alternativeMobileNumber;
      _addressesController.addressLabelController.text =
          widget.addressModel.addressLabel;
      _addressesController.pincodeController.text = widget.addressModel.pincode;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressesController>(builder: (addressesController) {
      return Scaffold(
        backgroundColor: AppColors.daysBgColor,
        appBar: AppBar(
          title: Text(
            widget.isEdit ? "Update address" : "Add address",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                TextField(
                  controller: _addressesController.streetNoController,
                  maxLength: 1000,
                  maxLines: 2,
                  decoration: const InputDecoration(
                      hintText: "Flat No / Street No",
                      counterText: "",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                TextField(
                  maxLength: 1000,
                  maxLines: 1,
                  controller: _addressesController.localityController,
                  decoration: const InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Enter Locality",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
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
                      hintText: "Enter pincode",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                TextField(
                  controller:
                      _addressesController.alternateMobileNumberController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      counterText: "",
                      hintText: "Enter alternate mobile number (optional) ",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Text(
                      "Add Address Label",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                addressTypeLayout(),
                const SizedBox(
                  height: 16,
                ),
                _addressesController.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        buttonName:
                            widget.isEdit ? "Update Address" : "Add Address",
                        textColor: Colors.white,
                        onPress: validate,
                      )
              ],
            ),
          ),
        ),
      );
    });
  }

  validate() async {
    if (_addressesController.streetNoController.text.isEmpty) {
      Utility.toast("Please enter street no");
    } else if (_addressesController.localityController.text.isEmpty) {
      Utility.toast("Please enter locality");
    } else if (_addressesController.pincodeController.text.isEmpty ||
        _addressesController.pincodeController.text.length < 6) {
      Utility.toast("Please enter pincode");
    } else if (_addressesController.addressLabelController.text.isEmpty) {
      Utility.toast("Please select landmark");
    } else {
      Utility.showAlertDialogger(
          context: context,
          yes: () async {
            if (widget.isEdit) {
              await _addressesController.updateAddress(widget.addressModel);
            } else {
              await _addressesController.validateAddressAndSave();
            }
          },
          no: () {
            Get.back();
          });
    }
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
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
      ],
    );
  }
}
