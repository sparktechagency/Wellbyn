import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/views/screen/auth/verify.dart';
import '../../base/app_button.dart';
import '../../base/custom_field.dart';
import '../profile_setting_start/widget/labeledtextfield.dart';

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
            physics: const BouncingScrollPhysics(),
            child: Column(
                  children: [
                    const   SizedBox(height: 35),
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
                    const  Text(
                        "Forgot password?",
                         style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    const  Text(
                        "Enter your email to reset your password.",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          color: TextColors.neutral500,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    const SizedBox(height: 30),
                    nextbutton(),
                    const   SizedBox(height: 24),
                    AppButton(text: "Next", onPressed: () {
                      Get.to(Verify());
                    }),
                   const SizedBox(height: 24),
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
    );
  }

  Column nextbutton() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabeledTextFielded(
                        borderColor: TextColors.neutral900,
                        label: "Email",
                        controller: emailcontrller,
                        next: true,
                        maxline: 1,
                        hintText: "Email Address",
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
                       const Text(
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
        }
