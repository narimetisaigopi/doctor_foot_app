import 'package:drfootapp/utils/constants/string_constants.dart';

class FAQsModel {
  String title;
  String subTitle;
  FAQsModel({this.title = "", this.subTitle = ""});
}

List<FAQsModel> faqsList = [
FAQsModel(title: Strings.doctorQ1,subTitle: Strings.doctorQ1Ans),
FAQsModel(title: Strings.doctorQ2,subTitle: Strings.doctorQ2Ans),
FAQsModel(title: Strings.doctorQ3,subTitle: Strings.doctorQ3Ans),
FAQsModel(title: Strings.doctorQ4,subTitle: Strings.doctorQ4Ans),
FAQsModel(title: Strings.doctorQ5,subTitle: Strings.doctorQ5Ans),
FAQsModel(title: Strings.doctorQ6,subTitle: Strings.doctorQ6Ans),
FAQsModel(title: Strings.doctorQ7,subTitle: Strings.doctorQ7Ans),
FAQsModel(title: Strings.doctorQ8,subTitle: Strings.doctorQ8Ans),
FAQsModel(title: Strings.doctorQ9,subTitle: Strings.doctorQ9Ans),
FAQsModel(title: Strings.doctorQ10,subTitle: Strings.doctorQ10Ans),
];
