import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/views/screen/auth/password_changed.dart';

import '../../../utils/app_colors.dart';
import '../../base/app_button.dart';
import '../../base/custom_field.dart';
import 'forgot.dart';
class SetNewPassword extends StatelessWidget {
   SetNewPassword({super.key});
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
                      "Set new password",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 24.sp,
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          "Set a new password and continue your journey.",
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            color: TextColors.neutral500,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        _buildLabel("New Password"),
                        CustomTextField(
                          controller: passwordcontroller,
                          hintText: 'type a strong password',
                        ),
                        SizedBox(height: 16.h),
                        _buildLabel("Confirm Password"),
                        CustomTextField(
                          controller: confirmcontroller,
                          hintText: 're-type password',
                        ),

                      ],
                    ),
                    SizedBox(height: 30.h),
                    AppButton(text: "Save",
                        onPressed: () {
                      Get.to(PasswordChanged());

                    }),
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
