import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationController extends GetxController {
  late String selectedLanguage = "en";
  void loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLanguage = prefs.getString('selectedLanguage') ?? 'en';
    update();
  }

  Future<void> saveSelectedLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', languageCode);
    update();
  }
}
