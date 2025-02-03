import 'package:flutter/material.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text("Materials Screen"),
      ),
    );
  }
}