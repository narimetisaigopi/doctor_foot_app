import 'package:drfootapp/controllers/appointment_booking_controller.dart';
import 'package:drfootapp/models/doctor_model.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/gender_widget.dart';
import 'package:drfootapp/screens/foot_services/available_offers.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_circular_loader.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'widgets/doctor_card.dart';

class BookingSummaryScreen extends StatefulWidget {
  final DoctorModel doctorModel;
  const BookingSummaryScreen({super.key, required this.doctorModel});

  @override
  State<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  final AppointmentBookingController appointmentBookingController =
      Get.put(AppointmentBookingController());
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    appointmentBookingController.billTotalAmount =
        widget.doctorModel.actualPrice;
    appointmentBookingController.discountAmount =
        appointmentBookingController.getDiscountAmount(widget.doctorModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentBookingController>(
        builder: (appointmentBookingController) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.whiteBgColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            "Booking Summary",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteBgColor,
            ),
          ).tr(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.whiteBgColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DoctorCard(
                          doctorModel: widget.doctorModel,
                        ),
                        const Divider(
                          color: AppColors.grey4,
                          thickness: 10,
                        ),
                        userDetails(),
                        const Divider(
                          color: AppColors.grey4,
                          thickness: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Offers & Benefits",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              InkWell(
                                onTap: () {
                                  Utility.myBottomSheet(
                                    context,
                                    heightFactor: 0.7,
                                    widget: const AvailableOffers(),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteBgColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: AppColors.greyBorderColor)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Apply Coupon",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black2,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.forwardArrowColor,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              billingDetails(),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: FloatingActionButton.extended(
                    extendedPadding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: AppColors.primaryBlue,
                    onPressed: () {},
                    label: SizedBox(
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Added | Rs.",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                              children: [
                                TextSpan(
                                  text: Utility().toIndianFormat(
                                      appointmentBookingController
                                          .getPayableAmount()),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          appointmentBookingController.isLoading
                              ? const CustomCircularLoader()
                              :
                          InkWell(
                                  onTap: validateData,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white10,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    child: const Text(
                                      "Pay Now",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.whiteBgColor,
                                      ),
                                    ).tr(),
                                  ),
                                ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }

  void validateData() {
    //  Get.to(() => const BookingHistoryScreen());
    Utility().closeKeyboard();
    bool status = _formKey.currentState?.saveAndValidate() ?? false;
    if (status) {
      if (appointmentBookingController.nameTextController.text.isEmpty) {
        Utility.toast("Enter name");
      } else if (appointmentBookingController
          .mobileNumberTextController.text.isEmpty) {
        Utility.toast("Enter age");
      } else if (appointmentBookingController.ageTextController.text.isEmpty) {
        Utility.toast("Enter age");
      } else if (appointmentBookingController.bookingForWhom == "") {
        Utility.toast("Please select whom you are booking");
      } else if (appointmentBookingController.gender == null) {
        Utility.toast("Please select gender");
      } else {
        Utility.showAlertDialogger(
            context: context,
            yes: () {
              Get.back();
              appointmentBookingController.proceedToPayment(widget.doctorModel);
            },
            no: () {
              Get.back();
            });
      }
    }
  }

  Widget billingDetails() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteBgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.greyBorderColor)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bill Details",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBold),
                ),
                Divider(
                  color: AppColors.primaryBlue,
                  endIndent: 250,
                )
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Service total",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackBold),
                ),
                Text(
                  Utility().toIndianFormat(
                      appointmentBookingController.billTotalAmount),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBold),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Discount amount ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackBold),
                ),
                Text(
                  Utility().toIndianFormat(
                      appointmentBookingController.discountAmount),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBold),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pay you",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackBold,
                  ),
                ),
                Text(
                  Utility().toIndianFormat(
                      appointmentBookingController.getPayableAmount()),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackBold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget userDetails() {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sleeted Date And Slot ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ).tr(),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: AppColors.bookSumBorder,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        appointmentBookingController.selectedDate,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black2,
                        ),
                      ),
                      const VerticalDivider(
                        color: AppColors.black1,
                        thickness: 1,
                      ),
                      Text(
                        appointmentBookingController.selectedTime,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                GenderWidget(
                  text: "Self",
                  isSelected:
                      appointmentBookingController.bookingForWhom == "Self",
                  onSelected: (value) {
                    appointmentBookingController.selectWhomBooking(value);
                  },
                ),
                const SizedBox(width: 22),
                GenderWidget(
                  text: "Others",
                  isSelected:
                      appointmentBookingController.bookingForWhom == "Others",
                  onSelected: (value) {
                    appointmentBookingController.selectWhomBooking(value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Add Your Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ).tr(),
            const SizedBox(height: 0),
            MyTextField(
              hint: "Name",
              textEditingController:
                  appointmentBookingController.nameTextController,
              labelNeeded: false,
              textInputType: TextInputType.text,
              // validator: FormBuilderValidators.compose(
              //   [
              //     FormBuilderValidators.required(),
              //   ],
              // ),
            ),
            const SizedBox(height: 0),
            Row(
              children: [
                Expanded(
                  flex: 15,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: AppColors.bookSumBorder,
                        )),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "+91",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 0),
                Expanded(
                  flex: 85,
                  child: MyTextField(
                    hint: "Mobile Number",
                    textEditingController:
                        appointmentBookingController.mobileNumberTextController,
                    labelNeeded: false,
                    maxLength: 10,
                    textInputType: TextInputType.phone,
                    // validator: FormBuilderValidators.compose(
                    //   [
                    //     FormBuilderValidators.required(),
                    //     FormBuilderValidators.maxLength(10),
                    //     FormBuilderValidators.minLength(10),
                    //   ],
                    // ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: MyTextField(
                    hint: "Age",
                    textEditingController:
                        appointmentBookingController.ageTextController,
                    labelNeeded: false,
                    maxLength: 3,
                    textInputType: TextInputType.number,
                    // validator: FormBuilderValidators.compose(
                    //   [
                    //     FormBuilderValidators.required(),
                    //     FormBuilderValidators.maxLength(1),
                    //     FormBuilderValidators.minLength(3),
                    //   ],
                    // ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GenderWidget(
                        text: "Female",
                        isSelected:
                            appointmentBookingController.gender == "Female",
                        onSelected: (value) {
                          appointmentBookingController.selectGender(value);
                        },
                      ),
                      GenderWidget(
                        text: "Male",
                        isSelected:
                            appointmentBookingController.gender == "Male",
                        onSelected: (value) {
                          appointmentBookingController.selectGender(value);
                        },
                      ),
                      GenderWidget(
                        text: "Others",
                        isSelected:
                            appointmentBookingController.gender == "Others",
                        onSelected: (value) {
                          appointmentBookingController.selectGender(value);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
