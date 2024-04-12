import 'package:drfootapp/controllers/home_dressing_controller.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDressingServiceWidget extends StatefulWidget {
  final double height;
  final double width;

  final Function onPress;
  final HomeDressingModel homeDressingModel;

  const HomeDressingServiceWidget({
    super.key,
    this.height = 160,
    this.width = double.infinity,
    required this.homeDressingModel,
    required this.onPress,
  });

  @override
  State<HomeDressingServiceWidget> createState() =>
      _HomeDressingServiceWidgetState();
}

class _HomeDressingServiceWidgetState extends State<HomeDressingServiceWidget> {
  final HomeDressingController homeDressingController =
      Get.put(HomeDressingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      height: widget.height,
      width: widget.width,
      child: Row(
        children: [
          const SvgImageWidget(
            path: AssetsConstants.wounded_foot,
            height: 130,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.homeDressingModel.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.primary),
                      ),
                      Text(
                        widget.homeDressingModel.duration,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.primary),
                      )
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 150,
                      child: Text(
                        widget.homeDressingModel.textDescription,
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
                      widget.homeDressingModel.oldPrice != 0
                          ? Text(
                              "₹${widget.homeDressingModel.oldPrice.round()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            )
                          : const SizedBox.shrink(),
                      Text(
                        "₹${widget.homeDressingModel.newPrice.round()}",
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
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      ),
                    ),
                    onPressed: () => widget.onPress(),
                    child: Text(
                      homeDressingController
                              .isServiceAdded(widget.homeDressingModel)
                          ? "Remove"
                          : "Add",
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
