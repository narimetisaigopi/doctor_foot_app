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
  final Color btnColor;
  final Color bgColor;
  final Color iconColor;
  final bool labelNeeded;
  final bool textButtonNeeded;
  final Widget? textButton;
  final Widget? leadingIcon;
  final bool iconNeeded;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? suffixIconPressed;
  final Widget? trailingIcon;
  final TextEditingController textEditingController;
  final Function()? onPress;
  final Function()? onValidate;
  final Function(String?)? onSubmited;
  final TextInputType textInputType;
  final int maxLines;
  final int minLines;
  final int maxLength;
  final bool editText;
  final bool enabled;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;

  const MyTextField(
      {super.key,
      required this.hint,
      this.textButton,
      this.textButtonNeeded = false,
      required this.textEditingController,
      this.bgColor = Colors.transparent,
      this.label = "",
      this.edit = "",
      this.onChanged,
      this.minLines = 1,
      this.maxLines = 1,
      this.prefixIcon,
      this.labelNeeded = false,
      this.borderRadius = 12,
      this.maxLength = 100,
      this.btnColor = Colors.black,
      this.iconColor = Colors.black,
      this.textInputType = TextInputType.text,
      this.onPress,
      this.onValidate,
      this.iconNeeded = false,
      this.enabled = true,
      this.leadingIcon,
      this.trailingIcon = const Icon(Icons.arrow_forward),
      this.editText = true,
      this.suffixIcon,
      this.suffixIconPressed,
      this.validator,
      this.onSubmited,
      this.inputFormatters,
      this.autovalidateMode});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      child: Column(
        children: [
          widget.labelNeeded ? label() : Container(),
          textFieldWidget(),
        ],
      ),
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
    String name = widget.label;
    if (name.isEmpty) {
      name = widget.hint;
    }
    return FormBuilderTextField(
      name: name,
      onTap: () {},
      enabled: widget.enabled,
      minLines: widget.minLines,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      maxLines: widget.maxLines,
      onSubmitted: widget.onSubmited,
      maxLength: widget.maxLength,
      keyboardType: widget.textInputType,
      controller: widget.textEditingController,
      inputFormatters: widget.inputFormatters ??
          (widget.textInputType == TextInputType.number ||
              widget.textInputType == TextInputType.phone
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ]
              : null),
      onChanged: widget.onChanged,
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
          suffixIcon: widget.suffixIcon != null
              ? InkWell(
                  onTap: widget.suffixIconPressed, child: widget.suffixIcon)
              : null,
          prefix: widget.prefixIcon != null
              ? InkWell(onTap: () {}, child: widget.prefixIcon)
              : null,
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
