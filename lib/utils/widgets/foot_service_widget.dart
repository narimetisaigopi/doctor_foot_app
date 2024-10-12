import 'package:drfootapp/controllers/foot_services_controller.dart';
import 'package:drfootapp/models/home_dressing/foot_service_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_network_image_widget.dart';

class FootServiceWidget extends StatefulWidget {
  final double height;
  final double width;
  final Function onPress;
  final FootServiceModel footServiceModel;

  const FootServiceWidget({
    super.key,
    this.height = 160,
    this.width = double.infinity,
    required this.footServiceModel,
    required this.onPress,
  });

  @override
  State<FootServiceWidget> createState() => _FootServiceWidgetState();
}

class _FootServiceWidgetState extends State<FootServiceWidget> {
  final FootServiceController homeDressingController =
      Get.put(FootServiceController());
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
          CustomNetworkImageWidget(
            path: widget.footServiceModel.image,
            width: MediaQuery.of(context).size.width * 0.2,
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
                        widget.footServiceModel.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      Text(
                        widget.footServiceModel.duration,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.primaryBlue,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 150,
                      child: Text(
                        widget.footServiceModel.description,
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
                      widget.footServiceModel.offerPrice != 0
                          ? Text(
                              "₹${widget.footServiceModel.originalPrice.round()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            )
                          : const SizedBox.shrink(),
                      Text(
                        "₹${widget.footServiceModel.offerPrice.round()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.primaryBlue,
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      ),
                    ),
                    onPressed: () => widget.onPress(),
                    child: Text(
                      homeDressingController
                              .isServiceAdded(widget.footServiceModel)
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
