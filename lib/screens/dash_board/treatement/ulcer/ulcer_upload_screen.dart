import 'dart:io';
import 'package:drfootapp/controllers/ulcer_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UlcerUploadScreen extends StatefulWidget {
  const UlcerUploadScreen({super.key});

  @override
  State<UlcerUploadScreen> createState() => _UlcerUploadScreenState();
}

class _UlcerUploadScreenState extends State<UlcerUploadScreen> {
  final UlcerController haveUlcerController = Get.put(UlcerController());
  XFile? xFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
            color: AppColors.whiteBgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Have Ulcer",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
      ),
      body: GetBuilder<UlcerController>(builder: (haveUlcerController) {
        return Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: AppColors.uploadBgColor1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      xFile != null
                          ? Container(
                              height: 250,
                              width: 228,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.contain,
                                image: FileImage(File(xFile!.path)),
                              )),
                            )
                          : Container(
                              height: 250,
                              width: 228,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: AppColors.grey,
                              )),
                              child: const Center(
                                child: Text(
                                  "No file here...",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "Document",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blackBold,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(Icons.keyboard_arrow_down_sharp)
                              ],
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: AppColors.whiteBgColor,
                                  child: Icon(
                                    Icons.add_to_photos,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    _pickImage();
                                    setState(() {});
                                  },
                                  child: const CircleAvatar(
                                    radius: 16,
                                    backgroundColor: AppColors.whiteBgColor,
                                    child: Icon(
                                      Icons.camera_alt,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: AppColors.whiteBgColor,
              ),
            ),
          ],
        );
      }),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(left: 32),
        child: CustomButton(
          width: double.infinity,
          buttonName: "Upload",
          bgColor: AppColors.primaryBlue,
        ),
      ),
    );
  }

  _pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    xFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      customAlert(
        title: 'Upload Successful',
        upload: () {
          Get.back();
          Get.back();
        },
      );
      setState(() {});
    } else {
      Utility.toast(
        "Image Not Picked",
      );
    }
  }

  Future<bool?> customAlert({
    required String title,
    required VoidCallback upload,
  }) {
    return Alert(
      context: context,
      title: title,
      content: const Column(
        children: [
          CustomImage(
            path: AssetsConstants.done_image,
            height: 169,
            width: 223,
          ),
          Text(
            "We will get back to you once our \nexperts review your ulcer",
            style: TextStyle(
              color: AppColors.black1,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: upload,
          color: AppColors.successColor,
          child: const Text(
            "Upload",
            style: TextStyle(
              color: AppColors.whiteBgColor,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ).show();
  }
}
