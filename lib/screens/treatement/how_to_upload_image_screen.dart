import 'dart:io';

import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HowToUploadImage extends StatefulWidget {
  final String image;
  final String nametext;
  final String descriptiontext;
  const HowToUploadImage(
      {super.key,
      this.image = "",
      this.nametext = "",
      this.descriptiontext = ""});

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
                padding: const EdgeInsets.only(left: 4,right: 4,top: 8,bottom: 4),
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
                               :const  CircleAvatar(radius: 40,)
                              
                        )
                        // SvgImageWidget(
                        //   path: widget.image,
                        //   height: 108,
                        //   width: double.infinity,
                        // ),
                        ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "image 2",
                              //widget.nametext,
                              style: TextStyle(
                                  color: AppColors.black1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Image should be taken from the front which should revile the entire ulcer wound along with entire foot as shown in the example image. ",
                              // widget.descriptiontext,
                              style: TextStyle(
                                  color: AppColors.black3,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
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

    xFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
             Utility.toast("Image  Picked",);
      setState(() {});
    } else {
             Utility.toast("Image Not Picked",);
    }
  }
}