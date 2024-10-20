class CheckYourFeetDataModel {
  String image;
  String title;
  String subTitle;
  int actualPrice;
  int offerPrice;
  int reviewCount;
  double averageRating;
  String about;
  bool isPriceing;

  // Constructor with default values
  CheckYourFeetDataModel({
    this.image = "",
    this.title = "",
    this.subTitle = "",
    this.offerPrice = 0,
    this.actualPrice = 0,
    this.reviewCount = 0,
    this.averageRating = 0.0,
    this.about = "",
    this.isPriceing = true,
  });

  // Named constructor for creating an instance from JSON
  factory CheckYourFeetDataModel.fromJson(Map<String, dynamic> json) {
    return CheckYourFeetDataModel(
      image: json['image'] ?? "",
      title: json['title'] ?? "",
      subTitle: json['subTitle'] ?? "",
      offerPrice: json['offerPrice'] ?? 0,
      actualPrice: json['actualPrice'] ?? 0,
      reviewCount: json['reviewCount'] ?? 0,
      averageRating: (json['averageRating'] ?? 0.0).toDouble(),
      about: json['about'] ?? "",
      isPriceing: json['isPriceing'] ?? true,
    );
  }

  // Method to convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'subTitle': subTitle,
      'offerPrice': offerPrice,
      'actualPrice': actualPrice,
      'reviewCount': reviewCount,
      'averageRating': averageRating,
      'about': about,
      'isPriceing': isPriceing,
    };
  }

  // CopyWith method for creating a copy with specific fields changed
  CheckYourFeetDataModel copyWith({
    String? image,
    String? title,
    String? subTitle,
    int? actualPrice,
    int? offerPrice,
    int? reviewCount,
    double? averageRating,
    String? about,
    bool? isPriceing,
  }) {
    return CheckYourFeetDataModel(
      image: image ?? this.image,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      actualPrice: actualPrice ?? this.actualPrice,
      offerPrice: offerPrice ?? this.offerPrice,
      reviewCount: reviewCount ?? this.reviewCount,
      averageRating: averageRating ?? this.averageRating,
      about: about ?? this.about,
      isPriceing: isPriceing ?? this.isPriceing,
    );
  }
}
