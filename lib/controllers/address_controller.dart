import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/addresses_model.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddressesController extends GetxController {
  TextEditingController localityController = TextEditingController();
  TextEditingController streetNoController = TextEditingController();
  TextEditingController alternateMobileNumberController =
      TextEditingController();
  TextEditingController addressLabelController = TextEditingController();

  List<AddressesModel> addressesList = [];

  AddressesModel selectedAddressesModel = AddressesModel();

  bool isLoading = false;

  updateSelectedAddress(AddressesModel addressesModel) {
    selectedAddressesModel = addressesModel;
    update();
  }

  getMyAddress() async {
    QuerySnapshot querySnapshot = await addressesCollectionReference
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    addressesList = querySnapshot.docs
        .map((e) => AddressesModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();
    print("getMyAddress ${addressesList.length}");
    update();
  }

  deleteAddress(AddressesModel addressesModel) async {
    try {
      update();
      addressesList.removeWhere(
          (AddressesModel element) => element.docId == addressesModel.docId);
      await addressesCollectionReference.doc(addressesModel.docId).delete();
      if (selectedAddressesModel.docId == addressesModel.docId) {
        selectedAddressesModel = AddressesModel();
      }
      Utility.toast("Address Deleted");
    } catch (e) {
      Utility.toast("failed to delete ${e.toString()}");
    } finally {
      update();
    }
  }

  updateAddress(AddressesModel addressesModel) async {
    update();
    await addressesCollectionReference.doc(addressesModel.docId).update({
      // "houseNo": houseNoController.text,
      // "state": stateController.text,
      // "area": areaController.text,
      // "landMark": landMarkController.text,
    });

    update();
  }

  validateAddressAndSave(AddressesController addressesController) async {
    update();
    AddressesModel addressesModel = AddressesModel();
    String docId = addressesCollectionReference.doc().id;
    // addressesModel.houseNo = addressesController.houseNoController.text;
    // addressesModel.state = addressesController.stateController.text;
    // addressesModel.area = addressesController.areaController.text;
    // addressesModel.landMark = addressesController.landMarkController.text;
    addressesModel.uid = FirebaseAuth.instance.currentUser!.uid;
    addressesModel.addressLabel =
        addressesController.addressLabelController.text;
    addressesModel.docId = docId;
    addressesModel.timestamp = DateTime.now();
    addressesList.add(addressesModel);

    await addressesCollectionReference
        .doc(docId)
        .set(addressesModel.toMap())
        .then((value) => Get.back());

    update();
  }
}
