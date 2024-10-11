import 'dart:io';

import 'package:drfootapp/models/user_model.dart';
import 'package:drfootapp/screens/treatement/image_view_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HowToUploadImage extends StatefulWidget {
  final String image;
  final String nametext;
  final String descriptiontext;
  const HowToUploadImage({
    super.key,
    required this.image,
    required this.nametext,
    required this.descriptiontext,
  });

  @override
  State<HowToUploadImage> createState() => _HowToUploadImageState();
}

class _HowToUploadImageState extends State<HowToUploadImage> {
  XFile? xFile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
            child: Card(
              color: AppColors.bggrey,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 4),
                child: Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: InkWell(
                            onTap: () {
                              _pickImage();
                              setState(() {});
                            },
                            child: xFile != null
                                ? Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: FileImage(File(xFile!.path)),
                                    )),
                                  )
                                : CustomImage(
                                    path: widget.image,
                                    height: 116,
                                    width: 90,
                                    fit: BoxFit.contain,
                                  ))),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nametext,
                              style: const TextStyle(
                                  color: AppColors.black1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              widget.descriptiontext,
                              style: const TextStyle(
                                color: AppColors.black3,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    UserModel userModel = UserModel();

    xFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      Get.to(() => ImageViewScreen(
            userModel: userModel,
          ));
      setState(() {});
    } else {
      Utility.toast(
        "Image Not Picked",
      );
    }
  }
}
