import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wellbyn/views/screen/auth/set_new_password.dart';

import '../../../utils/app_colors.dart';
import '../../base/app_button.dart';
import 'forgot.dart';

class Verify extends StatelessWidget {
  Verify({super.key});

  final TextEditingController _pinController = TextEditingController();

  String otpCode = '';

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h),
                    SvgPicture.asset(
                      'assets/icons/logo.svg',
                      width: 150.w,
                      height: 150.h,
                      color: TextColors.action,
                      // change color dynamically
                      semanticsLabel: 'App Logo',
                      // for accessibility
                      fit: BoxFit.contain,
                      // control how the image fits
                      alignment: Alignment.center, // position the image
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Verify code",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "We sent OTP code to your email\n",
                          style: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Satoshi",
                          ),children: [
                            TextSpan(
                              text: "example@gmail.com.",
                              style: TextStyle(
                                fontSize: 16,
                                color: TextColors.neutral900,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Satoshi",
                              ),
                            ),
                          TextSpan(
                            text: "Enter the code below to verify.",
                            style: TextStyle(
                              fontSize: 16,
                              color: TextColors.neutral900,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Satoshi",
                            ),
                          ),
                        ]
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      enableActiveFill: true,
                      showCursor: true,
                      cursorColor: Appcolors.action,
                      obscureText: false,
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: TextColors.action,
                        fontFamily: "Satoshi",
                      ),
                      controller: _pinController,
                      animationType: AnimationType.scale,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        borderWidth: 0,
                        fieldHeight: 55,
                        fieldWidth: 50,
                        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 4),
                        inactiveColor: TextColors.neutral300,
                        inactiveFillColor:Appcolors.primary,
                        selectedFillColor: Appcolors.primary,
                        activeFillColor: Appcolors.primary,
                        selectedColor: Appcolors.action,
                        activeColor: Appcolors.action,
                      ),
                      animationDuration: const Duration(milliseconds: 100),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // 👈 Reduce space between boxes
                      onChanged: (value) {
                        otpCode = value;
                      },
                      onCompleted: (value) {
                        otpCode = value;
                        print("Entered Code: $value");
                      },
                    ),


                    SizedBox(height: 20.h),
                    AppButton(
                      text: "Next",
                      onPressed: () {
                        Get.to(SetNewPassword());
                      },
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        print('Log In tapped');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text.rich(
                          TextSpan(
                            text: "Don’t receive OTP? ",
                            style: TextStyle(
                              color: TextColors.neutral500,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Satoshi',
                              fontSize: 16,
                            ), // optional base style
                            children: [
                              TextSpan(
                                text: "Resend again",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Satoshi',
                                  color: Appcolors.action,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/back.svg", // Your SVG file
                            width: 4, // Simplified from 15.999979972839355
                            height: 30, // For first image
                            colorFilter: ColorFilter.mode(
                              TextColors.neutral900,
                              BlendMode.srcIn,
                            ), // Optional color
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Back to login",
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 16,
                              color: TextColors.neutral900,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
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
