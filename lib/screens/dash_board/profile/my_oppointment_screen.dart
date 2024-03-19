import 'package:doctor_foot_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyOppointmentScreen extends StatefulWidget {
  const MyOppointmentScreen({super.key});

  @override
  State<MyOppointmentScreen> createState() => _MyOppointmentScreenState();
}

class _MyOppointmentScreenState extends State<MyOppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text("My Oppointments"),
      ),
      body: Container(
        child: Column(children: [
         
        ],),
      ),
    );
  }
}
