// ignore_for_file: always_specify_types
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MyTextField extends StatefulWidget {
  final String hint;
  final String label;
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
  final Icon trailingIcon;
  final TextEditingController textEditingController;
  final Function()? onPress;
  final Function()? onValidate;
  final TextInputType textInputType;
  final int maxLines;
  // final int minLines;
  const MyTextField({
    super.key,
    required this.hint,
    this.textButton,
    this.textButtonNeeded = false,
    required this.textEditingController,
    this.bgColor = Colors.transparent,
    this.label = "label",
    this.maxLines = 1,
    this.labelNeeded = true,
    this.borderRadius = 5,
    // this.minLines = 1,
    // this.maxLength = 10,
    this.btnColor = Colors.black,
    this.iconColor = Colors.black,
    // this.icon,
    this.textInputType = TextInputType.text,
    this.onPress,
    this.onValidate,
    this.iconNeeded = false,
    this.leadingIcon,
    this.trailingIcon = const Icon(Icons.search),
  });

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
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ).tr(),
      ),
    );
  }

  Widget textFieldWidget() {
    return Container(
      height: 50,
      padding: EdgeInsets.zero,
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 20,
      // ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
          border: Border.all(color: Colors.grey.shade300)),
      child: TextFormField(
        onTap: () {},

        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.numeric(
              errorText: 'La edad debe ser numérica.'),
          FormBuilderValidators.max(70),
          (val) {
            final number = int.tryParse(val!);
            if (number == null) return null;
            if (number < 0) return 'We cannot have a negative age';
            return null;
          },
        ]),
        // expands: true,
        // minLines: null,
        maxLines: widget.maxLines,
        // maxLength: widget.maxLength,
        keyboardType: widget.textInputType,
        controller: widget.textEditingController,
        inputFormatters: widget.textInputType == TextInputType.number
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
            suffixIcon: widget.iconNeeded
                ? (widget.textButtonNeeded
                    ? null
                    : IconButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 20)),
                        ),
                        onPressed: widget.onPress,
                        icon: widget.trailingIcon,
                        color: widget.iconColor,
                      ))
                : null,
            suffix: widget.textButtonNeeded ? widget.textButton : null,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(widget.borderRadius)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: AppColors.primary))),
      ),
    );
  }
}
