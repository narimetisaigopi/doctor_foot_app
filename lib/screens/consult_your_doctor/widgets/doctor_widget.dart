import 'package:drfootapp/admin/doctor/create_doctor.dart';
import 'package:drfootapp/controllers/doctors_controller.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_network_image_widget.dart';
import 'package:drfootapp/utils/widgets/small_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DoctorWidget extends StatefulWidget {
  final DoctorModel doctorModel;
  final bool isAdmin;
  final Function() onPressed;
  const DoctorWidget(
      {super.key,
      required this.doctorModel,
      this.isAdmin = false,
      required this.onPressed});

  @override
  State<DoctorWidget> createState() => _DoctorWidgetState();
}

class _DoctorWidgetState extends State<DoctorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
            color: widget.doctorModel.isActive
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
                      child: Stack(
                        children: [
                          CustomNetworkImageWidget(
                            path: widget.doctorModel.image,
                            height: 152,
                            width: 104,
                          ),
                          if (!widget.isAdmin)
                            Positioned(
                                top: 3.3,
                                right: 3.3,
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor:
                                      AppColors.secondary.withOpacity(0.6),
                                  child: const Icon(
                                    size: 22,
                                    Icons.favorite_border,
                                    color: AppColors.primaryBlue,
                                  ),
                                ))
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
                              "DR. ${widget.doctorModel.name.capitalize}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black2,
                              ),
                            ).tr(),
                            Text(
                              "${widget.doctorModel.education} - ${widget.doctorModel.yearsOfExperiance} YRS. EXP.",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                            ).tr(),
                            const Text(
                              "Leg related diseases, Foot...",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                            ).tr(),
                            Row(
                              children: [
                                Text(
                                  "${Utility().toIndianFormat(widget.doctorModel.offerPrice)}/-",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black2,
                                  ),
                                ).tr(),
                                Text(
                                  "${Utility().toIndianFormat(widget.doctorModel.actualPrice)}/-",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey2,
                                  ),
                                ).tr(),
                              ],
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 4,
                                  itemSize: 20,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: AppColors.ratingBarColor,
                                  ),
                                  onRatingUpdate: (double value) {},
                                ),
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
                            const SizedBox(height: 8),
                            SmallButton(
                              bgColor: AppColors.patientReviewBg,
                              buttonName: "Book Now",
                              textColor: AppColors.whiteBgColor,
                              onPress: widget.onPressed,
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
              Get.to(() => CreateDoctor(
                    doctorModel: widget.doctorModel,
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
                  value: widget.doctorModel.isActive,
                  onChanged: (status) async {
                    await Get.put(DoctorsController())
                        .updateActivieStatus(widget.doctorModel, status);
                    widget.doctorModel.isActive = status;
                    setState(() {});
                  }),
            ],
          ),
        )
      ],
    );
  }
}
