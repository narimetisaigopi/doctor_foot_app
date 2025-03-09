import 'dart:convert';

import 'package:drfootapp/main.dart';
import 'package:drfootapp/models/partner_model.dart';

class SPHelper {
  static setUser(PartnerModel userModel) async {
    userModel.timestamp = "";
    userModel.modifiedAt = "";
    userModel.modifiedAt = "";
    await sharedPreferences.setString(
        "partner_login", jsonEncode(userModel.toJson()));
  }

  static removeUser() async {
    await sharedPreferences.setString("partner_login", "");
  }

  static PartnerModel? getUser() {
    String str = sharedPreferences.getString("partner_login") ?? "";
    if (str.isEmpty) return null;
    return PartnerModel.fromJson((jsonDecode(str) as Map));
  }

  bool isIntroSeen() {
    return sharedPreferences.getBool("isIntroSeen") ?? false;
  }

  setIntroSeen() {
    sharedPreferences.setBool("isIntroSeen", true);
  }

  clear() async {
    await removeUser();
    await sharedPreferences.clear();
  }
}
