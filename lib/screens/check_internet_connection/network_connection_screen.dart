import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class NetworkConnectionScreen extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;
  const NetworkConnectionScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  State<NetworkConnectionScreen> createState() =>
      _NetworkConnectionScreenState();
}

class _NetworkConnectionScreenState extends State<NetworkConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                path: widget.image,
                height: 350,
                width: 340,
              ),
              const SizedBox(height: 32),
              Text(
                widget.title,
                style: const TextStyle(
                  color: AppColors.black1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.subTitle,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Center(
                child: CustomButton(
                  bgColor: AppColors.primaryBlue,
                  buttonName: "Try Again",
                  textColor: AppColors.whiteBgColor,
                  onPress: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
