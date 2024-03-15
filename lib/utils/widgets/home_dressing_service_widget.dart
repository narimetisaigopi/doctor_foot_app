import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeDressingServiceWidget extends StatefulWidget {
  final String imagePath;
  final bool isAdded;
  final String description;
  final String title;
  final String textDescription;
  final double height;
  final double width;
  final double oldPrice;
  final double newPrice;
  final Function onPress;

  const HomeDressingServiceWidget({
    super.key,
    this.height = 160,
    this.width = double.infinity,
    this.imagePath = "assets/images/home_dressing/wounded_foot.svg",
    this.description = "",
    this.oldPrice = 0,
    this.newPrice = 800,
    this.isAdded = false,
    this.textDescription = "",
    this.title = "",
    required this.onPress,
  });

  @override
  State<HomeDressingServiceWidget> createState() =>
      _HomeDressingServiceWidgetState();
}

class _HomeDressingServiceWidgetState extends State<HomeDressingServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.shade300,
              offset: const Offset(2, 5),
            )
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      height: widget.height,
      width: widget.width,
      child: Row(
        children: [
          SvgImageWidget(
            path: widget.imagePath,
            height: 130,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.primary),
                      ),
                      Text(
                        widget.textDescription,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.primary),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: 230,
                      child: Text(
                        widget.description,
                        maxLines: 2,
                        //  textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      widget.oldPrice != 0
                          ? Text(
                              "₹${widget.oldPrice.round()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            )
                          : const SizedBox.shrink(),
                      Text(
                        "₹${widget.newPrice.round()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primary),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                      ),
                    ),
                    onPressed: () => widget.onPress(),
                    child: Text(
                      widget.isAdded ? "Added" : "Add",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
