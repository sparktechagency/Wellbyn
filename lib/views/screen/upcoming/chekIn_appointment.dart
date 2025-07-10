import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/controllers/profile_setting_controller.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/custom_button.dart';

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
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
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
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "Cardiology",
                        style: TextStyle(
                          fontSize: 14,
                          color: TextColors.neutral500,
                          fontFamily: "Satoshi",
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
                                fontFamily: "Satoshi",
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
                buildCheckItem('Yes'),
                SizedBox(width: 130,),
                buildCheckItem('No'),
              ],
            ),

            Container(
              width: 184,
              height: 84,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Appcolors.primary,
                border:Border.all(
                  width: 1,
                  color: TextColors.neutral200,
                ),
                borderRadius: BorderRadius.circular(8),
              ),child: Text("What?",style: TextStyle(fontFamily: "Satoshi",color: TextColors.neutral500,fontSize: 12,fontWeight: FontWeight.w500),),

            ),
            const SizedBox(height: 16,),

            AppText(
              "Are you currently taking any dental-related medications or antibiotics?",
              fontSize: 16,
              color: TextColors.neutral900,
            ),

            Row(
              children: [
                buildCheckItem('Yes'),
                SizedBox(width: 130,),
                buildCheckItem('No'),
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
    );
  }

  Widget buildCheckItem(String label) {
    return Obx(() => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          value: controller.checkin[label] ?? false,
          side: BorderSide(width: 1),
          onChanged: (_) => controller.togglecheck(label),
          activeColor: Colors.blue,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
      ],
    ));
  }

  Widget _buildCheckboxItem(
      String title,
      bool value,
      Function(bool?) onChanged,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2), // Reduced from 0 to 2 for minimal spacing
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            value: value,
            side: BorderSide(width: 1),
            onChanged: onChanged,
            activeColor: Colors.blue,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduces checkbox padding
            visualDensity: VisualDensity.compact, // Makes checkbox more compact
          ),
          const SizedBox(width: 6), // Reduced from 3 to 8 for better spacing between checkbox and text
          Expanded( // Added Expanded to prevent overflow and better text handling
            child: Text(
              title,
              style: TextStyle(fontSize: 14,fontFamily: "Satoshi", fontWeight: FontWeight.w500, color: TextColors.neutral900),
            ),
          ),
        ],
      ),
    );
  }
}
