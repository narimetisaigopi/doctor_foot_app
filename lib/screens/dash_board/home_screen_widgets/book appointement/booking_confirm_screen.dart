import 'package:drfootapp/screens/dash_board/home_screen_widgets/book%20appointement/view_details_page.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingConfirmScreen extends StatefulWidget {
  const BookingConfirmScreen({super.key});

  @override
  State<BookingConfirmScreen> createState() => _BookingConfirmScreenState();
}

class _BookingConfirmScreenState extends State<BookingConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
                    const SizedBox(
            height: 78,
                    ),
                    Container(
            height: 196,
            width: double.infinity,
                    ),
                     const SizedBox(
            height: 16,
                    ),
                    const Text(
            "Your Appointment Confirmed!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.blackBold,
            ),
                    ),
                    const SizedBox(
            height: 16,
                    ),
                    const Text(
            "Appointment Id # 1234567890",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey5,
            ),
                    ),
                     const SizedBox(
            height: 16,
                    ),
                    const Text(
            "Date: Monday/25/Dec/2023",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey5,
            ),
                    ),
                     const SizedBox(
            height: 20,
                    ),
                    const Text(
            "Afternoon - 3:00 PM",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey5,
            ),
                    ),
                     const SizedBox(
            height: 40,
                    ),
                    const Text(
            "             Thank you !\n We ensure awesome hospital\n experience with no waiting time.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey5,
            ),
                    ),
                    const Spacer(),
                     CustomButton(
              buttonName: "View details",
              onPress: (){
                Get.to(const ViewDetailsPage());
              },
            ),
                  ]),
          )),
    );
  }
}
