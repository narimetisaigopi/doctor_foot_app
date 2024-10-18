class NurseServiceDetailModel {
  String title;
  String image;
  String description;
  List<NurseServiceModel> nurseServiceModelList;
  NurseServiceDetailModel({
    this.title = "",
    this.image = "",
    this.description = "",
    this.nurseServiceModelList = const [],
  });
}

class NurseServiceModel {
  String image;
  String dayRemain;
  String title;
  String description;
  int actualPrice;
  int offerPrice;
  int reviewCount;
  double averageRating;

  NurseServiceModel({
    this.image = "",
    this.dayRemain = "",
    this.title = "",
    this.description = "",
    this.offerPrice = 0,
    this.actualPrice = 0,
    this.reviewCount = 0,
    this.averageRating = 0.0,
  });
}
