import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AvailableOffersWidget extends StatefulWidget {
  final double offerValue;
  const AvailableOffersWidget({super.key, this.offerValue = 10});

  @override
  State<AvailableOffersWidget> createState() => _AvailableOffersWidgetState();
}

class _AvailableOffersWidgetState extends State<AvailableOffersWidget> {
  bool isApplied = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Transform.rotate(
              angle: -90 * 3.14 / 180,
              child: Row(
                children: [
                  const Icon(Icons.discount),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${widget.offerValue.round()}% OFF ",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 260,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.offerValue.round()}% OFF ",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isApplied = !isApplied;
                              // Get.back();
                            });
                          },
                          child: Text(
                            isApplied ? "Applied" : "Apply",
                            style: TextStyle(
                                color: isApplied
                                    ? Colors.green
                                    : AppColors.primary),
                          ))
                    ],
                  ),
                ),
                const Text(
                  "Save ₹ 100 with this code",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  // textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "This offer is personalized for you.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                ),
                const Text(
                  "Maximum instant discount of ₹100.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 10,
                    ),
                    label: const Text(
                      "More",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
                    ))
                // TextButton(onPressed: () {}, child: const Text("More"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
