import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drfootapp/controllers/home_dressing_controller.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constatns.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateHomeDressingServices extends StatefulWidget {
  const CreateHomeDressingServices({super.key});

  @override
  State<CreateHomeDressingServices> createState() =>
      _CreateHomeDressingServicesState();
}

class _CreateHomeDressingServicesState
    extends State<CreateHomeDressingServices> {
  final HomeDressingController _homeDressingController =
      Get.put(HomeDressingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.grey.shade300)
              ]),
              child: Column(
                children: [
                  const Text(
                    "Add New Service",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                      hint: "Large",
                      label: "Service Title",
                      textEditingController:
                          _homeDressingController.serviceTitleController),
                  MyTextField(
                      hint: "1 Day",
                      label: "Service Days",
                      textEditingController:
                          _homeDressingController.serviceDaysController),
                  MyTextField(
                      hint:
                          "If your wound is < 500cm , Then it is recommended.",
                      label: "Service Description",
                      textEditingController:
                          _homeDressingController.serviceDescriptionController),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                            hint: "₹3000",
                            label: "Service Old Price",
                            textInputType: TextInputType.number,
                            textEditingController: _homeDressingController
                                .serviceOldPriceController),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: MyTextField(
                            hint: "₹2550",
                            label: "Service New Price",
                            textInputType: TextInputType.number,
                            textEditingController: _homeDressingController
                                .serviceNewPriceController),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    buttonName: "Add Service",
                    onPress: () => uploadService(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadService() async {
    try {
      CollectionReference collectionReference =
          homeDressingServicesCollectionReference;
      DocumentReference documentReference = collectionReference.doc();
      HomeDressingModel homeDressingModel = HomeDressingModel();
      homeDressingModel.title =
          _homeDressingController.serviceTitleController.text;
      homeDressingModel.description =
          _homeDressingController.serviceDaysController.text;
      homeDressingModel.docId = documentReference.id;
      homeDressingModel.uId = FirebaseAuth.instance.currentUser!.uid;
      homeDressingModel.image = "";
      homeDressingModel.textDescription =
          _homeDressingController.serviceDescriptionController.text;
      homeDressingModel.newPrice =
          double.parse(_homeDressingController.serviceNewPriceController.text);
      homeDressingModel.oldPrice =
          double.parse(_homeDressingController.serviceOldPriceController.text);

      await documentReference.set(homeDressingModel.toMap());
      _homeDressingController.clearTextFields();

      Utility.toast("Service Uploaded Successfully",
          backgroundColor: Colors.green);
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }
}
