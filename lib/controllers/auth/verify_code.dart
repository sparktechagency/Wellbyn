import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController{
  final TextEditingController pinController = TextEditingController();
  RxString otpCode = ''.obs;

  @override
  void onClose() {
    // TODO: implement onClose
    pinController.dispose();
    super.onClose();
  }

}