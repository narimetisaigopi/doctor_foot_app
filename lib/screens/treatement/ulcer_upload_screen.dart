import 'dart:io';
import 'package:drfootapp/screens/treatement/how_to_upload_image_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
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
      body: Column(
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
                            child: Center(
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
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
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
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: AppColors.whiteBgColor,
                                child: Icon(
                                  Icons.add_to_photos,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  _pickImage();
                                  setState(() {});
                                },
                                child: CircleAvatar(
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
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: CustomButton(
          width: double.infinity,
          buttonName: "Upload",
          bgColor: AppColors.primaryBlue,
          onPress: () {
            Get.defaultDialog(
                title: "",
                content: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Text(
                            "How To Upload Ulcer Picture",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.black1,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.close,
                              color: AppColors.primaryBlue,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const HowToUploadImage(
                      image: AssetsConstants.how_to_upload_1,
                      nametext: 'Image 1 :',
                      descriptiontext:
                          'Image should be taken from the front which should revile the entire ulcer wound along with entire foot as shown in the example image. ',
                    ),
                    const HowToUploadImage(
                      image: AssetsConstants.how_to_upload_2,
                      nametext: 'Image 2 :',
                      descriptiontext:
                          'Image should be taken from the top which should revile the depth of the ulcer as shown in the example image. ',
                    ),
                    const HowToUploadImage(
                      image: AssetsConstants.how_to_upload_3,
                      nametext: 'Image 3 :',
                      descriptiontext:
                          'Image should be taken from side to locate the place of the ulcer on the feet as shown in the example image. ',
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  _pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    xFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      customAlert(
        title: ' Upload Successful',
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
      type: AlertType.success,
      buttons: [
        DialogButton(
          onPressed: upload,
          color: AppColors.greenColor,
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
