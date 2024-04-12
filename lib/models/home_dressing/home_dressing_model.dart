class HomeDressingModel {
  String image;
  String docId;
  String uId;
  double newPrice;
  double oldPrice;
  String title;
  String duration;
  String textDescription;

  HomeDressingModel({
    this.image = "",
    this.title = "",
    this.duration = "",
    this.docId = "",
    this.uId = "",
    this.newPrice = 0.0,
    this.oldPrice = 0.0,
    this.textDescription = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'docId': docId,
      'uId': uId,
      'title': title,
      'duration': duration,
      'newPrice': newPrice,
      'oldPrice': oldPrice,
      'textDescription': textDescription,
    };
  }

  factory HomeDressingModel.fromJson(Map map) {
    return HomeDressingModel(
      image: map['image'] ?? "",
      docId: map['docId'] ?? "",
      uId: map['uId'] ?? "",
      title: map['title'] ?? "",
      newPrice: (map['newPrice'] ?? 0).toDouble(),
      oldPrice: (map['oldPrice'] ?? 0).toDouble(),
      duration: map['duration'] ?? "",
      textDescription: map['textDescription'] ?? "",
    );
  }
}
