import 'package:drfootapp/controllers/nurse/nurse_auth_controller.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/constants/string_constants.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:path/path.dart';
import 'work_experience_picker.dart';

class NurseSignupFormComponent extends StatefulWidget {
  final String type;
  final bool showBorder;
  const NurseSignupFormComponent(
      {super.key, required this.type, this.showBorder = true});

  @override
  State<NurseSignupFormComponent> createState() =>
      _NurseSignupFormComponentState();
}

class _NurseSignupFormComponentState extends State<NurseSignupFormComponent> {
  final NurseAuthController _nurseAuthController =
      Get.put(NurseAuthController());
  final _formKey = GlobalKey<FormBuilderState>();

  printData() {
    logger(
        "_nurseAuthController ${_nurseAuthController.partnerEducationDetailsMap.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NurseAuthController>(builder: (nurseAuthController) {
      return FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              widget.type,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black1,
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              labelNeeded: true,
              label: Strings.collegeTextFieldLabel,
              hint: Strings.collegeTextFieldHint,
              textEditingController:
                  _nurseAuthController.collegeUnisersityController,
              onChanged: (p0) {
                _nurseAuthController.partnerEducationDetailsMap[widget.type]
                    ["college"] = p0 ?? "";
                printData();
                return p0;
              },
            ),
            MyTextField(
              labelNeeded: true,
              label: Strings.yearTextFieldLabel,
              hint: Strings.yearTextFieldHint,
              textEditingController:
                  _nurseAuthController.yearofCompletionController,
              onChanged: (p0) {
                _nurseAuthController.partnerEducationDetailsMap[widget.type]
                    ["educationCompletion"] = p0 ?? "";
                printData();
                return p0;
              },
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  Strings.WorkExp,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ).tr(),
              ),
            ),
            const SizedBox(height: 6),
            WorkExperiencePicker(
              onChanged: (year, month) {
                _nurseAuthController.partnerEducationDetailsMap[widget.type]
                    ["year"] = year;
                _nurseAuthController.partnerEducationDetailsMap[widget.type]
                    ["month"] = month;
                printData();
              },
            ),
            const SizedBox(height: 6),
            MyTextField(
              labelNeeded: true,
              label: Strings.DegreeCertiTextFieldLabel,
              hint: Strings.DegreeCertiTextFieldHint,
              textEditingController: _nurseAuthController.degreeCertiController,
              suffixIcon: GestureDetector(
                  onTap: () async {
                    filePicker.FilePickerResult? result =
                        await filePicker.FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: filePicker.FileType.custom,
                            allowedExtensions: ["pdf", "png", "jpg", "jpeg"]);
                    if (result != null && result.paths.isNotEmpty) {
                      _nurseAuthController
                              .partnerEducationDetailsMap[widget.type]
                          ["documentPath"] = result.paths.first;
                      _nurseAuthController.degreeCertiController.text =
                          basename(result.paths.first ?? "");
                      setState(() {});
                    }
                    printData();
                  },
                  child: const Icon(Icons.upload)),
              onChanged: (p0) {
                return p0;
              },
            ),
            if (widget.showBorder)
              const Column(
                children: [
                  SizedBox(height: 20),
                  Divider(
                    color: AppColors.bottomSheetBackgroundColor,
                    thickness: 1,
                    endIndent: 0.2,
                  ),
                ],
              ),
          ],
        ),
      );
    });
  }
}
