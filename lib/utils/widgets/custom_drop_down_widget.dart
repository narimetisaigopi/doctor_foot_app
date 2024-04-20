import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomDropDownWidget extends StatefulWidget {
  final String hint;
  final List<DropdownMenuItem<String>> menuItems;
  final Function(String?) onChanged;
  final String Function(String?)? onValidate;
  final String errorMessage;
  const CustomDropDownWidget(
      {required this.hint,
      required this.menuItems,
      required this.onChanged,
      this.errorMessage = "",
      this.onValidate,
      super.key});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: FormBuilderDropdown(
        decoration: InputDecoration(
            hintStyle: const TextStyle(color: AppColors.grey2),
            hintText: widget.hint,
            focusedBorder: InputBorder.none,
            focusColor: AppColors.whiteBgColor,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: const OutlineInputBorder()),
        name: widget.hint,
        icon: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.blackBold,
          ),
        ),
        onChanged: (value) {
          widget.onChanged(value ?? "");
        },
        items: widget.menuItems,
        validator: (value) {
          // if (widget.errorMessage.isEmpty &&
          //     value != null &&
          //     value.isNotEmpty) {
          //   return "Requied";
          // }
          return null;
        },
      ),
    );
  }
}
