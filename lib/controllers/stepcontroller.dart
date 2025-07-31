import 'package:get/get.dart';

// class StepController extends GetxController {
//   RxBool showText = false.obs;
//   RxBool isStep2Active = false.obs;
//   RxBool hasAnimated = false.obs; // Tracks if animation completed
//
//   @override
//   void onReady() {
//     super.onReady();
//     if (!hasAnimated.value) {
//       resetSteps();
//     }
//   }
//
//   void resetSteps() {
//     showText.value = false;
//     isStep2Active.value = false;
//     // DON'T reset hasAnimated here to prevent replay
//   }
//
//   void startAnimationSequence() {
//     if (!hasAnimated.value) {
//       resetSteps();
//       Future.delayed(Duration(milliseconds: 300), () {
//         isStep2Active.value = true;
//         hasAnimated.value = true; // Mark as completed
//       });
//     }
//   }
// }


// FIXED StepController
class StepController extends GetxController {
  RxBool isStep2Active = false.obs;
  RxBool hasAnimated = false.obs;

  // This will be called by AnimatedLine when animation completes
  void onLineAnimationComplete() {
    if (!hasAnimated.value) {
      hasAnimated.value = true;
      // Activate step 2 after line animation completes
      Future.delayed(Duration(milliseconds: 100), () {
        isStep2Active.value = true;
      });
    }
  }

  void resetForNewPage() {
    hasAnimated.value = false;
    isStep2Active.value = false;
  }

  // Remove this method since we don't need it anymore
  void startAnimationSequence() {

    // Animation starts automatically when AnimatedLine is created

  }
}