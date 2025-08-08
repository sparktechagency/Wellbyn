import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/controllers/auth/log_in.dart';
import 'package:wellbyn/controllers/localization_controller.dart';
import 'package:wellbyn/views/base/AppButton/app_button.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/custom_field.dart';
import 'package:wellbyn/views/screen/auth/create_acount_screen.dart' hide LabeledTextFielded;
import '../../../utils/app_colors.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_icons.dart';
import '../../base/AlReadyHaveAcountText/alreadyHaveAcountText.dart';
import '../../base/GoogleButton/google_button.dart';
import '../../base/LogoHeader/logoHeader.dart';
import '../../base/OrDivided/orDivided.dart';
import '../profile_setting_start/widget/labeledtextfield.dart';
import 'forgot.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({ Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // LocalizationController localizationController = Get.find<LocalizationController>();
  // final List<String> language = ['English', 'Franch'];
  // String? selectedLanguage;
  final LogInController _controller = Get.put(LogInController());

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration.zero,(){
    //   setState(() {
    //     selectedLanguage = language[localizationController.selectedIndex];
    //   });
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Appcolors.page,
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                        children: [
                          const SizedBox(height: 60),

                          //=================> logo header <=======================//
                          LogoHeader(
                            imagePath: 'assets/icons/logo.svg',
                            title: 'Welcome back!',

                          ),

                          //=================> logo text <=======================//
                          AppText("To sign in, enter your email address",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: TextColors.neutral500,),

                          const SizedBox(height: 30),
                          //=================> input section <=======================//
                          inputSection(),

                          SizedBox(height: 8,),

                          //=================> forgot <=======================//
                          forgotsection(),

                          const SizedBox(height: 20),
                          //=================> Sign In button <=======================//
                          AppButton(text: "Sign In".tr, onPressed: () {
                            Get.to(Forgot());
                          }),

                          SizedBox(height: 20.h),
                          AlreadyHaveAccountText(
                             onTap: (){
                            Get.to(CreateAccountPage(role: "petient"));
                            },
                             fontSize: 16.sp,
                             leadingText: "Don’t have an account?".tr,
                             actionText: " Create an account".tr,
                             fontFamily: AppConstants.FONT_FAMILY,),

                          //=================> OR Divider section    <=======================//
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



    );
  }

  Container googleButton() {
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
                            Text(
                            "Continue with Google".tr,
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

   Row Or() {
                return Row(
                    children: [
                      Expanded(
                        child: Container(height: 1.h, color: TextColors.neutral200),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          "OR".tr,
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 16.sp,
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

  Row forgotsection() {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [

                          Text(
                              "Forgot Password?".tr,
                              style: TextStyle(
                                fontSize: 16,
                                color: TextColors.neutral900,
                                fontFamily: AppConstants.FONT_FAMILY,
                                fontWeight: FontWeight.w500,
                              )
                          ),

                          Positioned(
                            top: 20,
                            child: Container(
                              width: 150.h,
                              height: 1.2.h,
                              color: TextColors.neutral900,
                            ),
                          )
                        ],
                      )


                    ],
                  );
  }

  Column inputSection() {
       return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      LabeledTextFielded(
                        borderColor: TextColors.neutral900,
                        label: "Email".tr,
                        controller: _controller.emailcontroller,
                        next: true,
                        maxline: 1,
                        hintText: "Email Address".tr,
                      ),

                      SizedBox(height: 20.h),

                      LabeledTextFielded(
                        suffixSvgAsset: AppIcons.viewIcon,
                        suffixSvgColor: TextColors.neutral500,
                        isPassword: true,
                        borderColor: TextColors.neutral900,
                        label: "New Password",
                        controller: _controller.passwordcontroller,
                        maxline: 1,
                        hintText: "Password ",
                      ),
                    ],
                  );
  }
}
