import 'package:drfootapp/screens/consult_your_doctor/find_your_doctor_screen.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Location",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteBgColor,
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 50,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextField(
                      borderRadius: 8,
                      bgColor: AppColors.whiteBgColor,
                      hint: "Search your location here",
                      textEditingController: locationController,
                      leadingIcon: const Icon(
                        Icons.search,
                        color: AppColors.grey,
                      ),
                      iconNeeded: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    const SizedBox(height: 6),
                    const Divider(
                      color: AppColors.grey,
                      thickness: 0.5,
                    ),
                    const Text(
                      "Top Localities in Hyderabad",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackBold,
                      ),
                    ).tr(),
                    const Text(
                      "Secunderabad",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ).tr(),
                    const Divider(
                      color: AppColors.grey,
                      thickness: 0.5,
                    ),
                    const Text(
                      "Hytech city",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ).tr(),
                    const Divider(
                      color: AppColors.grey,
                      thickness: 0.5,
                    ),
                    const Text(
                      "Madhapur",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ).tr(),
                    const Divider(
                      color: AppColors.grey,
                      thickness: 0.5,
                    ),
                    const Text(
                      "Ameerpet",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ).tr(),
                    const Divider(
                      color: AppColors.grey,
                      thickness: 0.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 34,
            child: Container(
              color: AppColors.secondary,
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              color: AppColors.whiteBgColor,
              child: Center(
                child: CustomButton(
                  bgColor: AppColors.primaryBlue,
                  buttonName: "Use Current Location",
                  textColor: AppColors.whiteBgColor,
                  prefixIcon: const Icon(
                    Icons.my_location,
                    color: AppColors.whiteBgColor,
                  ),
                  enablePrefixIcon: true,
                  onPress: () {
                    Get.to(() => const FindYourDoctorScreen());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
