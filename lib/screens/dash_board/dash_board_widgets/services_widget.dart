import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/constants.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesWidget extends StatefulWidget {
  final Function() onPress;
  const ServicesWidget({super.key, required this.onPress});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        height: MediaQuery.of(context).size.height * 0.56,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondary),
            color: AppColors.textWhiteColor,
            borderRadius: BorderRadius.circular(16)),
        child: Container(
          margin: const EdgeInsets.only(
            left: 14,
            top: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                Strings.serviceText,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 2.0),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 4 / 5,
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                    itemCount: serviceMap.length,
                    itemBuilder: (context, index) {
                      final service = serviceMap[index];
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.greyBorderColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: SvgImageWidget(
                                path: "${service["image"]}",
                                height: 148,
                                width: 63,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(16))),
                                child: Center(
                                  child: Text(
                                    "${service["name"]}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.secondary),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
