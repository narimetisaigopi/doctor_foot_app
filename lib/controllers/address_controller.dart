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
    _updateLoading(true);
    setAddressModel(addressesModel);
    await addressesCollectionReference
        .doc(addressesModel.docId)
        .update(addressesModel.toMap());
    Get.back();
    _updateLoading(false);
  }

  setAddressModel(AddressModel addressModel) {
    addressModel.houseNo = streetNoController.text;
    addressModel.pincode = pincodeController.text;
    addressModel.area = localityController.text;
    addressModel.alternativeMobileNumber = alternateMobileNumberController.text;
    addressModel.uid = getCurrentUserId();
    addressModel.addressLabel = addressLabelController.text;
  }

  validateAddressAndSave() async {
    _updateLoading(true);
    AddressModel addressesModel = AddressModel();
    setAddressModel(addressesModel);
    String docId = addressesCollectionReference.doc().id;
    addressesModel.docId = docId;
    addressesModel.timestamp = DateTime.now();
    addressesList.add(addressesModel);
    await addressesCollectionReference.doc(docId).set(addressesModel.toMap());
    Get.back();
    Utility.toast("Address added successfully.");
    _updateLoading(false);
  }
}
