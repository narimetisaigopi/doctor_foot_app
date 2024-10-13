import 'package:drfootapp/screens/records/all_recent_images.dart';
import 'package:drfootapp/screens/records/all_recent_upload_images.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
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
        actions: const [
          Icon(
            Icons.search,
            color: AppColors.whiteBgColor,
            size: 24,
          ),
          SizedBox(width: 6),
          Icon(
            Icons.more_vert,
            color: AppColors.whiteBgColor,
            size: 24,
          ),
          SizedBox(width: 6),
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
                    children: [AllRecentUploadImages()],
                  ),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {
          _pickImage();
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

  _pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    xFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      customAlert(
        title: ' Upload Successful',
        upload: () {
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
