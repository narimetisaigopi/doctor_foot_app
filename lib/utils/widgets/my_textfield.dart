// ignore_for_file: always_specify_types

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
  // final IconButton? icon;
  final Widget? leadingIcon;
  final bool iconNeeded;
  final Icon trailingIcon;
  final TextEditingController textEditingController;
  final Function()? onPress;
  final Function()? validate;
  final TextInputType textInputType;
  final int maxLines;
  // final int minLines;
  const MyTextField({
    super.key,
    this.bgColor = Colors.white,
    this.label = "label",
    this.maxLines = 1,
    this.labelNeeded = true,
    this.borderRadius = 5,
    // this.minLines = 1,
    // this.maxLength = 10,
    this.btnColor = Colors.black,
    this.iconColor = Colors.black,
    required this.hint,
    // this.icon,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
    this.onPress,
    this.validate,
    this.iconNeeded = false,
    this.leadingIcon,
    this.trailingIcon = const Icon(Icons.arrow_forward),
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.labelNeeded ? label() : SizedBox.shrink(),
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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget textFieldWidget() {
    return Container(
      height: 50,
      // height: MediaQuery.of(context).size.height / 15,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      //height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
          border: Border.all(color: Colors.grey.shade300)
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade300,
          //     offset: const Offset(0, 0),
          //     blurRadius: 10,
          //     // spreadRadius: 5,
          //   ),
          // ],
          ),
      child: TextFormField(
        // textDirection: BoxDecoration(),
        validator: FormBuilderValidators.compose([
          /// Makes this field required
          FormBuilderValidators.required(),

          /// Ensures the value entered is numeric - with a custom error message
          FormBuilderValidators.numeric(
              errorText: 'La edad debe ser numérica.'),

          /// Sets a maximum value of 70
          FormBuilderValidators.max(70),

          /// Include your own custom `FormFieldValidator` function, if you want
          /// Ensures positive values only. We could also have used `FormBuilderValidators.min(0)` instead
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
            hintText: widget.hint,
            hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal),
            fillColor: widget.bgColor,
            filled: true,
            prefixIcon: widget.leadingIcon,
            suffixIcon: widget.iconNeeded
                ? IconButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 20)),
                      // backgroundColor:
                      //     MaterialStatePropertyAll(widget.btnColor),
                    ),
                    onPressed: widget.onPress,
                    icon: widget.trailingIcon,
                    color: widget.iconColor,
                  )
                : null,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(widget.borderRadius)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(
                  color: Colors.black,
                ))),
      ),
    );
  }
}
