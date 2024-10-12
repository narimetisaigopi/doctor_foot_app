import 'package:drfootapp/controllers/doctors_controller.dart';
import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/models/doctor_model.dart';
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

class CreateDoctor extends StatefulWidget {
  final DoctorModel? doctorModel;
  const CreateDoctor({super.key, this.doctorModel});

  @override
  State<CreateDoctor> createState() => _CreateDoctorState();
}

class _CreateDoctorState extends State<CreateDoctor> {
  DoctorsController doctorsController = Get.put(DoctorsController());
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() {
    if (widget.doctorModel != null) {
      doctorsController.titleTextEditingController.text =
          widget.doctorModel!.title;
      doctorsController.addressTextEditingController.text =
          widget.doctorModel!.address;
      doctorsController.nameTextEditingController.text =
          widget.doctorModel!.name;
      doctorsController.mobileNumberTextEditingController.text =
          widget.doctorModel!.mobileNumber;
      doctorsController.emailTextEditingController.text =
          widget.doctorModel!.email;
      doctorsController.aboutTextEditingController.text =
          widget.doctorModel!.about;
      doctorsController.yearsOfExperienceTextEditingController.text =
          widget.doctorModel!.yearsOfExperiance.toString();
      doctorsController.actualPriceTextEditingController.text =
          widget.doctorModel!.actualPrice.toString();
      doctorsController.offerPriceTextEditingController.text =
          widget.doctorModel!.offerPrice.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorsController>(builder: (doctorsController) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
              widget.doctorModel != null ? "Update Doctor" : "Create Doctor"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  // Image Picker
                  InkWell(
                    onTap: doctorsController.pickFile,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: doctorsController.xFile != null
                          ? Image.network(doctorsController.xFile!.path)
                          : widget.doctorModel != null
                              ? CustomNetworkImageWidget(
                                  path: widget.doctorModel!.image)
                              : const Icon(Icons.image),
                    ),
                  ),
                  TextButton(
                      onPressed: doctorsController.pickFile,
                      child: const Text("Pick image")),

                  // Name
                  MyTextField(
                    hint: "Name",
                    textEditingController:
                        doctorsController.nameTextEditingController,
                    textInputType: TextInputType.text,
                    validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()],
                    ),
                  ),
                  
                  // Mobile Number
                  MyTextField(
                    hint: "Mobile Number",
                    textEditingController:
                        doctorsController.mobileNumberTextEditingController,
                    textInputType: TextInputType.phone,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.maxLength(10),
                    ]),
                  ),
                  
                  // Email
                  MyTextField(
                    hint: "Email",
                    textEditingController:
                        doctorsController.emailTextEditingController,
                    textInputType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),

                  // Title
                  MyTextField(
                    hint: "Title",
                    textEditingController:
                        doctorsController.titleTextEditingController,
                    maxLength: 1000,
                    textInputType: TextInputType.text,
                    validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()],
                    ),
                  ),
                  
                  // Address
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
                        doctorsController.addressTextEditingController.text =
                            value;
                      });
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    hint: 'Address',
                    textEditingController:
                        doctorsController.addressTextEditingController,
                  ),

                  // About
                  MyTextField(
                    hint: "About",
                    textEditingController:
                        doctorsController.aboutTextEditingController,
                    maxLength: 1000,
                    textInputType: TextInputType.text,
                    validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()],
                    ),
                  ),

                  // Years of Experience
                  MyTextField(
                    hint: "Years of Experience",
                    textEditingController:
                        doctorsController.yearsOfExperienceTextEditingController,
                    textInputType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),

                  // Actual Price
                  MyTextField(
                    hint: "Actual Price",
                    textEditingController:
                        doctorsController.actualPriceTextEditingController,
                    textInputType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                  
                  // Offer Price
                  MyTextField(
                    hint: "Offer Price",
                    textEditingController:
                        doctorsController.offerPriceTextEditingController,
                    textInputType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),

                  const SizedBox(height: 10),
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
    return doctorsController.isLoading
        ? const CustomCircularLoader()
        : CustomButton(
            onPress: () async {
              bool status = _formKey.currentState!.saveAndValidate();
              if (status) {
                if (widget.doctorModel == null &&
                    doctorsController.xFile == null) {
                  Utility.toast("select image");
                } else {
                  Utility.showAlertDialogger(
                      yes: () async {
                        Get.back();
                        doctorsController.createDoctor(
                            doctorModel: widget.doctorModel);
                      },
                      no: () {
                        Navigator.pop(context);
                        Get.back();
                      },
                      context: context);
                }
              }
            },
            buttonName: widget.doctorModel != null ? "Update" : "Create",
          );
  }
}

