import 'package:drfootapp/models/check_your_feet_model.dart';
import 'package:drfootapp/screens/check_your_feet/check_your_feet_widget.dart';
import 'package:flutter/material.dart';

class CheckYourFeetList extends StatefulWidget {
  const CheckYourFeetList({super.key});

  @override
  State<CheckYourFeetList> createState() => _CheckYourFeetListState();
}

class _CheckYourFeetListState extends State<CheckYourFeetList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Expanded(
          child: GridView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 4.3,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: checkYourFeetList.length,
              itemBuilder: (context, index) {
                final checkYourFeetItem = checkYourFeetList[index];
                return InkWell(
                  onTap: () {
                    switch (index) {}
                  },
                  child: CheckYourFeetWidget(
                    image: checkYourFeetItem.image,
                    title: checkYourFeetItem.serviceNames,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
