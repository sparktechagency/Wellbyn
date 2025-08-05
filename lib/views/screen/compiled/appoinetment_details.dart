import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/views/base/custombutton/custom_button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/nab_ids.dart';
import '../../base/Apptext/app_text.dart';
import '../../base/ContainerText/containertext.dart';
import '../../base/iconsTextbutton/icon_text_button.dart';
class AppoinetmentDetails extends StatelessWidget {
  const AppoinetmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Details History",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Inter",
            letterSpacing: 0.2,
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
              color: Appcolors.primary,
              boxShadow: [
                BoxShadow(
                  color: ShadowColor.shadowColors1.withOpacity(0.10),
                  offset: const Offset(0, 3),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                      children: [
                         GestureDetector(
                           onTap: (){
                             Get.toNamed("/doctor_profile",id: NavIds.appointment);

                           },
                           child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/image/doctor_image.png'),
                                                   ),
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
                                  fontSize: 20,
                                  letterSpacing: 0.2,
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
                                  const Expanded( // Add Expanded to prevent overflow
                                    child: Text(
                                      "Sylhet Health Center",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: TextColors.neutral900,
                                        fontFamily: "Inter",
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600,
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

                  const SizedBox(height: 15),
                   Row(
                      children: [
                        const Text(
                          "Las appointment time",
                          style: TextStyle(
                            fontSize: 14,
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
                  SizedBox(height: 8,),
                  Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.calenderIcon,
                          color: TextColors.primary2,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 5),
                        const Text("16 May 2025", style: TextStyle(
                          fontSize: 14,
                          color: TextColors.neutral900,
                          fontWeight: FontWeight.w500,
                        ),),
                        Spacer(),
                        const Text("10:25pm", style: TextStyle(
                          fontSize: 14,
                          color: TextColors.neutral900,
                          fontWeight: FontWeight.w500,
                        ),),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.check,color: BorderColors.success,size: 14,),
                            SizedBox(width: 4.w,),
                            AppText("Complete",color: BorderColors.success,fontSize: 14,),
                          ],
                        )
                      ],
                    ), // This marks the end of a Row widget that displays appointment details like date, time, and status.


                  const SizedBox(height: 15),

                  const SizedBox(height: 15),

                  LableTest("Reason for visit","Need a cleaning"),

                  const SizedBox(height: 24),
                  LableTest("Visit Type","New Patient Visit"),

                  const SizedBox(height: 24),
                  LableTest("Insurance","Blusky"),
                  const SizedBox(height: 24),
                  AppText("Vital Signs",fontWeight: FontWeight.w500,fontSize: 16,),
                  SizedBox(height: 8),
                  Column(
                      children: [
                        Row(
                          children: [
                            AppText("Blood Pressure :",fontSize: 15,color: TextColors.neutral900,),
                            AppText(" 130/85 mmHg",fontSize: 14,color: TextColors.neutral500,),

                          ],
                        ),
                        Row(
                          children: [
                            AppText("Heart Rate :",fontSize: 15,color: TextColors.neutral900,fontWeight: FontWeight.w500,),
                            AppText(" 88 bpm",fontSize: 14,color: TextColors.neutral500,),

                          ],
                        ),
                        Row(
                          children: [
                            AppText("Temperature:",fontSize: 15,color: TextColors.neutral900,fontWeight: FontWeight.w500,),
                            AppText("100.20F",fontSize: 14,color: TextColors.neutral500,),

                          ],
                        ),
                      ],
                    ),

                  const SizedBox(height: 24),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SOAP Notes",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            letterSpacing: 0.2,
                            color: TextColors.neutral900,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Subjective",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: 0.2,
                            color: TextColors.neutral900,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Containertext(text: "Patient presents for routine annual physical examination. Reports feeling well overall with no acute complaints. Denies chest pain, shortness of breath, or palpitations.",
                          Textcolor: TextColors.neutral500,

                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Objective",
                          style: TextStyle(
                            fontFamily: "Inter",
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: TextColors.neutral900,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Containertext(
                          text: "Vital signs stable. BP 120/80, HR 72, Temp 98.6°F. Physical examination unremarkable. Heart regular rate and rhythm, lungs clear bilaterally.",
                          Textcolor: TextColors.neutral500,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Assessment",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: TextColors.neutral900,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Containertext(text: "Healthy adult male for routine preventive care visit.",
                          Textcolor: TextColors.neutral500,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Plan",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: TextColors.neutral900,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Containertext(text: "Continue current lifestyle habits. Return in 1 year for annual physical. Labs ordered for screening.",
                          Textcolor: TextColors.neutral500,
                        ),
                      ],
                    ),

                  const SizedBox(height: 24),
                  AppText("Download Report" ,fontSize: 16,color: TextColors.neutral900,),

                  SizedBox(height: 8,),
                  IconTextButton(
                      text: "Download",
                      height: 40.h,
                      fontsize: 14,
                      width: 120.w,
                      svgAsset: AppIcons.downloadIcon,
                      bordercolor: Appcolors.action,
                      textColor: Appcolors.action,
                      svgAssetcolor: Appcolors.action,
                      backgroundColor: Appcolors.primary,
                      onTap: () {

                    },),


                  const SizedBox(height: 20),
                  // Row(
                  //     children: [
                  //       AppText("Temperature ",fontSize: 16,color: TextColors.neutral900,),
                  //       AppText(" -In 7 day",fontSize: 16,color: TextColors.action,),
                  //
                  //     ],
                  //   ),
                  //
                  // const SizedBox(height: 20),
                  // CustomButton(
                  //     color: Appcolors.action,
                  //     fontSize: 16,
                  //     height: 50,
                  //     broderColor: Colors.transparent,
                  //     textColor:Appcolors.primary,
                  //     onTap: (){},
                  //     text: "Book Appointment ",),
                  //
                  // const SizedBox(height: 20),
                  //Blood Pressure : 130/85 mmHg
                  // Heart Rate : 88 bpm
                  // Temperature : 100.20F
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }

  Column LableTest(String Lable,String text) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Lable,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 0.2,
                        color: TextColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      text,
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: TextColors.neutral500,
                      ),
                    ),
                  ],
                );
  }
}
