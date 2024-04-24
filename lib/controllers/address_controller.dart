import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/models/address_model.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressesController extends GetxController {
  TextEditingController localityController = TextEditingController();
  TextEditingController streetNoController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController alternateMobileNumberController =
      TextEditingController();
  TextEditingController addressLabelController = TextEditingController();

  List<AddressModel> addressesList = [];

  AddressModel selectedAddressModel = AddressModel();

  bool isLoading = false;

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  updateSelectedAddress(AddressModel addressesModel) {
    selectedAddressModel = addressesModel;
    update();
  }

  getMyAddress() async {
    QuerySnapshot querySnapshot = await addressesCollectionReference
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    addressesList = querySnapshot.docs
        .map((e) => AddressModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();
    logger("getMyAddress ${addressesList.length}");
    update();
  }

  deleteAddress(AddressModel addressesModel) async {
    try {
      update();
      addressesList.removeWhere(
          (AddressModel element) => element.docId == addressesModel.docId);
      await addressesCollectionReference.doc(addressesModel.docId).delete();
      if (selectedAddressModel.docId == addressesModel.docId) {
        selectedAddressModel = AddressModel();
      }
      Utility.toast("Address Deleted");
    } catch (e) {
      Utility.toast("failed to delete ${e.toString()}");
    } finally {
      update();
    }
  }

  updateAddress(AddressModel addressesModel) async {
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
    _updateLoading(true);
    AddressModel addressesModel = AddressModel();
    String docId = addressesCollectionReference.doc().id;
    addressesModel.houseNo = addressesController.streetNoController.text;
    addressesModel.pincode = addressesController.pincodeController.text;
    addressesModel.area = addressesController.localityController.text;

    addressesModel.alternativeMobileNumber =
        addressesController.alternateMobileNumberController.text;
    addressesModel.uid = getCurrentUserId();
    addressesModel.addressLabel =
        addressesController.addressLabelController.text;
    addressesModel.docId = docId;
    addressesModel.timestamp = DateTime.now();
    addressesList.add(addressesModel);

    await addressesCollectionReference.doc(docId).set(addressesModel.toMap());
    Get.back();
    Utility.toast("Address added successfully.");
    _updateLoading(false);
  }
}
