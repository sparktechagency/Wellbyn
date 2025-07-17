import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/views/base/custom_button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/nab_ids.dart';
import '../../base/Apptext/app_text.dart';
import '../../base/icon_text_button.dart';
class AppoinetmentDetails extends StatelessWidget {
  const AppoinetmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Doctor History",
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
            Get.back(id: NavIds.appointment);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child:Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Appcolors.page,
              boxShadow: [
                BoxShadow(
                  color: TextColors.neutral500.withOpacity(0.25),
                  offset: const Offset(0, 0.3),
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/image/doctor_image.png'),
                      ),
                      const SizedBox(width: 10),
                      Expanded( // Add Expanded to prevent overflow
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
                                const Expanded( // Add Expanded to prevent overflow
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
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Text(
                        "Las appointment time",
                        style: TextStyle(
                          fontSize: 13,
                          color: TextColors.neutral500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child:Container(
                          height: 1,
                          decoration: BoxDecoration(
                            color: TextColors.neutral200,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.calenderIcon,
                        color: TextColors.neutral900,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 5),
                      const Text("16 May 2025"),
                      Spacer(),
                      const Text("10:25pm"),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.check,color: BorderColors.success,size: 14,),
                          AppText("Complete",color: BorderColors.success,fontSize: 14,),
                        ],
                      )
                    ],
                  ), // This marks the end of a Row widget that displays appointment details like date, time, and status.
                ),

                const SizedBox(height: 15),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reason for Visit",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: TextColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Need a cleaning",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: TextColors.neutral500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppText("Vital Signs",fontSize: 16,color: TextColors.neutral900,),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      AppText("Blood Pressure :",fontSize: 14,color: TextColors.neutral900,),
                      AppText(" 130/85 mmHg",fontSize: 14,color: TextColors.neutral500,),

                    ],
                  ),
                ),

                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      AppText("Heart Rate :",fontSize: 14,color: TextColors.neutral900,),
                      AppText(" 88 bpm",fontSize: 14,color: TextColors.neutral500,),

                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      AppText("Temperature :",fontSize: 14,color: TextColors.neutral900,),
                      AppText(" 100.20F",fontSize: 14,color: TextColors.neutral500,),

                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Diagnosis",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: TextColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Upper Respiratory Infection",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: TextColors.neutral500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What the Doctor Observed",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: TextColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Patient's medical history includes previous surgeries, allergies to penicillin, and a family history of diabetes. Current concerns involve persistent headaches and occasional dizziness .",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: TextColors.neutral500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What to Do Next?",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: TextColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Prescribed antibiotic course for 7 days, recommended rest and increased fluid intake.\n"
                            "Follow-up in 2 weeks\nif symptoms persist.",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: TextColors.neutral500,
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppText("Download Report" ,fontSize: 16,color: TextColors.neutral900,),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: IconTextButton(
                    text: "Download",
                    height: 40,
                    width: 130,
                    svgAsset: AppIcons.downloadIcon,
                    bordercolor: Appcolors.action,
                    textColor: Appcolors.action,
                    svgAssetcolor: Appcolors.action,
                    backgroundColor: Appcolors.primary,
                    onTap: () {

                  },),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      AppText("Temperature ",fontSize: 16,color: TextColors.neutral900,),
                      AppText(" -In 7 day",fontSize: 16,color: TextColors.action,),

                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomButton(
                    color: Appcolors.action,
                    fontSize: 16,
                    height: 50,
                    broderColor: Colors.transparent,
                    textColor:Appcolors.primary,
                    onTap: (){},
                    text: "Book Appointment ",),
                ),

                const SizedBox(height: 20),
                //Blood Pressure : 130/85 mmHg
                // Heart Rate : 88 bpm
                // Temperature : 100.20F
              ],
            ),
          ),

        ),
      ),
    );
  }
}
