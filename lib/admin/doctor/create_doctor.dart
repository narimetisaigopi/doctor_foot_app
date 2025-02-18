import 'package:drfootapp/controllers/doctors_controller.dart';
import 'package:drfootapp/controllers/hospitals_controller.dart';
import 'package:drfootapp/controllers/location_controller.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/models/hospital_model.dart';
import 'package:drfootapp/screens/maps/my_google_maps.dart';
import 'package:drfootapp/screens/maps/my_google_maps_copu.dart';
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

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() {
    if (widget.doctorModel != null) {
      doctorsController.educationTextEditingController.text =
          widget.doctorModel!.education;
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
              key: doctorsController.formKey,
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
                  GetBuilder<HospitalsController>(initState: (state) {
                    Get.put(HospitalsController()).fetchHospitals();
                  }, builder: (hospitalsController) {
                    return DropdownButtonFormField<HospitalModel>(
                      value: doctorsController.selectedHospitalModel,
                      decoration:
                          const InputDecoration(labelText: "Select Hospital"),
                      items: hospitalsController.hospitalList.map((hospital) {
                        return DropdownMenuItem<HospitalModel>(
                          value: hospital,
                          child: Text(hospital.title),
                        );
                      }).toList(),
                      onChanged: (HospitalModel? value) {
                        setState(() {
                          doctorsController.selectedHospitalModel = value;
                        });
                      },
                      validator: FormBuilderValidators.required(),
                    );
                  }),
                  // Name
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: MyTextField(
                          hint: "Name",
                          textEditingController:
                              doctorsController.nameTextEditingController,
                          textInputType: TextInputType.text,
                          validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: MyTextField(
                          hint: "Education",
                          textEditingController:
                              doctorsController.educationTextEditingController,
                          textInputType: TextInputType.text,
                          validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: MyTextField(
                          hint: "Mobile Number",
                          enabled: widget.doctorModel == null,
                          textEditingController: doctorsController
                              .mobileNumberTextEditingController,
                          textInputType: TextInputType.phone,
                          maxLength: 10,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.maxLength(10),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 5,
                        child: MyTextField(
                          hint: "Email",
                          enabled: widget.doctorModel == null,
                          textEditingController:
                              doctorsController.emailTextEditingController,
                          textInputType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  // Address
                  MyTextField(
                    onPress: () async {},
                    minLines: 2,
                    maxLines: 3,
                    maxLength: 3000,
                    enabled: true,
                    textInputType: TextInputType.multiline,
                    label: "",
                    suffixIcon: const Icon(Icons.location_on_outlined,
                        color: Colors.black, size: 30),
                    suffixIconPressed: () async {
                      LocationController locationController =
                          Get.put(LocationController());
                      await Get.to(() => const MyGoogleMap());
                      // locationController
                      //     .getAddressForCurrentLocation(
                      //         locationController.selectedLatLng!)
                      //     .then((value) {
                      //   doctorsController.addressTextEditingController.text =
                      //       value;
                      // });
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    hint: 'Address',
                    textEditingController:
                        doctorsController.addressTextEditingController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: MyTextField(
                          hint: "Actual Price",
                          textEditingController: doctorsController
                              .actualPriceTextEditingController,
                          textInputType: TextInputType.number,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // Offer Price
                      Expanded(
                        flex: 5,
                        child: MyTextField(
                          hint: "Offer Price",
                          textEditingController:
                              doctorsController.offerPriceTextEditingController,
                          textInputType: TextInputType.number,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: MyTextField(
                          hint: "Years of Experience",
                          textEditingController: doctorsController
                              .yearsOfExperienceTextEditingController,
                          textInputType: TextInputType.number,
                          maxLength: 2,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 8,
                        child: MyTextField(
                          hint: "About",
                          textEditingController:
                              doctorsController.aboutTextEditingController,
                          maxLength: 1000,
                          minLines: 3,
                          maxLines: 10,
                          textInputType: TextInputType.multiline,
                          validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()],
                          ),
                        ),
                      ),
                    ],
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
              bool status =
                  doctorsController.formKey.currentState!.saveAndValidate();
              if (status) {
                if (widget.doctorModel == null &&
                    doctorsController.xFile == null) {
                  Utility.toast("select image");
                } else if (doctorsController.selectedHospitalModel == null) {
                  Utility.toast("select hospital");
                } else {
                  Utility.showAlertDialogger(
                      yes: () async {
                        Get.back();
                        doctorsController.createDoctor(
                            doctorModel: widget.doctorModel);
                      },
                      no: () {
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
