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
}
