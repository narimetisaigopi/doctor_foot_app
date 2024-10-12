import 'package:drfootapp/admin/hospital/create_hospital.dart';
import 'package:drfootapp/controllers/hospitals_controller.dart';
import 'package:drfootapp/models/hospital_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:drfootapp/utils/widgets/small_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalWidget extends StatefulWidget {
  final HospitalModel hospitalModel;
  final bool isAdmin;
  const HospitalWidget(
      {super.key, required this.hospitalModel, this.isAdmin = false});

  @override
  State<HospitalWidget> createState() => _HospitalWidgetState();
}

class _HospitalWidgetState extends State<HospitalWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
            color: widget.hospitalModel.isActive
                ? AppColors.whiteBgColor
                : AppColors.redBgColor,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomNetworkImageWidget(
                            path: widget.hospitalModel.image,
                            height: 125,
                            width: 96,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.ratingBarColor,
                                size: 22,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "4.5",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black2,
                                ),
                              ).tr(),
                              const Text(
                                "(134)",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey2,
                                ),
                              ).tr(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.hospitalModel.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackBold,
                              ),
                            ).tr(),
                            const SizedBox(height: 12),
                            Text(
                              widget.hospitalModel.address,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black2,
                              ),
                              textAlign: TextAlign.justify,
                            ).tr(),
                            const SizedBox(height: 8),
                            SmallButton(
                              bgColor: AppColors.primaryBlue,
                              buttonName: "View",
                              textColor: AppColors.whiteBgColor,
                              onPress: () {},
                            )
                          ],
                        ),
                      ))
                ],
              ),
              if (widget.isAdmin) adminLayout()
            ],
          ),
        ),
      ),
    );
  }

  Widget adminLayout() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.to(() => CreateHospital(
                    hospitalModel: widget.hospitalModel,
                  ));
            },
            icon: const CircleAvatar(child: Icon(Icons.edit_outlined))),
        SizedBox(
          width: 150,
          height: 50,
          child: Row(
            children: [
              const Text("Status"),
              Switch(
                  value: widget.hospitalModel.isActive,
                  onChanged: (status) async {
                    await Get.put(HospitalsController())
                        .updateActivieStatus(widget.hospitalModel, status);
                    widget.hospitalModel.isActive = status;
                    setState(() {});
                  }),
            ],
          ),
        )
      ],
    );
  }
}
