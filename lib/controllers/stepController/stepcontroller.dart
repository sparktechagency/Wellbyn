import 'package:get/get.dart';

class StepController extends GetxController {
  RxBool isStep2Active = false.obs;
  RxBool hasAnimated = false.obs;

  void onLineAnimationComplete() {
    if (!hasAnimated.value) {
      hasAnimated.value = true;
      Future.delayed(Duration(milliseconds: 100), () {
        isStep2Active.value = true;
      });
    }
  }

  void resetForNewPage() {
    hasAnimated.value = false;
    isStep2Active.value = false;
  }

  void startAnimationSequence() {

  }

}