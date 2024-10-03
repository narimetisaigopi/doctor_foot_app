import 'package:drfootapp/screens/treatement/how_to_upload_image_screen.dart';
import 'package:drfootapp/screens/treatement/models/image_upload_model.dart';
import 'package:flutter/material.dart';

class ImageUploadList extends StatefulWidget {
  const ImageUploadList({super.key});

  @override
  State<ImageUploadList> createState() => _ImageUploadListState();
}

class _ImageUploadListState extends State<ImageUploadList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: uploadList.length,
        itemBuilder: (context,index){
          final   uploadItem = uploadList[index];
      return  HowToUploadImage(
         image: uploadItem.image,
        nametext: uploadItem.nametext,
        descriptiontext: uploadItem.descriptiontext,
      );
        }
        ),
    );
  }
}