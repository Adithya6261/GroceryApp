import 'package:get/get.dart';

class ToggleController extends GetxController{
  var isDebitSelected = true.obs;

  void toggleSwitch(bool isDebit) {
    isDebitSelected.value = isDebit;
  }
}