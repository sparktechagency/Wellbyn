import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
 late TextEditingController emailcontrller;

 @override
  void onInit() {
    // TODO: implement onInit
   emailcontrller = TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    emailcontrller.dispose();
    super.onClose();
  }
}
