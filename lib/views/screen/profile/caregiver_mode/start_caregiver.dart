import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/nab_ids.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../base/confrim_screen.dart';

class StartCaregiver extends StatelessWidget {
  const StartCaregiver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 1.sh),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Spacer(),
                  const Spacer(),
                  SvgPicture.asset(
                    AppIcons.addcaregiverIcon,
                    // width: 100.w,
                    // height: 100.h,
                    color: HexColor("#93531F"),
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Add a Caregiver",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: TextColors.neutral900,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text("By adding a caregiver, you can assign someone to help you with all your appointment-related tasks. They can manage everything on your behalf.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: TextColors.neutral500,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton.icon(

                      label: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.primary,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.action,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: (){
                        Get.toNamed("/caregiver_mode_details",id: NavIds.profilenav);
                      },
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



