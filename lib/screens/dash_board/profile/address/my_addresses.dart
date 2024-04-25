import 'package:drfootapp/controllers/address_controller.dart';
import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/screens/dash_board/profile/address/add_address_screen.dart';
import 'package:drfootapp/screens/dash_board/profile/address/my_address_widget.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAddresses extends StatefulWidget {
  const MyAddresses({super.key});

  @override
  State<MyAddresses> createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  AddressesController addressesController = Get.put(AddressesController());

  @override
  void initState() {
    addressesController.getMyAddress();
    super.initState();
  }

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
            textColor: Colors.white,
            onPress: () {
              Get.to(() => AddAddressScreen(
                    addressModel: AddressModel(),
                  ));
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: addressesController.addressesList.isEmpty
                ? const Center(child: Text("No data found"))
                : ListView.builder(
                    itemCount: addressesController.addressesList.length,
                    itemBuilder: (context, index) {
                      return MyAddressWidget(
                          addressModel:
                              addressesController.addressesList[index]);
                    }),
          ));
    });
  }
}
