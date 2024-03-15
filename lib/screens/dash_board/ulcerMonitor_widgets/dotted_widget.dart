import 'package:flutter/cupertino.dart';

class DottedWidget extends StatelessWidget {
  final String text;
  const DottedWidget({super.key, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Text(
      "   ●  $text",
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    );
  }
}
