import 'package:drfootapp/utils/constants/constants.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart' as filePicker;

class RecordsController extends GetxController {
  bool isLoading = false;

  void _updateLoading(bool loading) {
    isLoading = loading;
    update();
  }

  uploadRecord() async {
    try {
      _updateLoading(true);
      filePicker.FilePickerResult? result = await filePicker.FilePicker.platform
          .pickFiles(
              allowMultiple: false,
              type: filePicker.FileType.custom,
              allowedExtensions: ["pdf", "png", "jpg", "jpeg"]);
    } catch (e) {
      logger("uploadRecord $e");
      Utility.toast("failed to upload record $e");
    } finally {
      _updateLoading(false);
    }
  }
}
