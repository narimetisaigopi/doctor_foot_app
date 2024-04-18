// ignore_for_file: always_specify_types
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../constants/app_colors.dart';

class MyTextField extends StatefulWidget {
  final String hint;
  final String label;
  final String edit;
  final double borderRadius;
  // final int maxLength;
  final Color btnColor;
  final Color bgColor;
  final Color iconColor;
  final bool labelNeeded;
  final bool textButtonNeeded;
  final Widget? textButton;
  // final IconButton? icon;
  final Widget? leadingIcon;
  final bool iconNeeded;
  final Widget? suffixIcon;
  final Widget? trailingIcon;
  final TextEditingController textEditingController;
  final Function()? onPress;
  final Function()? onValidate;
  final Function(String?)? onSubmited;
  final TextInputType textInputType;
  final int maxLines;
  final int maxLength;
  // final int minLines;
  final bool editText;
  final bool enabled;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  const MyTextField(
      {super.key,
      required this.hint,
      this.textButton,
      this.textButtonNeeded = false,
      required this.textEditingController,
      this.bgColor = Colors.transparent,
      this.label = "label",
      this.edit = "",
      this.maxLines = 1,
      this.labelNeeded = true,
      this.borderRadius = 5,
      // this.minLines = 1,
      this.maxLength = 100,
      this.btnColor = Colors.black,
      this.iconColor = Colors.black,
      // this.icon,
      this.textInputType = TextInputType.text,
      this.onPress,
      this.onValidate,
      this.iconNeeded = false,
      this.enabled = true,
      this.leadingIcon,
      this.trailingIcon = const Icon(Icons.arrow_forward),
      this.editText = true,
      this.suffixIcon,
      this.validator,
      this.onSubmited,
      this.autovalidateMode});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.labelNeeded ? label() : const SizedBox.shrink(),
        textFieldWidget(),
      ],
    );
  }

  Align label() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ).tr(),
            Text(
              widget.edit,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ).tr(),
          ],
        ),
      ),
    );
  }

  Widget textFieldWidget() {
    return FormBuilderTextField(
      name: widget.label,
      onTap: () {},
      enabled: widget.enabled,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      maxLines: widget.maxLines,
      onSubmitted: widget.onSubmited,
      maxLength: widget.maxLength,
      keyboardType: widget.textInputType,
      controller: widget.textEditingController,
      inputFormatters: widget.textInputType == TextInputType.number ||
              widget.textInputType == TextInputType.phone
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ]
          : null,
      decoration: InputDecoration(
          counterStyle: const TextStyle(
            height: double.minPositive,
          ),
          counterText: "",
          focusColor: AppColors.bottomSheetBackgroundColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          hintText: widget.hint,
          hintStyle: const TextStyle(
              color: AppColors.greyTextColor,
              fontSize: 15,
              fontWeight: FontWeight.normal),
          fillColor: widget.bgColor,
          filled: true,
          prefixIcon: widget.leadingIcon,
          suffixIcon:
              widget.iconNeeded ? widget.suffixIcon : const SizedBox.shrink(),
          suffix: widget.textButtonNeeded ? widget.textButton : null,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColors.grey2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColors.primary))),
    );
  }
}
