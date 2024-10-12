class ArticleModel {
  String uid;
  String title;
  String description;
  String image;
  var timestamp;
  bool isActive;

  ArticleModel(
      {this.uid = "",
      this.title = "",
      this.image = "",
      this.description = "",
      this.isActive = true,
      this.timestamp});

  factory ArticleModel.fromMap(Map map) {
    return ArticleModel(
      uid: map["uid"] ?? "",
      title: map["title"] ?? "",
      image: map["image"] ?? "",
      description: map["description"] ?? "",
      isActive: map["isActive"] ?? true,
      timestamp: map["timestamp"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "title": title,
      "description": description,
      "isActive": isActive,
      "timestamp": timestamp,
      "image": image
    };
  }
}
