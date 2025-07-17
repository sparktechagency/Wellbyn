import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/views/screen/auth/set_new_password.dart';

import '../../../utils/app_colors.dart';
import '../../base/AlReadyHaveAcountText/alreadyHaveAcountText.dart';
import '../../base/AppButton/app_button.dart';
import '../../base/ArrowBackAuth/arrowBackAuth.dart';
import '../../base/LogoHeader/logoHeader.dart';
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

                    //=================> logo header <=======================//

                    LogoHeader(
                      imagePath: 'assets/icons/logo.svg',
                      title: 'Verify code',
                    ),

                    //=================> buildPadding <=======================//

                    buildPadding(),

                    SizedBox(height: 20.h),
                    PinCodeEnter(context),
                    SizedBox(height: 20.h),

                    //=================> AppButton <=======================//

                    AppButton(
                      text: "Next",
                      onPressed: () {
                        Get.to(SetNewPassword());
                      },
                    ),
                    SizedBox(height: 20.h),
                    AlreadyHaveAccountText(onTap: (){
                      //Get.to(CreateAccountPage(role: "petient"));
                    },
                      leadingText: "Don’t receive OTP? ".tr,
                      actionText: "Resend".tr,
                      fontFamily: AppConstants.FONT_FAMILY,),
                    SizedBox(height: 10),

                    //=================> logo text <=======================//

                    BackButtonWithText(
                      text: "Back To Sign In",
                      iconColor: TextColors.neutral900,
                      iconWidth: 45,
                      iconHeight: 25,
                      onTap: () {
                        print("Back pressed");
                        Get.back();
                      },
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PinCodeTextField PinCodeEnter(BuildContext context) {
    return PinCodeTextField(
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
                  );
  }

  Padding buildPadding() {
    return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "We sent OTP code to your email\n",
                        style: TextStyle(
                          fontSize: 16,
                          color: TextColors.neutral900,
                          fontWeight: FontWeight.w500,
                          fontFamily:AppConstants.FONT_FAMILY,
                        ),children: [
                          TextSpan(
                            text: "example@gmail.com.",
                            style: TextStyle(
                              fontSize: 16,
                              color: TextColors.neutral500,
                              fontWeight: FontWeight.w700,
                              fontFamily:AppConstants.FONT_FAMILY,
                            ),
                          ),
                        TextSpan(
                          text: "Enter the code below to verify.",
                          style: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Satoshi",
                          ),
                        ),
                      ]
                      ),
                    ),
                  );
  }
}
