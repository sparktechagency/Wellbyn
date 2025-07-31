import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/controllers/auth/set_new_password.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/screen/auth/password_changed.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../base/AppButton/app_button.dart';
import '../../base/LogoHeader/logoHeader.dart';
import '../../base/custom_field.dart';
import '../profile_setting_start/widget/labeledtextfield.dart';
import 'forgot.dart';

class SetNewPassword extends StatelessWidget {
  SetNewPassword({super.key});

  final SetNewPasswordController _controller = Get.put(SetNewPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 1.sh),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),

                    //=================> logo header <=======================//

                    LogoHeader(
                      fontSize: 24,
                      imagePath: 'assets/icons/logo.svg',
                      title: 'Set new password',
                    ),

                    //=================> logo header <=======================//
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "Set a new password and continue your journey.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: TextColors.neutral500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    //=================> input Section <=======================//

                    inputSection(),
                    SizedBox(height: 24.h),

                    //=================> Save Button <=======================//

                    AppButton(
                      text: "Save",
                      onPressed: () {
                        Get.to(PasswordChanged());
                      },
                    ),
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

  Column inputSection() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      LabeledTextFielded(
                        borderColor: TextColors.neutral900,
                        label: "New Password",
                        controller: _controller.confirmcontroller,
                        next: true,
                        maxline: 1,
                        hintText: "Type a strong password",
                      ),
                      SizedBox(height: 24.h),
                      LabeledTextFielded(
                        borderColor: TextColors.neutral900,
                        label: "Confirm Password",
                        controller: _controller.confirmcontroller,
                        next: true,
                        maxline: 1,
                        hintText: "Re-type password",
                      ),
                    ],
                  );
  }
}
