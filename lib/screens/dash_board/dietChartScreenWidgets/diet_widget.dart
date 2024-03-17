import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DietWidget extends StatefulWidget {
  final String image;
  final String timeText;

  const DietWidget({super.key, this.image = "",  this.timeText=""});

  @override
  State<DietWidget> createState() => _DietWidgetState();
}

class _DietWidgetState extends State<DietWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
                      margin: const EdgeInsets.only(left: 8, right: 6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.dietChartBgColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: SvgImageWidget(
                              path: widget.image,
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
                                    top: Radius.circular(7),
                                      bottom: Radius.circular(7))),
                              child: Center(
                                child: Text(
                                  widget.timeText,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.secondary),
                                ).tr(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
  }
}