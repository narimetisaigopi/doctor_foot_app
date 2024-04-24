import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:drfootapp/utils/widgets/svg_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ViewDetailsPage extends StatefulWidget {
  const ViewDetailsPage({super.key});

  @override
  State<ViewDetailsPage> createState() => _ViewDetailsPageState();
}

class _ViewDetailsPageState extends State<ViewDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Appointments",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ).tr(),
      ),
      body: Column(
        children: [
          const SvgImageWidget(
            height: 180,
            width: double.infinity,
            path: AssetsConstants.diabetes_image,
          ),
          body(),
        ],
      ),
    );
  }

  Widget body() {
    return const Padding(
      padding: EdgeInsets.only(left: 16,right: 16,),
      child: Column(
        children: [
          Text(
            "Hospital Name",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.blackBold),
          ),
          SizedBox(height: 12,),
           Text(
            "No 249/A,Addagutta Society, street, 11, Pragathi Nagar Rd,...",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey),
          ),
           SizedBox(height: 12,),
           Text(
            "Booked on Monday/25/Dec/2023 12:00 PM",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.grey2),
          ),
            SizedBox(height: 12,),
           Text(
            "Booked on Monday/25/Dec/2023 12:00 PM",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.grey2),
          ),
        ],
      ),
    );
  }
}
