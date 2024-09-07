import 'package:drfootapp/models/homeScreenModels/service_model.dart';
import 'package:drfootapp/screens/dash_board/home_screen_widgets/service_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OurServicesWidget extends StatefulWidget {
  const OurServicesWidget({super.key});

  @override
  State<OurServicesWidget> createState() => _OurServicesWidgetState();
}

class _OurServicesWidgetState extends State<OurServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              height: MediaQuery.of(context).size.height * 1.32,
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 14,
                  top: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "OUR SERVICES",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ).tr(),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 4 / 5,
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: servicesList.length,
                          itemBuilder: (context, index) {
                            final servicesItem = servicesList[index];
                            return InkWell(
                              onTap: () {
                                switch (index) {}
                              },
                              child: ServiceWidget(
                                  image: servicesItem.image,
                                  name: servicesItem.serviceNames),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
  }
}