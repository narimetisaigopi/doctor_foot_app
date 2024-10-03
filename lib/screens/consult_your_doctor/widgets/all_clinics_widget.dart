import 'package:drfootapp/screens/consult_your_doctor/find_your_doctor_screen.dart';
import 'package:drfootapp/screens/consult_your_doctor/widgets/address_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllClinicsWidget extends StatefulWidget {
  const AllClinicsWidget({super.key});

  @override
  State<AllClinicsWidget> createState() => _AllClinicsWidgetState();
}

class _AllClinicsWidgetState extends State<AllClinicsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(
                  () => const FindYourDoctorScreen(),
                );
              },
              child: const AddressViewWidget(),
            );
          }),
    );
  }
}
