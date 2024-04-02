import 'package:doctor_foot_app/controllers/authentication_controller.dart';
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  String? selectedName;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: FormBuilderDropdown(
        decoration: const InputDecoration(
          focusedBorder: InputBorder.none,
          focusColor: AppColors.whiteBgColor,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: OutlineInputBorder()
        ),
        name: "Dropdown",
        icon: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.blackBold,
          ),
        ),
        items: bloodGroupList
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: (value) {
          setState(() {
            _authenticationController.bloodGroupController.text = value!;
          });
        },
      ),
    );
  }
}
