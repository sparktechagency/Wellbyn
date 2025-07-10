import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends GetxController {
  final SpeechToText speech;
  SpeechController({required this.speech});

  RxBool isListening = false.obs;
  TextEditingController textController = TextEditingController();

  void toggleListening() async {
    if (isListening.value) {
      await speech.stop();
      isListening.value = false;
    } else {
      if (!await speech.hasPermission) {
        isListening.value = false;
        print("Mic permission not granted.");
        return;
      }

      bool available = await speech.initialize(
        onStatus: (status) {
          print("Speech status: $status");
          if (status == 'done' || status == 'notListening') {
            isListening.value = false;
          }
        },
        onError: (error) {
          print("Speech error: $error");
          isListening.value = false;
        },
      );

      if (available) {
        isListening.value = true;
        speech.listen(
          onResult: (result) {
            textController.text = result.recognizedWords;
            textController.selection = TextSelection.fromPosition(
              TextPosition(offset: textController.text.length),
            );
          },
        );
      } else {
        print("Speech recognition not available.");
      }
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    toggleListening();
    super.onInit();
  }
}
