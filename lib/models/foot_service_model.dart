class FootServiceDetailModel {
  String title;
  String image;
  String description;
  List<FootServiceModel> nurseServiceModelList;

  FootServiceDetailModel({
    this.title = "",
    this.image = "",
    this.description = "",
    this.nurseServiceModelList = const [],
  });

  // JSON serialization
  factory FootServiceDetailModel.fromJson(Map<String, dynamic> json) {
    return FootServiceDetailModel(
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      nurseServiceModelList: (json['nurseServiceModelList'] as List<dynamic>?)
              ?.map((item) => FootServiceModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'nurseServiceModelList':
          nurseServiceModelList.map((item) => item.toJson()).toList(),
    };
  }

  // Copy method for immutability
  FootServiceDetailModel copyWith({
    String? title,
    String? image,
    String? description,
    List<FootServiceModel>? nurseServiceModelList,
  }) {
    return FootServiceDetailModel(
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      nurseServiceModelList:
          nurseServiceModelList ?? this.nurseServiceModelList,
    );
  }
}

class FootServiceModel {
  String image;
  String dayRemain;
  String title;
  String description;
  int actualPrice;
  int offerPrice;
  int reviewCount;
  double averageRating;

  FootServiceModel({
    this.image = "",
    this.dayRemain = "",
    this.title = "",
    this.description = "",
    this.offerPrice = 0,
    this.actualPrice = 0,
    this.reviewCount = 0,
    this.averageRating = 0.0,
  });

  // JSON serialization
  factory FootServiceModel.fromJson(Map json) {
    return FootServiceModel(
      image: json['image'] ?? '',
      dayRemain: json['dayRemain'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      actualPrice: json['actualPrice'] ?? 0,
      offerPrice: json['offerPrice'] ?? 0,
      reviewCount: json['reviewCount'] ?? 0,
      averageRating: (json['averageRating'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'dayRemain': dayRemain,
      'title': title,
      'description': description,
      'actualPrice': actualPrice,
      'offerPrice': offerPrice,
      'reviewCount': reviewCount,
      'averageRating': averageRating,
    };
  }

  // Copy method for immutability
  FootServiceModel copyWith({
    String? image,
    String? dayRemain,
    String? title,
    String? description,
    int? actualPrice,
    int? offerPrice,
    int? reviewCount,
    double? averageRating,
  }) {
    return FootServiceModel(
      image: image ?? this.image,
      dayRemain: dayRemain ?? this.dayRemain,
      title: title ?? this.title,
      description: description ?? this.description,
      actualPrice: actualPrice ?? this.actualPrice,
      offerPrice: offerPrice ?? this.offerPrice,
      reviewCount: reviewCount ?? this.reviewCount,
      averageRating: averageRating ?? this.averageRating,
    );
  }
}
