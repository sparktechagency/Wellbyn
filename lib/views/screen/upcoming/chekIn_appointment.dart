import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/controllers/profile_setting_controller.dart';
import 'package:wellbyn/utils/nab_ids.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/custombutton/custom_button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';

class ChekinAppointment extends StatelessWidget {
  ChekinAppointment({super.key});

  final ProfileSettingController controller = Get.put(
    ProfileSettingController(),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Check In",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back(id:NavIds.appointment);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                "Dental Medicine",
                fontSize: 20,
                color: TextColors.neutral900,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/image/doctor_image.png'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    // Add Expanded to prevent overflow
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Dr. Moule Marrk",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "Cardiology",
                          style: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.hospitallocationIcon),
                            const SizedBox(width: 5),
                            const Expanded(
                              // Add Expanded to prevent overflow
                              child: Text(
                                "Sylhet Health Center",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: TextColors.neutral900,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              AppText(
                "Are you currently experiencing any of the following?",
                fontSize: 16,
                color: TextColors.neutral900,
              ),
              SizedBox(height: 8),
              Obx(() => Wrap(
                spacing: 16,
                runSpacing: 8,
                children: controller.symptoms.entries.map((entry) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 28,
                    child: _buildCheckboxItem(
                      entry.key,
                      entry.value,
                          (_) => controller.toggleSymptom(entry.key),
                    ),
                  );
                }).toList(),
              )),
              SizedBox(height: 16),
              AppText(
                "Have you had any changes in your oral health since your last visit?",
                fontSize: 16,
                color: TextColors.neutral900,
              ),
        
              Row(
                children: [
                  Expanded(child: buildCheckItem('Yes')),
                  SizedBox(width: 130,),
                  Expanded(child: buildCheckItem('No')),
                ],
              ),
        
              Container(
                width: 184,
                height: 84,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Appcolors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: ShadowColor.shadowColors1.withOpacity(0.10),
                      offset: Offset(0,3),
                      blurRadius: 4,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),child: Text("What?",style: TextStyle(fontFamily: "Inter",color: TextColors.neutral500,fontSize: 12,fontWeight: FontWeight.w500),),
        
              ),
              const SizedBox(height: 16,),
        
              AppText(
                "Are you currently taking any dental-related medications or antibiotics?",
                fontSize: 16,
                color: TextColors.neutral900,
              ),
        
              Row(
                children: [
                  Expanded(child: buildCheckItem('Yes')),
                  SizedBox(width: 130,),
                  Expanded(child: buildCheckItem('No')),
                ],
              ),
        
              SizedBox(height: 16),
        
              CustomButton(
                  color: TextColors.action,
                  broderColor: TextColors.action,
                  fontSize: 16,
                  textColor: Appcolors.primary,
                  onTap: (){},
                  text: "Submit Check -in"),
        
            ],
          ),
        ),
      ),
    );
  }
// value: controller.checkin[label] ?? false,
  // onChanged: (_) => controller.togglecheck(label),
  //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

  Widget buildCheckItem(String label) {
    return Obx(() => Container(
      decoration: BoxDecoration(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      // Reduced from 0 to 2 for minimal spacing
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Appcolors.primary,
              boxShadow: [
                BoxShadow(
                  color: ShadowColor.shadowColors1.withOpacity(0.10),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 3),
                  blurStyle: BlurStyle.normal,
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Transform.scale(
              scale: 1.1, // 1.0 = default size, increase for bigger checkbox
              child: Checkbox(
                value: controller.checkin[label] ?? false,
                onChanged: (_) => controller.togglecheck(label),
                activeColor: Appcolors.action,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: BorderSide(color: Appcolors.primary, width: 0),
              ),
            ),
          ),

          const SizedBox(width: 8),
          // Reduced from 3 to 8 for better spacing between checkbox and text
          Expanded(
            // Added Expanded to prevent overflow and better text handling
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
                color: TextColors.neutral900,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildCheckboxItem(
      String title,
      bool value,
      Function(bool?) onChanged,
      ) {
    return Container(
      decoration: BoxDecoration(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      // Reduced from 0 to 2 for minimal spacing
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Appcolors.primary,
              boxShadow: [
                BoxShadow(
                  color: ShadowColor.shadowColors1.withOpacity(0.10),
                  blurRadius: 2,
                  spreadRadius: 0,
                  offset: Offset(0, 3),
                  blurStyle: BlurStyle.normal,
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Transform.scale(
              scale: 1.1, // 1.0 = default size, increase for bigger checkbox
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: Appcolors.action,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: BorderSide(color: Appcolors.primary, width: 0),
              ),
            ),
          ),

          const SizedBox(width: 8),
          // Reduced from 3 to 8 for better spacing between checkbox and text
          Expanded(
            // Added Expanded to prevent overflow and better text handling
            child: Text(
              title,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
                color: TextColors.neutral900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
