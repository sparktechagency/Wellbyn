import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:signature/signature.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/screen/doctor/doctor_details.dart';

import '../../../utils/nab_ids.dart';
import '../../../utils/row_with_tittle.dart';
import '../../base/DataShow/textshow.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: TextColors.neutral900,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: TextColors.neutral100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.Notification02,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: Appcolors.page,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 16, left: 20.w, right: 16.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/image/doctor_image.png"),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hi, Mahmud",
                      style: TextStyle(
                        fontSize: 16,
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "Personal account",
                      style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                        color: TextColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              HeyText(),
              SizedBox(height: 20,),

              RowWithTitleAndAction(
                title: "Next Appointment",
                actionText: "View all",
                onTap: () {
                  print("View all tapped");
                },
                titleColor: TextColors.neutral900,
                actionColor: TextColors.action,
                titleFontSize: 20,
                actionFontSize: 16,
              ),

              SizedBox(height: 15,),
              Nextappointmentdoctor(),
              SizedBox(height: 15,),

              RowWithTitleAndAction(
                title: "Available Doctor",
                actionText: "View all",
                onTap: () {
                  print("View all tapped");
                },
                titleColor: TextColors.neutral900,
                actionColor: TextColors.action,
                titleFontSize: 20,
                actionFontSize: 16,
              ),

              SizedBox(height: 15,),

              //================> available doctor list <=====================//

              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.56,
                  ),
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return  GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/doctor_details',
                          id: NavIds.profile, // this matches nested key
                          arguments: {
                            'doctorId': 'a1da1dad136adf4566adf1a',
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: ShadowColor.shadowColors1.withOpacity(0.10),
                              blurRadius: 4,
                              // reasonable softness
                              spreadRadius: 0,
                              offset: Offset(0, 3), // downward shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/image/doctor_image.png",
                                    height: 140.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: SvgPicture.asset(
                                      "assets/icons/Heart.svg",
                                      width: 20,
                                      height: 20,
                                      colorFilter: ColorFilter.mode(
                                        TextColors.neutral900,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "Dr. Leo Marwick",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: TextColors.neutral900,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Text(
                              "Heart Health Expert",
                              style: TextStyle(
                                color: TextColors.neutral500,
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.hospitallocationIcon,
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    Appcolors.action,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    "Sylhet Health Center",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: "Inter",
                                      color: TextColors.neutral900,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Text(
                                    "3 available time",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: TextColors.neutral900,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  AppIcons.shearIcon,
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    TextColors.neutral900,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Container HeyText() {
    return Container(
              height: 116,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: HexColor("#FBF7EB"),
                boxShadow:[
                  BoxShadow(
                    color: ShadowColor.shadowColors1.withOpacity(0.10),
                    offset: Offset(0, 3),
                    blurRadius: 4,
                    spreadRadius: 0
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText("Hey!", fontSize: 16, color: TextColors.neutral900,fontWeight: FontWeight.w700,),
                    SizedBox(height: 4,),

                    Text(
                      "Make sure your profile is at least 70% complete before you can book an appointment.",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        AppText(
                          "Start",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: TextColors.action,
                        ),
                        SizedBox(width: 4),
                        // optional spacing between text and icon
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: TextColors.action,
                          size: 16, // this replaces your invalid `weight` property
                        ),
                      ],
                    )

                  ],
                ),
              ),
            );
  }

  Container Nextappointmentdoctor() {
    return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolors.primary,
                boxShadow: [
                  BoxShadow(
                    color: ShadowColor.shadowColors1.withOpacity(0.10),
                    offset: const Offset(0, 3),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              'assets/image/doctor_image.png'),
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
                                  SvgPicture.asset(
                                      AppIcons.hospitallocationIcon),
                                  const SizedBox(width: 5),
                                  const Expanded( // Add Expanded to prevent overflow
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
                        _iconButton(AppIcons.chatIcon, Appcolors.action),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const Text(
                          "Date & time",
                          style: TextStyle(
                            fontSize: 13,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
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
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.calenderIcon,
                          color: TextColors.neutral900,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 5),
                        const Text("Today"),
                        Spacer(),
                        SvgPicture.asset(AppIcons.clockIcon),
                        const Text("10:25pm",style: TextStyle(fontSize: 13),),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.circle, color: Color(0xff38c976) , size: 13,),
                            SizedBox(width: 3,),
                            AppText("Confirmed", color: TextColors.neutral900,
                              fontSize: 13,),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child:AppText(
                      "Visit Type",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TextColors.neutral900,),
                  ),
                  SizedBox(height: 6.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextshowData(
                      text: "Tap to select",
                      height: 50.h,
                      color: Appcolors.primary,
                      onTap: () {
                        print("Tapped");
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            );
  }

  Widget _iconButton(String iconAsset, Color bgColor,
      {Color? borderColor, Color? iconColor}) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: bgColor,
        border: borderColor != null ? Border.all(color: borderColor) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: SvgPicture.asset(
          iconAsset,
          height: 20,
          width: 20,
          color: iconColor,
        ),
      ),
    );
  }

}
