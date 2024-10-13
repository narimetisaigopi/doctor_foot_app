import 'package:drfootapp/controllers/banners_controller.dart';
import 'package:drfootapp/models/banner_model.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_circular_loader.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CreateBanner extends StatefulWidget {
  final BannerModel? bannerModel;
  const CreateBanner({super.key, this.bannerModel});

  @override
  State<CreateBanner> createState() => _CreateBannerState();
}

class _CreateBannerState extends State<CreateBanner> {
  BannersController bannerController = Get.put(BannersController());
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    if (widget.bannerModel != null) {
      bannerController.descriptionTextEditingController.text =
          widget.bannerModel!.descrition;
      bannerController.navigationLinkTextEditingController.text =
          widget.bannerModel!.navigationLink;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannersController>(builder: (bannerController) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
              widget.bannerModel != null ? "Update Banner" : "Create Banner"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  // Image Picker Field
                  InkWell(
                    onTap: bannerController.pickFile,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: bannerController.xFile != null
                          ? Image.network(bannerController.xFile!.path)
                          : widget.bannerModel != null
                              ? CustomNetworkImageWidget(
                                  path: widget.bannerModel!.image)
                              : const Icon(Icons.image),
                    ),
                  ),
                  TextButton(
                      onPressed: bannerController.pickFile,
                      child: const Text("Pick Image")),

                  // Description Field
                  MyTextField(
                    hint: "Description",
                    textEditingController:
                        bannerController.descriptionTextEditingController,
                    maxLength: 1000,
                    textInputType: TextInputType.text,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(10),
                      ],
                    ),
                  ),

                  // Navigation Link Field
                  MyTextField(
                    hint: "Navigation Link",
                    textEditingController:
                        bannerController.navigationLinkTextEditingController,
                    maxLength: 2000,
                    textInputType: TextInputType.url,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.url(),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Submit Button
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
    return bannerController.isLoading
        ? const CustomCircularLoader()
        : CustomButton(
            onPress: () async {
              bool status = _formKey.currentState!.saveAndValidate();
              if (status) {
                if (widget.bannerModel == null &&
                    bannerController.xFile == null) {
                  Utility.toast("Select an image");
                } else {
                  Utility.showAlertDialogger(
                      yes: () async {
                        Get.back();
                        bannerController.createBanner(
                          bannerModel: widget.bannerModel,
                        );
                      },
                      no: () {
                        Get.back();
                      },
                      context: context);
                }
              }
            },
            buttonName: widget.bannerModel != null ? "Update" : "Create",
          );
  }
}
