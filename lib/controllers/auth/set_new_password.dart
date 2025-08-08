import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetNewPasswordController extends GetxController{
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

  @override
  void onClose() {
    // TODO: implement onClose
    passwordcontroller.dispose();
    confirmcontroller.dispose();
    super.onClose();
  }
}