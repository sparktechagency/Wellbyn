import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  // Each tab will have its own Navigator
  final List<GlobalKey<NavigatorState>> navigatorKeys = List.generate(
    4,
        (_) => GlobalKey<NavigatorState>(),
  );

  void selectTab(int index) {
    if (selectedIndex.value == index) {
      // Pop to first route if already on the tab
      navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      selectedIndex.value = index;
    }
  }

  // Optional: Global access to pop
  Future<bool> onWillPop() async {
    final isFirstRoute =
    !await navigatorKeys[selectedIndex.value].currentState!.maybePop();
    return isFirstRoute;
  }
}
