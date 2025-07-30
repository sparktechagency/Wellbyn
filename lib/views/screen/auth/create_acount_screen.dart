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
import '../../base/LabelTextField/labelTextField.dart' show LabeledTextFielded;
import '../../base/LogoHeader/logoHeader.dart';
import '../../base/TextStyle/text_style.dart';

import 'forgot.dart';

class CreateAccountPage extends StatefulWidget {
  final String role;

  CreateAccountPage({required this.role, Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {

  final GlobalKey<FormState> email = GlobalKey<FormState>();
  final GlobalKey<FormState> pass = GlobalKey<FormState>();
  final GlobalKey<FormState> repass = GlobalKey<FormState>();
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
            child: Form(
              key: email,
              child:Column(
                      children: [
                       const SizedBox(height: 35),

                        //=================> logo header <=======================//

                        LogoHeader(
                          imagePath: 'assets/icons/logo.svg',
                          title: 'Create an account',
                          fontSize: 24,
                        ),
                        const SizedBox(height: 20),

                        //=================> input field  <=======================//
                        inputMethod(),
                        const SizedBox(height: 20),

                        //=================> Next button  <=======================//

                        AppButton(
                          text: "Next",
                          onPressed: () {

                            // final email = emailcontroller.text.trim();
                            // final password = passwordcontroller.text;
                            // final confirmPassword = confirmcontroller.text;
                            //
                            // if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                            //   _showError("All fields are required!");
                            // } else if (password != confirmPassword) {
                            //   _showError("Passwords do not match!");
                            // } else if (!AppConstants.emailValidator.hasMatch(email)) {
                            //   _showError("Please enter a valid email address!");
                            // } else if (password.length < 6) {
                            //   _showError("Password must be at least 6 characters!");
                            // } else {
                            //   // ✅ All validations passed
                            //   Get.to(() => Forgot());
                            // }


                            if(email.currentState!.validate()){
                              Get.to(()=> Forgot());
                            }



                          },
                        ),
                        const SizedBox(height: 20),

                        //==================> user log in or create section <===============//
                        AlreadyHaveAccountText(onTap: (){

                          Get.to(LoginScreen());
                        },
                          fontSize: 16.sp,
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
            ),

    );
  }


  void _showError(String message) {
    Get.snackbar(
      "Error",
      message,
      backgroundColor: Appcolors.error.withOpacity(0.70),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      borderRadius: 16.r,
      duration: const Duration(seconds: 3),
    );
  }

  Column inputMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        LabeledTextFielded(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          borderColor: TextColors.neutral900,
          label: "Email",
          controller: emailcontroller,
          maxline: 1,
          hintText: "Email Address",
        ),
        const SizedBox(height: 16),
        LabeledTextFielded(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          borderColor: TextColors.neutral900,
          label: "New Password",
          controller: passwordcontroller,
          maxline: 1,
          hintText: "Type a strong password",
        ),
        const SizedBox(height: 16),
        LabeledTextFielded(
          autovalidateMode: AutovalidateMode.onUserInteraction,
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

