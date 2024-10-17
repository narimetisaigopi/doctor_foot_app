import 'package:drfootapp/screens/records/all_recent_images.dart';
import 'package:drfootapp/screens/records/all_recent_upload_images.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HealthRecordScreen extends StatefulWidget {
  const HealthRecordScreen({super.key});

  @override
  State<HealthRecordScreen> createState() => _HealthRecordScreenState();
}

class _HealthRecordScreenState extends State<HealthRecordScreen> {
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
          "Images",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
        actions: [
          InkWell(
            onTap: () {
              // Get.to(() => const RiskFactorScreen());
            },
            child: const Icon(
              Icons.search,
              color: AppColors.whiteBgColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(
            Icons.more_vert,
            color: AppColors.whiteBgColor,
            size: 24,
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteBgColor,
              ),
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recently Upload",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.imagesTextColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    AllRecentImages()
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AllRecentUploadImages(),
                    ],
                  ),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {
          pickImage();
          setState(() {});
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: AppColors.whiteBgColor,
          ),
        ),
      ),
    );
  }

  pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    xFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      customAlert(
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
    required VoidCallback upload,
  }) {
    return Alert(
      context: context,
      content: const Column(
        children: [
          Text(
            "Appointment Canceled",
            style: TextStyle(
              color: AppColors.cancelColor,
              fontSize: 20,
            ),
          ),
          Text(
            "You have canceled Your \nappointment",
            style: TextStyle(
              color: AppColors.black2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          CustomImage(
            path: AssetsConstants.appointment_cancel,
            height: 169,
            width: 223,
            fit: BoxFit.contain,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: upload,
          color: AppColors.cancelColor,
          child: const Text(
            "BacK to Home",
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
