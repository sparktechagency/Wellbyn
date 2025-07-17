import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/custom_button.dart';
import 'package:wellbyn/views/screen/profile/add_insurance.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/nab_ids.dart';
import '../../../base/icon_text_button.dart';
import 'medicationsetting.dart';

class MedicationEdit extends StatefulWidget {
  MedicationEdit({super.key});

  @override
  State<MedicationEdit> createState() => _MedicationEditState();
}

class _MedicationEditState extends State<MedicationEdit> {
  final TextEditingController medicineName = TextEditingController();
  final MedicationController _controller = Get.put(MedicationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Edit Medications",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(

          width: double.infinity,
          margin: EdgeInsets.only(left: 20,right: 20,bottom: 25),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Appcolors.primary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: TextColors.neutral900.withOpacity(0.09),
                offset: const Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText("Medication Name", fontSize: 16, color: TextColors.neutral900),
              SizedBox(height: 8),
              medication_name(),

              SizedBox(height: 24),

              AppText("Dosage Instructions", fontSize: 16, color: TextColors.neutral900),
              const SizedBox(height: 8),
              dosage(),

              SizedBox(height: 24),

              AppText("Reminder Time", fontSize: 16, color: TextColors.neutral900),
              SizedBox(height: 8),

            Obx((){
            return ListView.builder(
              itemCount: _controller.reminderItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = _controller.reminderItems[index];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedContainer(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Appcolors.primary,
                        boxShadow: [
                          BoxShadow(
                            color: TextColors.neutral900.withOpacity(0.09),
                            offset: Offset(0, 2),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      duration: Duration(milliseconds: 300),

                      child: Row(

                        children: [
                          SvgPicture.asset(
                            AppIcons.clockIcon,
                            width: 22,
                            height: 22,
                            color: TextColors.neutral500,
                          ),
                          SizedBox(width: 6,),
                          SizedBox(
                            width: 70.w,
                            child: AppText(
                              item.time,
                              fontSize: 15.h,
                              color: TextColors.neutral900, // Center the time text inside the box
                            ),
                          ),
                          AppText("Repeat Daily",fontSize: 15.h,color: TextColors.neutral900,),
                          Transform.scale(
                            scale: 0.7.h,
                            child: CupertinoSwitch(
                              value:item.isRepeatDaily,
                              activeColor: Appcolors.action,
                              onChanged: (val) => _controller.toggleRepeat(index, val),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 6.h,),
                    GestureDetector(
                      onTap:(){
                        _controller.reminderItems.removeAt(index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 38,
                        width: 38,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: TextColors.neutral100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.delete02Icon,
                          height: 16,
                          width: 16,
                          color: BorderColors.error700,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
            }),


             SizedBox(height: 24),
              IconTextButton(
                fontsize: 16,
                svgAsset: AppIcons.addIcon02,
                text: "Add Another Reminder Time",
                height: 50,
                bordercolor: Appcolors.action,
                textColor: TextColors.action,
                backgroundColor: Appcolors.primary,
                onTap: () {
                  _controller.pickTime(context);
                },
              ),
              SizedBox(height: 24),

              CustomButton(
                onTap: () {
                  // Handle save functionality
                  print("Saving medication changes...");
                },
                text: "Save Change",
                color: Appcolors.action,
                height: 50,
                fontSize: 16,
                textColor: Appcolors.primary,
                broderColor: Colors.transparent,
              ),

            ],
          ),
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
            color: TextColors.neutral900.withOpacity(0.09),
            offset: const Offset(0, 2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        "Take one tablet by mouth twice daily as needed for pain",
        style: TextStyle(
            color: TextColors.neutral900,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: "Satoshi"
        ),
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
        style: TextStyle(
            color: TextColors.neutral900,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: "Satoshi"
        ),
      ),
    );
  }
}

// Data model for reminder items
class ReminderItem {
  String time;
  bool isRepeatDaily;

  ReminderItem({required this.time, required this.isRepeatDaily});
}

// Separate widget for reminder items
class MedicationController extends GetxController {
  RxList<ReminderItem> reminderItems = <ReminderItem>[
    ReminderItem(time: "9:00 AM", isRepeatDaily: true),
    ReminderItem(time: "9:00 PM", isRepeatDaily: false),
  ].obs;

  var selectedTime = "".obs;

  void toggleRepeat(int index, bool newValue) {
    reminderItems[index].isRepeatDaily = newValue;
    reminderItems.refresh(); // Notify UI
  }

  Future<void> pickTime(BuildContext context)async{
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(picked != null){
      final formattedTime = picked.format(context);
      selectedTime.value = formattedTime;

      reminderItems.insert(
        0, // insert at start; or use .add(formattedTime) for end
        ReminderItem(time: formattedTime, isRepeatDaily: true),
      );
    }
  }
}