import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/icon_text_button.dart';

import '../../../../utils/nab_ids.dart';
class MedicationSetting extends StatelessWidget {
  MedicationSetting({super.key});
  bool isRepeatDaily = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Medications",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: HexColor("#3D3D3D"),
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return  Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Appcolors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.only(top: 25,left: 20,right: 20,bottom: 20), // Optional padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText("Medication Name",fontSize: 16,color: TextColors.neutral900,),
                  SizedBox(height: 8,),
                  medication_name(),

                  SizedBox(height: 24,),

                  AppText("Dosage Instructions", fontSize: 16, color: TextColors.neutral900),
                  const SizedBox(height: 8),
                  dosage(),
                  SizedBox(height: 24,),
                  AppText("Reminder Time", fontSize: 16, color: TextColors.neutral900),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return reminder_item(isRepeatDaily: isRepeatDaily);
                    },
                  ),
                  SizedBox(height: 24,),
                  IconTextButton(
                    svgAsset: AppIcons.editIcon,
                    text:"Edit details",
                    height: 50,
                    bordercolor: Appcolors.action,
                    textColor: TextColors.action,
                    backgroundColor: Appcolors.primary,
                    onTap: (){
                      Get.toNamed("/medication_edit",id: NavIds.profilenav);

                    },

                  )



                ],
              ),

          );
        },
      ),
    ),
    );
  }

  Container dosage() {
    return Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                      color: Appcolors.primary,
                      boxShadow: [
                  BoxShadow(
                  color:  TextColors.neutral900.withOpacity(0.09), // very soft shadow
                  offset: const Offset(0, 2),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
                  ),
                  child: Text(
                    "Take one tablet by mouth twice daily as needed for pain",
                    style: TextStyle(color: TextColors.neutral900,fontWeight: FontWeight.w500,fontSize: 14,fontFamily: "Satoshi"),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                );
  }

  Container medication_name() {
    return Container(
                  height: 45,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Appcolors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: TextColors.neutral900.withOpacity(0.09),
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        spreadRadius: 1,
                      )
                    ]
                  ),
                  child: const Text(
                    "Ibuprofen 800 mg",
                    style: TextStyle(color: TextColors.neutral900,fontWeight: FontWeight.w500,fontSize: 14,fontFamily: "Satoshi"),
                  ),
                );
  }

}

class reminder_item extends StatelessWidget {
  const reminder_item({
    super.key,
    required this.isRepeatDaily,
  });

  final bool isRepeatDaily;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
          color: Appcolors.primary,
          boxShadow: [
            BoxShadow(
              color: TextColors.neutral900.withOpacity(0.09),
              offset: Offset(0, 2),
              blurRadius: 6,
              spreadRadius: 1,
            )
          ]
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.clockIcon,width: 24,height: 24,color: TextColors.neutral500,),
          const SizedBox(width: 5),
          AppText("9:00 AM", fontSize: 16, color: TextColors.neutral900),
          Spacer(),
          AppText("Repeat Daily", fontSize: 16, color: TextColors.neutral900),
          Transform.scale(
            scale: 0.8, // 1.0 is default size; >1.0 to increase size; <1.0 to decrease
            child: CupertinoSwitch(
              value: isRepeatDaily,
              activeColor: Appcolors.action,
              trackColor: Appcolors.action,
              onChanged: (val) {
                // your onChanged logic here
              },
            ),
          ),


        ],
      ),
    );
  }
}

