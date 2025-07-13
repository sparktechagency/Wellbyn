import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ScrollControllerGetX extends GetxController {
  RxBool isProgressVisible = true.obs;
  late ScrollController scrollController;
  RxBool isProgressVisible1 = true.obs;
  late ScrollController scrollController1;
  RxBool isProgressVisible2 = true.obs;
  late ScrollController scrollController2;

  // Initialize in constructor to avoid LateInitializationError
  ScrollControllerGetX() {
    scrollController = ScrollController();
    scrollController1 = ScrollController();
    scrollController2 = ScrollController();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    scrollController1.addListener(_scrollListener1);
    scrollController2.addListener(_scrollListener2);
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (isProgressVisible.value) {
        isProgressVisible.value = false;
      }
    } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (!isProgressVisible.value) {
        isProgressVisible.value = true;
      }
    }
  }

  void _scrollListener1() {
    if (scrollController1.position.userScrollDirection == ScrollDirection.reverse) {
      if (isProgressVisible1.value) {
        isProgressVisible1.value = false; // Fixed: was isProgressVisible.value = false
      }
    } else if (scrollController1.position.userScrollDirection == ScrollDirection.forward) {
      if (!isProgressVisible1.value) {
        isProgressVisible1.value = true;
      }
    }
  }

  void _scrollListener2() {
    if (scrollController2.position.userScrollDirection == ScrollDirection.reverse) {
      if (isProgressVisible2.value) {
        isProgressVisible2.value = false; // Fixed: was isProgressVisible.value = false
      }
    } else if (scrollController2.position.userScrollDirection == ScrollDirection.forward) {
      if (!isProgressVisible2.value) {
        isProgressVisible2.value = true;
      }
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    scrollController1.dispose();
    scrollController2.dispose();
    super.onClose();
  }
}