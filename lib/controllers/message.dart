import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatController extends GetxController {
  var message = <Map<String, dynamic>>[].obs;
  final messageCtrl = TextEditingController();
  final scrollController = ScrollController();

  void sendMessage() {
    final text = messageCtrl.text.trim();
    if (text.isNotEmpty) {
      message.add({"text": text, "isMe": true});
      messageCtrl.clear();
      Future.delayed(Duration(milliseconds: 100), () {
        if (scrollController.hasClients) {
          scrollController.animateTo(scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOutSine);
        }
      });
    }
  }
}