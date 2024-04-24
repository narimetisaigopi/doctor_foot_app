import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/screens/dash_board/profile/address/my_address_widget.dart';
import 'package:drfootapp/screens/dash_board/profile/address/my_addresses.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDressingAddressWidget extends StatelessWidget {
  final AddressModel addressModel;
  const HomeDressingAddressWidget({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                addressModel.docId.isEmpty
                    ? "No addresses"
                    : "Selected Address",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ).tr(),
              TextButton(
                  onPressed: () {
                    Get.to(() => const MyAddresses());
                  },
                  child: Text(
                    addressModel.docId.isEmpty ? 'Add new' : "Edit",
                    style: const TextStyle(color: AppColors.primary),
                  ).tr())
            ],
          ),
          if (addressModel.docId.isNotEmpty)
            MyAddressWidget(
              addressModel: addressModel,
              allowEdit: false,
              enabledSelection: false,
            )
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   height: 80,
          //   width: double.infinity,
          //   alignment: Alignment.centerLeft,
          //   decoration: BoxDecoration(
          //       color: Colors.white, borderRadius: BorderRadius.circular(12)),
          //   child: Text(
          //     addressModel.getAddress(),
          //     textAlign: TextAlign.start,
          //     style:
          //         const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          //   ).tr(),
          // )
        ]);
  }
}
