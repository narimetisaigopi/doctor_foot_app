import 'package:drfootapp/controllers/address_controller.dart';
import 'package:drfootapp/controllers/doctor_appointment_controller.dart';
import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/screens/dash_board/profile/address/add_address_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utility.dart';

class MyAddressWidget extends StatefulWidget {
  final AddressModel addressModel;
  final bool enabledSelection;
  final bool allowEdit;
  const MyAddressWidget(
      {super.key,
      this.enabledSelection = true,
      this.allowEdit = true,
      required this.addressModel});

  @override
  State<MyAddressWidget> createState() => _MyAddressWidgetState();
}

class _MyAddressWidgetState extends State<MyAddressWidget> {
  AddressesController addressesController = Get.put(AddressesController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.allowEdit) {
          addressesController.updateSelectedAddress(widget.addressModel);
          setState(() {});
        }
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: widget.addressModel.docId ==
                      addressesController.selectedAddressModel.docId
                  ? Border.all(
                      style: BorderStyle.solid, color: AppColors.primary)
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      getIcon(widget.addressModel),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.addressModel.addressLabel,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "${widget.addressModel.getAddress()}",
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (widget.allowEdit)
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () async {
                              await Get.to(() => AddAddressScreen(
                                    addressModel: widget.addressModel,
                                    isEdit: true,
                                  ));
                            },
                            child: const Icon(Icons.edit)),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () async {
                              Utility().showAlertDialog(
                                context: context,
                                yesCallback: () async {
                                  Navigator.pop(context);
                                  await addressesController
                                      .deleteAddress(widget.addressModel);
                                },
                                noCallback: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                            child: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          addressesController.selectedAddressModel.docId ==
                  widget.addressModel.docId
              ? Positioned(
                  //right: 30,
                  top: 0,
                  right: 60,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 2, left: 5, right: 5, bottom: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "selected",
                      style: TextStyle(
                          // backgroundColor: Colors.black,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget getIcon(AddressModel addressModel) {
    IconData iconData = Icons.work_outlined;
    if (addressModel.addressLabel == Strings.work) {
      iconData = Icons.corporate_fare_outlined;
    } else if (addressModel.addressLabel == Strings.friendsAndFamily) {
      iconData = Icons.family_restroom_outlined;
    } else if (addressModel.addressLabel == Strings.friendsAndFamily) {
      iconData = Icons.location_on_outlined;
    }
    return Icon(
      iconData,
      color: AppColors.primary,
    );
  }
}
