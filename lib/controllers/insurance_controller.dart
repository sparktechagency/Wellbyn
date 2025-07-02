import 'package:get/get.dart';

class InsuranceController extends GetxController{
  RxBool isLoading = false.obs;

  void startLoading() {
    isLoading.value = true;
    // Simulate delay (e.g. API call)
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }
}