import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class DottedWidget extends StatelessWidget {
  final String text;
  const DottedWidget({super.key, this.text =""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 04),
      child: Text(
        "${"   ●  "}$text",
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ).tr(),
    );
  }
}
