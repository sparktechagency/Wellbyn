import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/utils/nab_ids.dart';

import '../../../controllers/message.dart';
import '../../../utils/app_colors.dart';

class DoctorMessage extends StatelessWidget {
   DoctorMessage({super.key});

  final ChatController chatController = Get.put(ChatController());
   DateTime dateTime = DateTime.now();
   DateFormat format = DateFormat("a mm ss");
   late String formatted = format.format(dateTime);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        elevation: 0,
        leading:IconButton(
          onPressed: () {

            Get.toNamed("/doctor_details",id: NavIds.profile);

          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: false,
        actions: [

         Spacer(),
          SizedBox(width: 10,),
          SizedBox(width: 10,),
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/image/doctor_image.png",
                  height: 50.h,
                  width: 50.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Rosdeb Koch",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w600,
                      color: TextColors.neutral900,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: BorderColors.success,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Online",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          color: BorderColors.success,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Spacer(),
          ClipOval(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: HexColor("#e8e8e8"),
                boxShadow: [
                  BoxShadow(
                    color: TextColors.neutral900.withOpacity(0.10),
                    blurRadius: 1,
                    offset: Offset(0, 0.3),
                  ),
                ],
              ),
              child: Image.asset(
                scale: 2,
                "assets/image/camera.png",
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 10,),
          ClipOval(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: HexColor("#e8e8e8"),
              ),
              child: Icon(
                Icons.call_sharp,
                size: 24.sp,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 20,),

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              padding: EdgeInsets.all(16),
              controller: chatController.scrollController,
              itemCount: chatController.message.length,
              itemBuilder: (context, index) {
                final msg = chatController.message[index];
                final DateTime msgTime = msg['timestamp'] ?? DateTime.now();
                final String formatted = DateFormat("a hh:mm:ss").format(msgTime);

                return Align(
                  alignment: msg['isMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75, // Limit width
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: msg['isMe'] ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: msg['isMe'] ? Radius.circular(16) : Radius.circular(4),
                          bottomRight: msg['isMe'] ? Radius.circular(4) : Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: msg['isMe']
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            msg['text'],
                            style: TextStyle(
                              color: msg['isMe'] ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                formatted,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: msg['isMe']
                                      ? Colors.white.withOpacity(0.7)
                                      : Colors.grey.shade600,
                                ),
                              ),
                              if (msg['isMe']) ...[
                                SizedBox(width: 4),
                                Icon(
                                  msg['isRead'] == true
                                      ? Icons.done_all  // Double check for read
                                      : Icons.done,     // Single check for sent
                                  size: 16,
                                  color: msg['isRead'] == true
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.7),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){

                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.camera_alt_outlined, color: Colors.blue   ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    maxLines: 3,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    controller: chatController.messageCtrl,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: chatController.sendMessage,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }




}