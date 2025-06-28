import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/views/screen/auth/verify.dart';
import '../../base/app_button.dart';
import '../../base/custom_field.dart';

class Forgot extends StatelessWidget {
   Forgot({super.key});

  TextEditingController emailcontrller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 1.sh),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: 35.h),
                    SvgPicture.asset(
                      'assets/icons/logo.svg',
                      width: 150.w,
                      height: 150.h,
                      color: Appcolors.action, // change color dynamically
                      semanticsLabel: 'App Logo', // for accessibility
                      fit: BoxFit.contain, // control how the image fits
                      alignment: Alignment.center, // position the image
                    ),
                    SizedBox(height: 10.h),
                    Text(
                        "Forgot password?",
                         style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    Text(
                        "Enter your email to reset your password.",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          color: TextColors.neutral500,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                    SizedBox(height: 30.h),
                    nextbutton(),
                    SizedBox(height: 20.h),
                    AppButton(text: "Next", onPressed: () {
                      Get.to(Verify());

                    }),
                    SizedBox(height: 25.h),
                    arrowback(),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(height: 1.h, color: Colors.grey),
                    //     ),
                    //     Padding(
                    //       padding:
                    //       EdgeInsets.symmetric(horizontal: 8.w),
                    //       child: Text(
                    //         "OR",
                    //         style: TextStyle(
                    //           fontSize: 16.sp,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Container(height: 1.h, color: Colors.grey),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 20.h),
                    // Container(
                    //   height: 50.h,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8.r),
                    //     color: Appcolors.secondary,
                    //   ),
                    //   child: Center(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         SvgPicture.asset(
                    //           'assets/icons/google.svg',
                    //           width: 24.w,
                    //           height: 24.h,
                    //         ),
                    //         SizedBox(width: 8.w),
                    //         Text(
                    //           "Continue with Google",
                    //           style: TextStyle(
                    //             fontSize: 16.sp,
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column nextbutton() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Email"),
                      CustomTextField(
                        borderColor: TextColors.neutral900,
                        filColor: Appcolors.primary,
                        controller: emailcontrller,
                        hintText: 'email address',
                      ),
                    ],
                  );
  }

  GestureDetector arrowback() {
    return GestureDetector(
                    onTap: (){
                      Get.back();

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/back.svg", // Your SVG file
                        width: 4, // Simplified from 15.999979972839355
                        height: 24, // For first image
                        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn), // Optional color

                        ),
                        SizedBox(width: 12,),
                        Text(
                            "Back to login",
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )
                        )
                      ],
                    ),
                  );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Satoshi',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
