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

class CreateAccountPage extends StatefulWidget {
  final String role;

  CreateAccountPage({required this.role, Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmcontroller.dispose();
    super.dispose();
  }
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
                   const SizedBox(height: 35),
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
                    const  SizedBox(height: 10),
                    const  Text(
                      "Create an account",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 24,
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                      inputMethod(),
                    const SizedBox(height: 20),
                    AppButton(
                      text: "Next",
                      onPressed: () {
                        Get.to(Forgot());
                      },
                    ),
                   const SizedBox(height: 20),
                    const AlreadyHaveAccountText(),

                    oR(),
                   const SizedBox(height: 20),
                    GoogleButton(),
                    const  SizedBox(height: 20),
                  ],
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
          controller: emailcontroller,
          maxline: 1,
          hintText: "Email Address",
        ),
     const SizedBox(height: 16),
        LabeledTextFielded(
          borderColor: TextColors.neutral900,
          label: "New Password",
          controller: passwordcontroller,
          maxline: 1,
          hintText: "Type a strong password",
        ),
        const SizedBox(height: 16),
        LabeledTextFielded(
          borderColor: TextColors.neutral900,
          label: "Confirm Password",
          controller: confirmcontroller,
          maxline: 1,
          hintText: "Re-type password",
        ),
      ],
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
          child:const Text(
            "OR",
            style:Styles.labelStyle,
          ),
        ),
        Expanded(
          child: Container(height: 1.h, color: TextColors.neutral200),
        ),
      ],
    );
  }

}

class Styles {
  static const TextStyle labelStyle = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 16,
    color: TextColors.neutral500,
    fontWeight: FontWeight.w500,
  );
}


class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            const SizedBox(width: 8),
            const Text(
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
}



class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => LoginScreen()),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: const Text.rich(
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
}

