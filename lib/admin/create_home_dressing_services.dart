import 'dart:io';
import 'package:drfootapp/controllers/home_dressing_controller.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/firebase_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class CreateHomeDressingServices extends StatefulWidget {
  final bool isAdmin;
  final HomeDressingModel homeDressingModel;
  const CreateHomeDressingServices({
    super.key,
    this.isAdmin = false,
    required this.homeDressingModel,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CreateHomeDressingServicesState createState() =>
      _CreateHomeDressingServicesState();
}

class _CreateHomeDressingServicesState
    extends State<CreateHomeDressingServices> {
  final HomeDressingController _homeDressingController =
      Get.put(HomeDressingController());

  File? _pickedFile;

  @override
  void initState() {
    if (widget.isAdmin) {
      _homeDressingController.serviceDaysController.text =
          widget.homeDressingModel.duration;
      _homeDressingController.serviceTitleController.text =
          widget.homeDressingModel.title;
      _homeDressingController.serviceDescriptionController.text =
          widget.homeDressingModel.textDescription;
      _homeDressingController.serviceNewPriceController.text =
          widget.homeDressingModel.newPrice.toString();
      _homeDressingController.serviceOldPriceController.text =
          widget.homeDressingModel.oldPrice.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.grey.shade300)
              ]),
              child: Column(
                children: [
                  widget.isAdmin
                      ? Align(
                          alignment: Alignment.topRight,
                          child: TextButton.icon(
                            onPressed: () {
                              Utility.showAlertDialogger(
                                  content: "Do you want to Delete Service",
                                  context: context,
                                  yes: () async {
                                    await homeDressingServicesCollectionReference
                                        .doc(widget.homeDressingModel.docId)
                                        .delete();
                                    Utility.toast("Service deleted");
                                    Get.back();
                                  },
                                  no: () {
                                    Navigator.pop(context);
                                  });
                            },
                            icon: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                            label: const Text(
                              "Delete Service",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  const Text(
                    "Add New Service",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.primary),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => pickFile(),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: _pickedFile != null
                          ? const Icon(Icons.attach_file)
                          : const Icon(Icons.image),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    hint: "Large",
                    label: "Service Title",
                    textEditingController:
                        _homeDressingController.serviceTitleController,
                  ),
                  MyTextField(
                    hint: "1 Day",
                    label: "Service Days",
                    textEditingController:
                        _homeDressingController.serviceDaysController,
                  ),
                  MyTextField(
                    hint: "If your wound is < 500cm , Then it is recommended.",
                    label: "Service Description",
                    textEditingController:
                        _homeDressingController.serviceDescriptionController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          hint: "₹3000",
                          label: "Service Old Price",
                          textInputType: TextInputType.number,
                          textEditingController:
                              _homeDressingController.serviceOldPriceController,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: MyTextField(
                          hint: "₹2550",
                          label: "Service New Price",
                          textInputType: TextInputType.number,
                          textEditingController:
                              _homeDressingController.serviceNewPriceController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    buttonName:
                        widget.isAdmin ? "Update Service" : "Add Service",
                    onPress: () {
                      // widget.isAdmin
                      //     ? _homeDressingController
                      //         .updateServices(widget.homeDressingModel)
                      //     : _homeDressingController
                      //         .uploadService(_homeDressingController);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        // Check if the platform is web
        if (kIsWeb) {
          // Use the bytes property to access the file contents
          // List<int> fileBytes = result.files.single.bytes!;
          // Process the fileBytes as needed
          // For example, you can convert the bytes to a base64 string:
          // String base64String = base64Encode(fileBytes);
          // Then, you can use the base64String or perform other operations
        } else {
          // If the platform is not web, use the path property as before
          _pickedFile = File(result.files.single.path!);
        }
      });
    }
  }
}
