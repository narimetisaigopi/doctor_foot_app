import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddressesController extends GetxController {
  TextEditingController localityController = TextEditingController();
  TextEditingController streetNoController = TextEditingController();
  TextEditingController alternateMobileNumberController =
      TextEditingController();
  TextEditingController addressLabelController = TextEditingController();
}
