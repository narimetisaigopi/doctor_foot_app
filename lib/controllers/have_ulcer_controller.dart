import 'package:get/get.dart';

class HaveUlcerController extends GetxController {
  bool isLoading = false;
  

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }
}
