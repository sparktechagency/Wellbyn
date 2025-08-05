import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/nab_ids.dart';
import '../../../base/Apptext/app_text.dart';
import '../../../base/custom_field.dart';
import '../../../base/iconsTextbutton/icon_text_button.dart';
class Support extends StatelessWidget {
   Support({super.key});

   TextEditingController  problemController = TextEditingController();
   TextEditingController  messageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Support ",
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back(id: NavIds.profilenav);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText("Subject", fontSize: 17, color: TextColors.neutral900,),
            SizedBox(height: 8,),

            CustomTextField(
              hintText: 'Write problem...',
              controller: problemController,
              filColor: Appcolors.primary,
            ),

            SizedBox(height: 20,),
            AppText("Message", fontSize: 17, color: TextColors.neutral900,),
            SizedBox(height: 5,),
            Text(
                "Please provide a more detailed explanation of your message.",
                style: TextStyle(
                  fontSize: 14,
                  color: TextColors.neutral500,
                  fontWeight: FontWeight.w400,
                )
            ),
            SizedBox(height: 5,),
            CustomTextField(
              maxLines: 5,
              hintText: 'Type here ...',
              controller: messageController,
              filColor: Appcolors.primary,
            ),
            SizedBox(height: 20,),
            IconTextButton(
              onTap: () {
               print("Click");
               Get.toNamed("/support_send",
                   id: NavIds.profilenav);
              },
              backgroundColor: Appcolors.action,
              textColor: Colors.white,
              svgAsset: AppIcons.navigationIcon,
              text: "Send to app admin",
              height: 45,
            ),

          ],
        ),
      ),
    );
  }
}
