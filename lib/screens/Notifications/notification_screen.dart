import 'package:drfootapp/screens/notifications/notification_widget.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:drfootapp/utils/constants/assets_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
          "Notifications",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ).tr(),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16,top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today"s',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              NotificationWidget(
                title: "Under Review",
                textStyle: TextStyle(color: AppColors.primary,fontSize: 18),
                subtitle: "Hey! Your service is under review.",
                description: "23rd- Jan-2024/02:30 PM",
                image: AssetsConstants.alaram_sign,
              ),
              SizedBox(
                height: 10,
              ),
              NotificationWidget(

                title: "Order Initiated",
                                textStyle: TextStyle(color: AppColors.greenColor,fontSize: 18),

                subtitle: "Hello! Your service has been initiated.",
                description: "23rd- Jan-2024/02:30 PM",
                image: '',
              ),
              SizedBox(
                height: 10,
              ),
              NotificationWidget(

                title: "Payment succesful",
                                textStyle: TextStyle(color: AppColors.primary,fontSize: 18),

                subtitle: "Yay! Payment has been successfully.  ",
                description: "23rd- Jan-2024/02:30 PM",
                image: '',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "08/01/2024",
                    style:  TextStyle(
                        color: AppColors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              NotificationWidget(

                title: "Review Succesful",
                                textStyle: TextStyle(color: AppColors.primary,fontSize: 18),

                subtitle: "Hey! Your service is reviewed.",
                description: "23rd- Jan-2024/02:30 PM",
                image: '',
              ),
              SizedBox(
                height: 10,
              ),
              NotificationWidget(

                title: "Order Initiated",
                                textStyle: TextStyle(color: AppColors.greenColor,fontSize: 18),

                subtitle: "Hello! Your service has been initiated.",
                description: "23rd- Jan-2024/02:30 PM",
                image: '', 
              ),
              SizedBox(
                height: 10,
              ),
              NotificationWidget(
                title: "Payement Succesful",
                                textStyle: TextStyle(color: AppColors.primary,fontSize: 18),

                subtitle: "Yay! Payment has been successfully.  ",
                description: "23rd- Jan-2024/02:30 PM",
                image: '',
              ),
              SizedBox(
                height: 10,
              ),
              NotificationWidget(
                title: "Payment Failed",
                                textStyle: TextStyle(color: AppColors.textred,fontSize: 18),

                subtitle: "Ooh No, your payment is failed please try again.",
                description: "23rd- Jan-2024/02:30 PM",
                image: 's',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
