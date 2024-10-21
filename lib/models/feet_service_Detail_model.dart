class FeetServiceDetailModel {
  String image;
  String description;
  String feetType;
  List<FeetServiceModel> nurseServiceModelList;

  FeetServiceDetailModel({
    this.image = "",
    this.description = "",
    this.feetType = "",
    this.nurseServiceModelList = const [],
  });
}

class FeetServiceModel {
  FeetServiceModel();
}
