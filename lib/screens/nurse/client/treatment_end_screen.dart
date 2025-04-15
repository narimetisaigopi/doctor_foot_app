import 'package:drfootapp/screens/nurse/billing_details/bill_checker_screen.dart';
import 'package:drfootapp/screens/nurse/billing_details/count_down_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/bottom_sheet_drag_icon.dart';
import 'package:drfootapp/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TreatmentEndScreen extends StatefulWidget {
  const TreatmentEndScreen({super.key});

  @override
  State<TreatmentEndScreen> createState() => _TreatmentEndScreenState();
}

class _TreatmentEndScreenState extends State<TreatmentEndScreen> {
  late Size size;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppbar(title: "TreatmentEndScreen"),
      body: Column(
        children: [
          Image.asset(
            AssetsConstants.treatmentEnd,
            width: double.infinity,
            fit: BoxFit.cover,
            height: size.height / 3,
          ),
          layout()
        ],
      ),
    );
  }

  Widget layout() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BottomSheetDragIcon(),
          const Text(
            "Treatment have been started",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.blackBold,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CountDownWidget(),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              AssetsConstants.treatmentEnd,
              width: double.infinity,
              height: size.height / 4,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SlideAction(
            elevation: 10,
            borderRadius: 0,
            height: 50,

            // sliderButtonIconPadding: 10,
            innerColor: AppColors.slideBtnColor,
            outerColor: AppColors.primaryBlue,
            text: "Completed",
            onSubmit: () async {
              takeCompletePhoto();
            },
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteBgColor,
            ),
          ),
        ],
      ),
    );
  }

  takeCompletePhoto() {
    Utility.stateAlertDialog(
        context: context,
        title: 'Upload Successful',
        description: "",
        buttonText: "Done",
        image: AssetsConstants.done_image,
        color: AppColors.successColor,
        onDone: () async {
          Get.back();
          XFile? xFile =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (xFile != null) {
            uploadedSuccessfully();
          }
        });
  }

  uploadedSuccessfully() {
    Utility.stateAlertDialog(
        context: context,
        title: 'Upload Successful',
        description: "",
        buttonText: "Done",
        image: AssetsConstants.done_image,
        color: AppColors.successColor,
        onDone: () async {
          Get.back();
          Get.to(() => const BillCheckerScreen());
        });
  }
}
