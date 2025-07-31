import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/views/screen/canceled/canceled.dart';
import 'package:wellbyn/views/screen/compiled/compeleted.dart';
import 'package:wellbyn/views/screen/upcoming/upcoming.dart';

import '../../../controllers/appointment/appointment.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nab_ids.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final AppointmentController appointmentController = Get.put(AppointmentController());

  final List<String> tabs = ["Upcoming", "Completed", "Canceled"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "My Appointment's",
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            color: HexColor("#3D3D3D"),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed:(){},
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Appcolors.page,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(tabs.length, (index) {
                        return Obx(() {
                          bool isSelected = appointmentController.selectedIndex.value == index;
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => appointmentController.changeTab(index),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 10.h,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: isSelected ? 14.1.sp : 14.sp,
                                        fontWeight: isSelected ? FontWeight.w500 : FontWeight.w500,
                                        color: isSelected ? TextColors.action : TextColors.secondary,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: tabs[index],
                                          // Same style as above or customize if you want
                                        ),
                                        TextSpan(
                                          text: ' (12)', // or dynamic count here
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: isSelected ? TextColors.action.withOpacity(0.7) : TextColors.secondary,
                                            fontSize: isSelected ? 14.1.sp : 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 9.h),
                                  Container(
                                    height: 2.h,
                                    width: isSelected ? 100.w : 0.w,
                                    color: isSelected ? TextColors.action : Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      }),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 1.h,
                      color: Appcolors.disabled.withOpacity(0.88),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Obx(() {
                  switch (appointmentController.selectedIndex.value) {
                    case 0:
                      return  Upcoming();
                    case 1:
                      return  Compeleted();
                    case 2:
                      return  Canceled();
                    default:
                      return  SizedBox();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
