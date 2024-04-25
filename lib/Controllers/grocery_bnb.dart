// ViewController.dart

import 'package:get/get.dart';

class ViewController extends GetxController {
  var tabIndex = 0.obs;

  void tabSelectedIndex(int index) {
    tabIndex.value = index;
  }
}
