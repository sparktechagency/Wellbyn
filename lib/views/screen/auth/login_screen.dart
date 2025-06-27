import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/base/app_button.dart';
import 'package:wellbyn/views/base/custom_field.dart';
import '../../../utils/app_colors.dart';

import 'forgot.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({ Key? key}) : super(key: key);

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

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
                    SizedBox(height: 40.h),
                    SvgPicture.asset(
                      'assets/icons/logo.svg',
                      width: 150.w,
                      height: 150.h,
                      color:  TextColors.action, // change color dynamically
                      semanticsLabel: 'App Logo', // for accessibility
                      fit: BoxFit.contain, // control how the image fits
                      alignment: Alignment.center, // position the image
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Create an account",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 24.sp,
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("Email"),
                        CustomTextField(
                          controller: emailcontroller,
                          hintText: 'email address',
                        ),
                        SizedBox(height: 16.h),
                        _buildLabel("New Password"),
                        CustomTextField(
                          controller: passwordcontroller,
                          hintText: 'type a strong password',
                          isPassword: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Satoshi",
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                            Container(
                              width: 115,
                              height: 1,
                              color: Colors.black,
                            )
                          ],
                        )


                      ],
                    ),
                    SizedBox(height: 30.h),
                    AppButton(text: "Next", onPressed: () {
                      Get.to(Forgot());
                    }),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        print('Log In tapped');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text.rich(
                          TextSpan(
                            text: "Don’t have an account?",
                            style: TextStyle(
                                color: TextColors.neutral500,
                                fontFamily: 'Satoshi',
                                fontSize: 15), // optional base style
                            children: [
                              TextSpan(
                                text: "Create an account",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Satoshi',
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(height: 1.h, color: Colors.grey),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(height: 1.h, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Appcolors.secondary,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/google.svg',
                              width: 24.w,
                              height: 24.h,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 16.sp,
                                color: Appcolors.action,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ),
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
