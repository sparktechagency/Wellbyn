import 'package:get/get.dart';

class TabControllerX extends GetxController {
  var selectedIndex = 0.obs;

  void setTab(int index) {
    selectedIndex.value = index;
  }
}