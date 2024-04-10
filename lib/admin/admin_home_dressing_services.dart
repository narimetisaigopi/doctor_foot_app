import 'package:drfootapp/admin/create_home_dressing_services.dart';
import 'package:drfootapp/models/home_dressing/home_dressing_model.dart';
import 'package:drfootapp/screens/home_dressing_services/home_dressing_services.dart';
import 'package:drfootapp/utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AdminHomeDressingServices extends StatefulWidget {
  const AdminHomeDressingServices({super.key});

  @override
  State<AdminHomeDressingServices> createState() =>
      _AdminHomeDressingServicesState();
}

class _AdminHomeDressingServicesState extends State<AdminHomeDressingServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            serviceWidget(
              title: "Create Home Dressing Service",
              icon: Icons.miscellaneous_services,
              onTap: () => Get.to(() => CreateHomeDressingServices(
                    homeDressingModel: HomeDressingModel(),
                  )),
            ),
            serviceWidget(
              title: "View Home Dressing Service", icon: Icons.medical_services,
              //onTap: () => Get.to(() => const CreateHomeDressingServices()),
              onTap: () => Get.to(() => const HomeDressingServices(
                    isAdmin: true,
                  )),
            ),
          ],
        ),
      )),
    );
  }

  Widget serviceWidget({
    Function()? onTap,
    String title = "View Home Dressing Service",
    IconData icon = Icons.medical_services,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 100,
              color: AppColors.primary,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
