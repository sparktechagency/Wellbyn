import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_constants.dart';

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
            letterSpacing: 0.2,
            fontSize: 20,
            fontFamily: AppConstants.FONT_FAMILY,
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
            SizedBox(height: 16,),
            AppText("Subject", fontSize: 16, color: TextColors.neutral900,fontWeight: FontWeight.w500,),
            SizedBox(height: 8,),

            CustomTextField(
              hintText: 'Write problem...',
              controller: problemController,
              filColor: Appcolors.primary,
            ),

            SizedBox(height: 24,),
            AppText("Message", fontSize: 17, color: TextColors.neutral900,),
            SizedBox(height: 8,),
            Text(
                "Please provide a more detailed explanation of your message.",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0.2,
                  fontFamily: AppConstants.FONT_FAMILY,
                  color: TextColors.neutral500,
                  fontWeight: FontWeight.w500,
                )
            ),
            SizedBox(height: 8,),
            CustomTextField(
              maxLines: 5,
              hintText: 'Type here ...',
              controller: messageController,
              filColor: Appcolors.primary,
            ),
            SizedBox(height: 24,),
            IconTextButton(
              onTap: () {

               Get.toNamed("/support_send", id: NavIds.profilenav);
              },
              backgroundColor: Appcolors.action,
              textColor: Colors.white,
              svgAsset: AppIcons.navigationIcon,
              text: "Send",
              fontsize: 16,
              height: 50,
            ),

          ],
        ),
      ),
    );
  }
}
