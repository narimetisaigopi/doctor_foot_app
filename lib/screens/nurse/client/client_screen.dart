import 'package:drfootapp/screens/dash_board/videos_screen_widgets/watch_now_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  bool showWoundCheck = false,
      showWoundSize = false,
      isStartTreatmentPressed = false;
  String selectedWoundCheck = "", selectedWoundSize = "";
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void updateSelection(String type, String value) {
    setState(() {
      if (type == "woundCheck") {
        selectedWoundCheck = value;
        showWoundCheck = true;
      } else {
        selectedWoundSize = value;
        showWoundSize = true;
      }
    });
  }

  Widget questionContainer(
      String question, List<String> options, String type, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteBgColor,
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Text(question,
                            style: const TextStyle(
                                color: AppColors.black2,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))
                        .tr()),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: options.map((option) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () => updateSelection(type, option),
                      child: CustomButton(
                        width: double.infinity,
                        buttonName: option,
                        borderRadius: 16,
                        bgColor: (type == "woundCheck"
                                    ? selectedWoundCheck
                                    : selectedWoundSize) ==
                                option
                            ? AppColors.primaryBlue
                            : AppColors.treatmentYesbg,
                        textColor: AppColors.black2,
                        onPress: () {},
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void showStartTreatmentDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "If no, Please upload the picture!",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black2),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _pickImage();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Image 1 :\nImage should be taken from the front which should reveal the entire ulcer wound along with the entire foot as shown in the example image.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black2),
              ),
              if (_image != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.file(
                    _image!,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined,
              color: AppColors.whiteBgColor),
          onPressed: () => Get.back(),
        ),
        backgroundColor: AppColors.primaryBlue,
        title: const Text("Client",
                style: TextStyle(
                    color: AppColors.whiteBgColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w700))
            .tr(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const WatchNowWidget(),
            const SizedBox(height: 12),
            questionContainer("Have you reached location safely?",
                ["Yes", "No"], "woundCheck", AssetsConstants.delivery_bike),
            if (!showWoundCheck)
              questionContainer("Is the wound same as displayed picture?",
                  ["Yes", "No"], "woundSize", AssetsConstants.delivery_bike),
            if (!showWoundSize) ...[
              questionContainer(
                "What is the size of the wound?",
                ["Small", "Med", "Large"],
                "woundSize",
                AssetsConstants.delivery_bike,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isStartTreatmentPressed = true;
                    });
                    showStartTreatmentDialog();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isStartTreatmentPressed
                          ? AppColors.primaryBlue
                          : AppColors.treatmentYesbg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "Start Treatment",
                      style: TextStyle(
                        color: isStartTreatmentPressed
                            ? Colors.white
                            : AppColors.black2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
