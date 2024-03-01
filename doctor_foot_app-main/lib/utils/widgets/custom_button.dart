// ignore: file_names
import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String btnName;
  final double width;
  final double borderRadius;
  final Function()? onPress;
  final Color bgColor;
  final Icon prefixIcon;
  final Color tColor;
  final bool enablePrefixIcon;
  const CustomButton(
      {super.key,
      this.btnName = "CustomBtn",
      this.width = 350,
      this.onPress,
      this.bgColor = AppColors.primary,
      this.tColor = Colors.white,
      this.borderRadius = 6.0,
      this.enablePrefixIcon = false,
      this.prefixIcon = const Icon(Icons.abc)});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: widget.onPress,
      child: Container(
        height: 50,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 8,
              // spreadRadius: 2,
              blurStyle: BlurStyle.outer,
              offset: const Offset(1, 2),
            )
          ],
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.enablePrefixIcon ? widget.prefixIcon : Container(),
              Text(
                widget.btnName,
                style: TextStyle(
                    color: widget.tColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    )
        //  ElevatedButton(
        //   style: ButtonStyle(
        //     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(widget.borderRadius))),
        //     backgroundColor: MaterialStatePropertyAll(widget.bgColor),
        //     padding: const MaterialStatePropertyAll(
        //       EdgeInsets.symmetric(horizontal: 120, vertical: 15),
        //     ),
        //   ),
        //   onPressed: () {

        //   },
        //   child: Row(
        //     //mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       // widget.prefixICon
        //       //     ? const Icon(Icons.add_circle_outline_sharp)
        //       //     : const Icon(
        //       //         Icons.abc,
        //       //         size: 1,
        //       //       ),
        //       // const SizedBox(
        //       //   width: 20,
        //       // ),
        //       Text(
        //         widget.btnName,
        //         style: TextStyle(
        //             color: widget.tColor,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 18),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
