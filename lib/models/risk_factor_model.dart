class RiskFactorModel {
  late String image;
  late String question;
  late String description;
  late String type;
  late List<RiskFactorOptionModel> options;
  late int id;
  RiskFactorOptionModel? selectedOption;

  RiskFactorModel({
    this.image = "",
    this.question = "",
    this.description = "",
    this.type = "",
    this.options = const [],
    this.id = 0,
  });

  RiskFactorModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? "";
    question = json['question'] ?? "";
    description = json['description'] ?? "";
    type = json['type'] ?? "";
    id = json['id'] ?? 0;
    if (json['options'] != null) {
      options = <RiskFactorOptionModel>[];
      json['options'].forEach((v) {
        options.add(RiskFactorOptionModel.fromJson(v));
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

class RiskFactorOptionModel {
  late String image;
  late String title;
  late String subTitle;

  RiskFactorOptionModel({this.image = "", this.title = "", this.subTitle = ""});

  RiskFactorOptionModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? "";
    title = json['title'] ?? "";
    subTitle = json['subTitle'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['subTitle'] = subTitle;
    return data;
  }
}
