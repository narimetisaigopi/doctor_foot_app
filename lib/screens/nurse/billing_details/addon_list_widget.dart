import 'package:drfootapp/screens/nurse/billing_details/addon_widget.dart';
import 'package:drfootapp/screens/nurse/billing_details/count_down_model.dart';
import 'package:flutter/material.dart';

class AddonListWidget extends StatefulWidget {
  const AddonListWidget({super.key});

  @override
  State<AddonListWidget> createState() => _AddonListWidgetState();
}

class _AddonListWidgetState extends State<AddonListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: countDownModelList.length,
          itemBuilder: (context, index) {
            final addonitem = countDownModelList[index];
            return AddonWidget(
              titleText: addonitem.tittleText,
              onPress: () {},
            );
          }),
    );
  }
}
