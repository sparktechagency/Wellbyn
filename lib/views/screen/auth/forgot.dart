import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/views/screen/auth/verify.dart';
import '../../base/AppButton/app_button.dart';
import '../../base/Apptext/app_text.dart';
import '../../base/ArrowBackAuth/arrowBackAuth.dart';
import '../../base/LogoHeader/logoHeader.dart';
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

                    LogoHeader(
                      fontSize: 24,
                      imagePath: 'assets/icons/logo.svg',
                      title: 'Forgor password!',

                    ),
                    //=================> logo text <=======================//
                    AppText("Enter your email to reset your password.",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: TextColors.neutral500,),

                    const SizedBox(height: 30),
                    //=================> input Section email <=======================//

                    InputSection(),

                    const SizedBox(height: 24),
                    AppButton(text: "Next", onPressed: () {
                      Get.to(Verify());
                    }),
                    const SizedBox(height: 24),
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
    );
  }

  Column InputSection() {
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

   }
