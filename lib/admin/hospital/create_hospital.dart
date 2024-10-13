import 'package:drfootapp/controllers/hospitals_controller.dart';
import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/models/hospital_model.dart';
import 'package:drfootapp/screens/maps/my_google_maps.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_circular_loader.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class CreateHospital extends StatefulWidget {
  final HospitalModel? hospitalModel;
  const CreateHospital({super.key, this.hospitalModel});

  @override
  State<CreateHospital> createState() => _CreateHospitalState();
}

class _CreateHospitalState extends State<CreateHospital> {
  HospitalsController hospitalController = Get.put(HospitalsController());
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() {
    if (widget.hospitalModel != null) {
      hospitalController.titleTextEditingController.text =
          widget.hospitalModel!.title;
      hospitalController.addressTextEditingController.text =
          widget.hospitalModel!.address;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HospitalsController>(builder: (hospitalController) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.hospitalModel != null
              ? "Update Hospital"
              : "Create Hospital"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  InkWell(
                    onTap: hospitalController.pickFile,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: hospitalController.xFile != null
                          ? Image.network(hospitalController.xFile!.path)
                          : widget.hospitalModel != null
                              ? CustomNetworkImageWidget(
                                  path: widget.hospitalModel!.image)
                              : const Icon(Icons.image),
                    ),
                  ),
                  TextButton(
                      onPressed: hospitalController.pickFile,
                      child: const Text("Pick image")),
                  MyTextField(
                    hint: "Title",
                    textEditingController:
                        hospitalController.titleTextEditingController,
                    maxLength: 1000,
                    textInputType: TextInputType.text,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                  ),
                  MyTextField(
                    onPress: () async {},
                    maxLines: 3,
                    maxLength: 3000,
                    enabled: true,
                    textInputType: TextInputType.text,
                    label: "",
                    suffixIcon: const Icon(Icons.location_on_outlined,
                        color: Colors.black, size: 30),
                    suffixIconPressed: () async {
                      LocationController locationController =
                          Get.put(LocationController());
                      await Get.to(() => const MyGoogleMapsScreen());
                      locationController
                          .getAddressForCurrentLocation(
                              locationController.selectedLatLng!)
                          .then((value) {
                        hospitalController.addressTextEditingController.text =
                            value;
                      });
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    hint: 'Address',
                    textEditingController:
                        hospitalController.addressTextEditingController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  submitButton(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget submitButton() {
    return hospitalController.isLoading
        ? const CustomCircularLoader()
        : CustomButton(
            onPress: () async {
              bool status = _formKey.currentState!.saveAndValidate();
              if (status) {
                if (widget.hospitalModel == null &&
                    hospitalController.xFile == null) {
                  Utility.toast("select image");
                } else {
                  Utility.showAlertDialogger(
                      yes: () async {
                        Get.back();
                        hospitalController.createHospital(
                            hospitalModel: widget.hospitalModel);
                      },
                      no: () {
                        Get.back();
                      },
                      context: context);
                }
              }
            },
            buttonName: widget.hospitalModel != null ? "Update" : "Create",
          );
  }
}
