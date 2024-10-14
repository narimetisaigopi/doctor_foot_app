class RiskCheckerModel {
  late String image;
  late String question;
  late String description;
  late String type;
  late List<RiskCheckerOptionModel> options;
  late int id;
  RiskCheckerOptionModel? selectedOption;

  RiskCheckerModel({
    this.image = "",
    this.question = "",
    this.description = "",
    this.type = "",
    this.options = const [],
    this.id = 0,
  });

  RiskCheckerModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? "";
    question = json['question'] ?? "";
    description = json['description'] ?? "";
    type = json['type'] ?? "";
    id = json['id'] ?? 0;
    if (json['options'] != null) {
      options = <RiskCheckerOptionModel>[];
      json['options'].forEach((v) {
        options.add(RiskCheckerOptionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['question'] = question;
    data['description'] = description;
    data['type'] = type;
    data['id'] = id;
    if (options.isNotEmpty) {
      data['options'] = options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RiskCheckerOptionModel {
  late String image;
  late String title;
  late String subTitle;
  late int score;
  RiskCheckerOptionModel(
      {this.image = "", this.title = "", this.subTitle = "", this.score = 0});

  RiskCheckerOptionModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? "";
    title = json['title'] ?? "";
    subTitle = json['subTitle'] ?? "";
    score = json["score"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data["score"] = score;
    return data;
  }
}
