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
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/screen/doctor/doctor_details.dart';

import '../../../utils/nab_ids.dart';
import '../../../utils/row_with_tittle.dart';

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
            padding: EdgeInsets.only(top: 20, left: 20.w, right: 16.w),
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
                      "Dr. Sarah Smith",
                      style: TextStyle(
                        fontSize: 18,
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Satoshi",
                      ),
                    ),
                    Text(
                      "Personal account",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Satoshi",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 116,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: HexColor("#FBF7EB"),
                  border: Border.all(width: 1, color: HexColor("#93531F")),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText("Hey", fontSize: 16, color: TextColors.neutral900),
                      SizedBox(height: 4,),

                      Text(
                        "Make sure your profile is at least 70% complete before you can book an appointment.",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4,),
                      Row(
                        children: [
                          AppText(
                            "Start",
                            fontSize: 16,
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
              ),
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
              Container(
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                    SvgPicture.asset(
                                        AppIcons.hospitallocationIcon),
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
                      child: Row(
                        children: [
                          const Text(
                            "Can't make it on this date?",
                            style: TextStyle(
                              fontSize: 13,
                              color: TextColors.neutral500,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color:Appcolors.success50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1,
                                color:Appcolors.action,
                              )
                            ),
                            height: 40,
                            width: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppIcons.exchange01Icon),
                                SizedBox(width: 6,),
                                const Text(
                                  "Re-schedule",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Satoshi",
                                    color: TextColors.action,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Spacer(),

                          const Text(
                            "OR",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Satoshi",
                              color: TextColors.neutral500,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),

                          const Text(
                            "Cancel",
                            style: TextStyle(
                              fontFamily: "Satoshi",
                              fontSize: 16,
                              color: BorderColors.error700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Spacer(),
                          Spacer(),


                        ],
                      ),
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
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

                 GridView.count(
                   shrinkWrap: true,
                    physics: PageScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.58,
                    children: List.generate(9, (index) {
                      return GestureDetector(
                        onTap: () {
                          // Debug: Print when tapped
                          print("Doctor card tapped - Index: $index");

                          try {
                            // Method 1: Try simple navigation first
                            Get.toNamed('/doctor_details', arguments: {
                              'doctorId': 'doctor_${index}_id',
                              'doctorName': 'Dr. Leo Marwick',
                              'specialization': 'Heart Health Expert',
                            });

                            print("Navigation called successfully");
                          } catch (e) {
                            print("Navigation error: $e");

                            // Method 2: Alternative navigation if the above fails
                            try {

                              Get.toNamed(
                                '/doctor_details',
                                id: NavIds.home, // this matches nested key
                                arguments: {
                                  'doctorId': 'a1da1dad136adf4566adf1a',
                                },
                              );

                            } catch (e2) {
                              print("Alternative navigation also failed: $e2");

                              // Method 3: Show snackbar as fallback
                              Get.snackbar(
                                "Navigation",
                                "Doctor details page would open here",
                                backgroundColor: Colors.blue,
                                colorText: Colors.white,
                              );
                            }
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Appcolors.secondary,
                                // softer effect
                                blurRadius: 2,
                                // reasonable softness
                                spreadRadius: 2,
                                offset: Offset(0.2, 0.2), // downward shadow
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
                                    fontFamily: 'Satoshi',
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
                                  fontFamily: 'Satoshi',
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
                                        fontFamily: "Satoshi",
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
                                        fontFamily: 'Satoshi',
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
                    }),
                  ),


            ],
          ),
        ),
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
