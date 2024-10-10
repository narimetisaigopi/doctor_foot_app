import 'package:drfootapp/screens/treatement/how_to_upload_image_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_Image.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UlcerNoScreen extends StatefulWidget {
  const UlcerNoScreen({super.key});

  @override
  State<UlcerNoScreen> createState() => _UlcerNoScreenState();
}

class _UlcerNoScreenState extends State<UlcerNoScreen> {
  XFile? xFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                    )),
                const Text(
                  'UPLOAD YOUR ULCER PICTURE',
                  style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
                child: CustomImage(
              path: AssetsConstants.treatement_no,
              height: 156,
              width: 156,
              fit: BoxFit.contain,
            )),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                "We are requesting you to upload your \nulcer picture so that experts can \nprovide a suitable remedy",
                style: TextStyle(
                  color: AppColors.black2,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: CustomButton(
                width: 150,
                borderRadius: 16,
                buttonName: "Next",
                bgColor: AppColors.primaryBlue,
                textColor: AppColors.whiteBgColor,
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
            )
          ],
        ),
      ),
    );
  }

  pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    xFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      Utility.toast("Image  Picked");

      setState(() {});
    } else {
      Utility.toast(
        "Image Not Picked",
      );
    }
  }
}
