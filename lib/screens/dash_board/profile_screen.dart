import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Divider forprofile = const Divider(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text(Strings.profile),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fmedium.com%2Fflutter&psig=AOvVaw3VRZ-hK7FMVz138COjtmU4&ust=1709710344968000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCPDKm8DN3IQDFQAAAAAdAAAAABAJ",
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              Strings.profileName,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textBackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              Strings.regd,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textBackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Divider(
              height: 60,
            ),
            const ListTile(
              title: Text(Strings.myProfile,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textBackColor,
                    fontWeight: FontWeight.w500,
                  )),
              leading: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.person,
                    color: AppColors.secondary,
                  )),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            forprofile,
            const ListTile(
              title: Text(Strings.appointment,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textBackColor,
                    fontWeight: FontWeight.w500,
                  )),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.calendar_month,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            forprofile,
            const ListTile(
              title: Text(
                Strings.service,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.calendar_month,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            forprofile,
            const ListTile(
              title: Text(
                Strings.payments,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.calendar_month,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            forprofile,
            const ListTile(
              title: Text(
                Strings.contactus,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.call,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            forprofile,
            const ListTile(
              title: Text(
                Strings.logout,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textBackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.logout,
                  color: AppColors.secondary,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            forprofile,
          ],
        ),
      ),
    );
  }
}
