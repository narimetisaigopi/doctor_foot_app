import 'package:drfootapp/screens/records/uploaded_image.dart';
import 'package:drfootapp/screens/records/uploaded_images_model.dart';
import 'package:flutter/material.dart';

class AllRecentUploadImages extends StatefulWidget {
  final UploadedImagesModel? recentUploadModel;
  const AllRecentUploadImages({
    super.key,
    this.recentUploadModel,
  });

  @override
  State<AllRecentUploadImages> createState() => _AllRecentUploadImagesState();
}

class _AllRecentUploadImagesState extends State<AllRecentUploadImages> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recentUploadModelList.length,
          itemBuilder: (context, index) {
            UploadedImagesModel recentUploaItem = recentUploadModelList[index];
            return UploadedImage(
              recentUploadModel: recentUploaItem,
            );
          }),
    );
  }
}
