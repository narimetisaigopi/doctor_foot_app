import 'package:drfootapp/main.dart';

class SPHelper {
  bool isIntroSeen() {
    return sharedPreferences.getBool("isIntroSeen") ?? false;
  }

  setIntroSeen() {
    sharedPreferences.setBool("isIntroSeen", true);
  }

  clear() async {
    await sharedPreferences.clear();
  }
}
