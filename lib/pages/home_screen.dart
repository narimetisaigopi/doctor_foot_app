import 'package:doctor_foot_app/utils/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.location_on),
        
      ),
      body: Center(
        child: Text(Strings.homeText),
      ),
    );
  }
}
