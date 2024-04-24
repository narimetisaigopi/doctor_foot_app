import 'package:drfootapp/controllers/address_controller.dart';
import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/screens/dash_board/profile/address/add_address_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyAddresses extends StatefulWidget {
  const MyAddresses({super.key});

  @override
  State<MyAddresses> createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  AddressesController addressesController = Get.put(AddressesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressesController>(builder: (addressesController) {
      return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey.shade50,
            title: const Text(
              "My Addresses",
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: CustomButton(
            buttonName: "Add New Address",
            width: 300,
            tColor: Colors.white,
            onPress: () {
              Get.to(() => AddAddressScreen(
                    addressModel: AddressModel(),
                  ));
            },
          ),
          body: addressesController.addressesList.isEmpty
              ? const Center(child: Text("No data found"))
              : ListView.builder(
                  itemCount: addressesController.addressesList.length,
                  itemBuilder: (context, index) {
                    return address(addressesController.addressesList[index]);
                  }));
    });
  }

  Widget address(AddressModel addressModel) {
    return InkWell(
      onTap: () {
        addressesController.updateSelectedAddress(addressModel);
        setState(() {});
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: addressModel.docId ==
                      addressesController.selectedAddressModel.docId
                  ? Border.all(
                      style: BorderStyle.solid,
                    )
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(addressModel.addressLabel == "Office"
                        ? Icons.corporate_fare_outlined
                        : Icons.location_on_rounded),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          addressModel.addressLabel,
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
                            "${addressModel.getAddress()}",
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
                Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        await Get.to(() => AddAddressScreen(
                              addressModel: addressModel,
                              isEdit: true,
                            ));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () async {
                        showAlertDialog(
                          context: context,
                          yesCallback: () async {
                            Navigator.pop(context);
                            await addressesController
                                .deleteAddress(addressModel);
                          },
                          noCallback: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          addressesController.selectedAddressModel.docId == addressModel.docId
              ? Positioned(
                  //right: 30,
                  top: -1,
                  left: 30,
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
                          fontSize: 16),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
