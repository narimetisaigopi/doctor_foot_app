import 'package:drfootapp/screens/records/recent_image.dart';
import 'package:flutter/material.dart';

class AllRecentImages extends StatefulWidget {
  const AllRecentImages({super.key});

  @override
  State<AllRecentImages> createState() => _AllRecentImagesState();
}

class _AllRecentImagesState extends State<AllRecentImages> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.16,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const RecentImage();
          }),
    );
  }
}
