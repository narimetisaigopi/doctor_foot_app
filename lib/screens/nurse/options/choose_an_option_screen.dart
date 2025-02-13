import 'package:drfootapp/screens/nurse/options/choose_options.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:flutter/material.dart';

class ChooseAnOptionScreen extends StatefulWidget {
  const ChooseAnOptionScreen({super.key});

  @override
  State<ChooseAnOptionScreen> createState() => _ChooseAnOptionScreenState();
}

class _ChooseAnOptionScreenState extends State<ChooseAnOptionScreen> {
  @override
  void initState() {
    chooseOption();
    super.initState();
  }
    void chooseOption() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    
      await     Utility.myBottomSheet(context,
                            heightFactor: 0.4, widget: const ChooseOptions());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
