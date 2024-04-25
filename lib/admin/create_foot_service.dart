import 'package:drfootapp/controllers/foot_services_controller.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/utils/enums.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_drop_down_widget.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateFootService extends StatefulWidget {
  final bool isUpdate;
  final FootServiceModel homeDressingModel;
  const CreateFootService({
    super.key,
    this.isUpdate = false,
    required this.homeDressingModel,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CreateFootServiceState createState() => _CreateFootServiceState();
}

class _CreateFootServiceState extends State<CreateFootService> {
  final FootServiceController _homeDressingController =
      Get.put(FootServiceController());
  String? _imagePath;

  @override
  void initState() {
    _homeDressingController.clearTextFields();
    if (widget.isUpdate) {
      _homeDressingController.serviceDurationsController.text =
          widget.homeDressingModel.duration;
      _homeDressingController.serviceTitleController.text =
          widget.homeDressingModel.title;
      _homeDressingController.serviceDescriptionController.text =
          widget.homeDressingModel.description;
      _homeDressingController.serviceOriginalPriceController.text =
          widget.homeDressingModel.originalPrice.toString();
      _homeDressingController.serviceOfferPriceController.text =
          widget.homeDressingModel.offerPrice.toString();
      _homeDressingController.selectedFootService =
          widget.homeDressingModel.footService!.index;
      _homeDressingController.selectedDressingService =
          widget.homeDressingModel.dressingService!.index;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FootServiceController>(builder: (homeDressingController) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.isUpdate ? "Update service" : "Add new service"),
        ),
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(blurRadius: 10, color: Colors.grey.shade300)
                ]),
                child: Column(
                  children: [
                    widget.isUpdate
                        ? Align(
                            alignment: Alignment.topRight,
                            child: TextButton.icon(
                              onPressed: () {
                                Utility.showAlertDialogger(
                                    content: "Do you want to Delete Service",
                                    context: context,
                                    yes: () async {
                                      Get.back();
                                      _homeDressingController.deleteService(
                                          widget.homeDressingModel);
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
                    InkWell(
                      onTap: pickFile,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: _imagePath != null
                            ? Image.network(_imagePath!)
                            : const Icon(Icons.image),
                      ),
                    ),
                    TextButton(
                        onPressed: pickFile, child: const Text("Pick image")),
                    CustomDropDownWidget(
                        hint: "Foot service",
                        initialValue:
                            _homeDressingController.selectedFootService != null
                                ? enumToString(FootServices.values[
                                    _homeDressingController
                                        .selectedFootService!])
                                : null,
                        menuItems: FootServices.values
                            .map((e) => DropdownMenuItem(
                                value: enumToString(e.toString()),
                                child: Text(enumToString(e.toString()))))
                            .toList(),
                        onChanged: (value) {
                          _homeDressingController.selectedFootService =
                              stringToEnum(value!, FootServices.values)!.index;
                          setState(() {});
                        },
                        errorMessage: "Select foot service"),
                    const SizedBox(height: 20),
                    if (_homeDressingController.selectedFootService == 1)
                      CustomDropDownWidget(
                          hint: "Dressing service",
                          menuItems: DressingServices.values
                              .map((e) => DropdownMenuItem(
                                  value: enumToString(e.toString()),
                                  child: Text(enumToString(e.toString()))))
                              .toList(),
                          onChanged: (value) {
                            _homeDressingController.selectedDressingService =
                                stringToEnum(value!, DressingServices.values)!
                                    .index;
                          },
                          errorMessage: "Select dressing service"),
                    MyTextField(
                      hint: "Large",
                      label: "Title",
                      textEditingController:
                          _homeDressingController.serviceTitleController,
                    ),
                    MyTextField(
                      hint: "1 Day",
                      label: "Days",
                      textEditingController:
                          _homeDressingController.serviceDurationsController,
                    ),
                    MyTextField(
                      hint:
                          "If your wound is < 500cm , Then it is recommended.",
                      label: "Description",
                      textEditingController:
                          _homeDressingController.serviceDescriptionController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: MyTextField(
                            hint: "₹3000",
                            label: "Actutal price",
                            textInputType: TextInputType.number,
                            textEditingController: _homeDressingController
                                .serviceOriginalPriceController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: MyTextField(
                            hint: "₹2550",
                            label: "Service price",
                            textInputType: TextInputType.number,
                            textEditingController: _homeDressingController
                                .serviceOfferPriceController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _homeDressingController.isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            buttonName: widget.isUpdate
                                ? "Update Service"
                                : "Add Service",
                            onPress: validate,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  validate() {
    if (_homeDressingController.selectedFootService == null) {
      Utility.toast("please select foot service");
    } else if (_homeDressingController.selectedFootService ==
            FootServices.dressingService.index &&
        _homeDressingController.selectedDressingService == null) {
      Utility.toast("please select dressing service");
    } else if (_homeDressingController.serviceTitleController.text.isEmpty) {
      Utility.toast("please enter title");
    } else if (_homeDressingController
        .serviceDescriptionController.text.isEmpty) {
      Utility.toast("please enter description");
    } else if (_homeDressingController
        .serviceOfferPriceController.text.isEmpty) {
      Utility.toast("please enter offer price");
    } else if (_homeDressingController
        .serviceOriginalPriceController.text.isEmpty) {
      Utility.toast("please enter origin price");
    } else if (double.parse(
            _homeDressingController.serviceOriginalPriceController.text) <
        double.parse(
            _homeDressingController.serviceOfferPriceController.text)) {
      Utility.toast("Offer price should be lesser than original price");
    } else {
      if (!widget.isUpdate) {
        _homeDressingController.addNewService();
      } else {
        _homeDressingController.updateService(widget.homeDressingModel);
      }
    }
  }

  Future<void> pickFile() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((onValue) {
      _homeDressingController.pickedFile = onValue;
      _imagePath = onValue!.path;
      setState(() {});
    });
  }
}
