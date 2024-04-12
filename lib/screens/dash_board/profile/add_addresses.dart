import 'package:chips_choice/chips_choice.dart';
import 'package:drfootapp/controllers/address_controller.dart';
import 'package:drfootapp/models/addresses_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddresses extends StatefulWidget {
  final bool isEdit;
  final AddressesModel addressesModel;
  const AddAddresses({
    super.key,
    this.isEdit = false,
    required this.addressesModel,
  });

  @override
  State<AddAddresses> createState() => _AddAddressesState();
}

class _AddAddressesState extends State<AddAddresses> {
  int selectedContainerIndex = 0;

  String selectedLabel = "";
  final AddressesController _addressesController =
      Get.put(AddressesController());
  @override
  void initState() {
    _addressesController.localityController.clear();
    _addressesController.streetNoController.clear();
    _addressesController.alternateMobileNumberController.clear();
    _addressesController.addressLabelController.clear();

    if (widget.isEdit) {
      _addressesController.localityController.text = widget.addressesModel.area;
      _addressesController.streetNoController.text =
          widget.addressesModel.state;
      _addressesController.alternateMobileNumberController.text =
          widget.addressesModel.houseNo;
      _addressesController.addressLabelController.text =
          widget.addressesModel.landMark;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit ? "Update address " : "Add  address",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
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
              // MyTextField(
              //   label: "House No",
              //   hint: "4-95/6",
              //   textEditingController: _addressesController.houseNoController,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // MyTextField(
              //   label: "State",
              //   hint: "Telangana",
              //   textEditingController: _addressesController.stateController,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // MyTextField(
              //   label: "Area Name",
              //   hint: "Hyderabad",
              //   textEditingController: _addressesController.areaController,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // MyTextField(
              //   label: "LandMark",
              //   hint: "Near State Bank",
              //   textEditingController: _addressesController.landMarkController,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Add Address Label",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ChipsChoice<String>.single(
                    spacing: 10,
                    runSpacing: 10,
                    choiceStyle: const C2ChipStyle(
                      backgroundColor: Colors.grey,
                    ),
                    value: selectedLabel,
                    onChanged: (val) {
                      selectedLabel = val;

                      // selectedCategoryId = addressLabel[val]!;
                      setState(() {
                        _addressesController.addressLabelController.text = val;
                      });
                    },
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: addressLabel,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                  ),
                ],
              ),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     MyChoiceChip(chipName: "Home"),
              //     MyChoiceChip(chipName: "Work"),
              //     MyChoiceChip(chipName: "Others"),
              //   ],
              // ),
              const SizedBox(
                height: 30,
              ),
              _addressesController.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      buttonName:
                          widget.isEdit ? "Update Address" : "Add Address",
                      bgColor: Colors.black,
                      tColor: Colors.white,
                      onPress: () async {
                        if (_addressesController
                            .localityController.text.isEmpty) {
                          Utility.toast("Invalid house number");
                        } else if (_addressesController
                            .streetNoController.text.isEmpty) {
                          Utility.toast("Invalid State");
                        } else if (_addressesController
                            .alternateMobileNumberController.text.isEmpty) {
                          Utility.toast("Invalid Area");
                        } else if (_addressesController
                            .addressLabelController.text.isEmpty) {
                          Utility.toast("Invalid Land Mark");
                        } else {
                          widget.isEdit
                              ? await _addressesController
                                  .updateAddress(widget.addressesModel)
                              : await _addressesController
                                  .validateAddressAndSave(_addressesController);
                        }
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
