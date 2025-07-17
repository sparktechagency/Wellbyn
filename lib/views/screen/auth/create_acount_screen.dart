import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/views/base/AppButton/app_button.dart';
import 'package:wellbyn/views/base/OrDivided/orDivided.dart';
import 'package:wellbyn/views/base/custom_field.dart';
import 'package:wellbyn/views/screen/auth/login_screen.dart';
import '../../../utils/app_colors.dart';

import '../../base/AlReadyHaveAcountText/alreadyHaveAcountText.dart';
import '../../base/GoogleButton/google_button.dart';
import '../../base/LogoHeader/logoHeader.dart';
import '../../base/TextStyle/text_style.dart';
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

                    //=================> logo header <=======================//

                    LogoHeader(
                      imagePath: 'assets/icons/logo.svg',
                      title: 'Create an account',
                    ),
                    const SizedBox(height: 20),

                    //=================> input field  <=======================//
                    inputMethod(),
                    const SizedBox(height: 20),

                    //=================> Next button  <=======================//

                    AppButton(
                      text: "Next",
                      onPressed: () {
                        Get.to(Forgot());
                      },
                    ),
                    const SizedBox(height: 20),

                    //==================> user log in or create section <===============//
                    AlreadyHaveAccountText(onTap: (){
                      Get.to(LoginScreen());
                    },
                      leadingText: 'Alredy have an account? ',
                      actionText: 'Sign In',
                      fontFamily: AppConstants.FONT_FAMILY,),

                    //=================> Or divider   <=======================//

                    OrDivider(),

                    const SizedBox(height: 20),

                    //=================> gooogle buttton   <=======================//

                    GoogleButton(onPressed: () {
                      print("Google account ");
                    },),
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
           label: "Email",
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
}

