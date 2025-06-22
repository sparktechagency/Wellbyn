import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import 'Hipaa_Consent.dart';
class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 1.sh),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Spacer(),
                    SvgPicture.asset(
                      'assets/icons/check.svg',
                      width: 150.w,
                      height: 150.h, // change color dynamically
                      semanticsLabel: 'App Logo', // for accessibility
                      fit: BoxFit.contain, // control how the image fits
                      alignment: Alignment.center, // position the image
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Password Changed!",
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Return to the login page to enter your account with your new password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 30.h),

                    GestureDetector(
                      onTap: (){
                        Get.to(ConsentScreen());

                      },
                      child: Container(
                        height: 45.h,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Appcolors.action,
                          borderRadius: BorderRadius.circular(8),

                        ),child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        SvgPicture.asset(
                        "assets/icons/back.svg", // Your SVG file
                        width: 4, // Simplified from 15.999979972839355
                        height: 24, // For first image
                        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn), // Optional color

                      ),
                          SizedBox(width: 12,),
                          Text(
                              "Back to login",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                        ],
                      ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Spacer(),
                    Spacer(),
                    Spacer(),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
