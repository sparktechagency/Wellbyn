import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/base/app_button.dart';
import 'package:wellbyn/views/base/custom_field.dart';
import 'package:wellbyn/views/screen/auth/login_screen.dart';
import '../../../utils/app_colors.dart';

import '../profile_setting_start/widget/labeledtextfield.dart';
import 'forgot.dart';

class CreateAccountPage extends StatelessWidget {
  final String role;

  CreateAccountPage({required this.role, Key? key}) : super(key: key);

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

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
                      color: Appcolors.action,
                      // change color dynamically
                      semanticsLabel: 'App Logo',
                      // for accessibility
                      fit: BoxFit.contain,
                      // control how the image fits
                      alignment: Alignment.center, // position the image
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Create an account",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 24,
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    inputMethod(),
                    SizedBox(height: 20.h),
                    AppButton(
                      text: "Next",
                      onPressed: () {
                        Get.to(Forgot());
                      },
                    ),
                    SizedBox(height: 20.h),
                    allreadyHaveAcount(),
                    oR(),
                    SizedBox(height: 20.h),
                    googlebutton(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column inputMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledTextFielded(
          borderColor: TextColors.neutral900,
          label: "Email Address",
          controller: passwordcontroller,
          next: true,
          maxline: 1,
          hintText: "Email Address",
        ),
        SizedBox(height: 16.h),
        LabeledTextFielded(
          borderColor: TextColors.neutral900,
          label: "New Password",
          controller: passwordcontroller,
          next: true,
          maxline: 1,
          hintText: "Type a strong password",
        ),
        SizedBox(height: 16.h),
        LabeledTextFielded(
          borderColor: TextColors.neutral900,
          label: "Confirm Password",
          controller: passwordcontroller,
          next: true,
          maxline: 1,
          hintText: "Re-type password",
        ),
      ],
    );
  }

  GestureDetector allreadyHaveAcount() {
    return GestureDetector(
      onTap: () {
        Get.to(LoginScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text.rich(
          TextSpan(
            text: "Already have an account? ",
            style: TextStyle(
              color: TextColors.neutral500,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text: "Login",
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
    );
  }

  Row oR() {
    return Row(
      children: [
        Expanded(
          child: Container(height: 1.h, color: TextColors.neutral200),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "OR",
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 16,
              color: TextColors.neutral500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(height: 1.h, color: TextColors.neutral200),
        ),
      ],
    );
  }

  Container googlebutton() {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Appcolors.primary,
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
                fontSize: 16,
                color: Appcolors.actionHover,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
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
