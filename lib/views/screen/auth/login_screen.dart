import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/controllers/localization_controller.dart';
import 'package:wellbyn/views/base/app_button.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/custom_field.dart';
import '../../../utils/app_colors.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_icons.dart';
import '../profile_setting_start/widget/labeledtextfield.dart';
import 'forgot.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({ Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController confirmcontroller = TextEditingController();

  LocalizationController localizationController = Get.find<LocalizationController>();

  final List<String> language = ['English', 'Franch'];

  String? selectedLanguage;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      setState(() {
        selectedLanguage = language[localizationController.selectedIndex];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Appcolors.page,
         body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 120.w,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: Appcolors.secondary,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                Border.all(color: Appcolors.action, width: 1),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  focusColor: Colors.white,
                                  value: selectedLanguage ?? language[0],
                                  dropdownColor: Appcolors.primary,
                                  style: TextStyle(
                                    color: Appcolors.action,
                                    fontSize: 14.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                  hint: AppText(
                                    'Language'.tr,
                                    fontSize: 16.sp,
                                  ),
                                  icon: SvgPicture.asset(
                                    AppIcons.arrowdwonIcon,
                                    color: Appcolors.action,
                                  ),
                                  isExpanded: true,
                                  items: language.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: AppText(
                                        value,
                                        fontSize: 16.sp,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      int selectedIndex = language.indexOf(newValue);
                                      if (selectedIndex != -1) {
                                        Locale newLocale = Locale(
                                          AppConstants.languages[selectedIndex].languageCode,
                                          AppConstants.languages[selectedIndex].countryCode,
                                        );
                                        setState(() {
                                          localizationController.setLanguage(newLocale);
                                          selectedLanguage = language[selectedIndex];
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/logo.svg',
                          width: 150.w,
                          height: 150.h,
                          color:  TextColors.action, // change color dynamically
                          semanticsLabel: 'App Logo', // for accessibility
                          fit: BoxFit.contain, // control how the image fits
                          alignment: Alignment.center, // position the image
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Text(
                              "Welcome back!".tr,
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 24,
                                color: TextColors.neutral900,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "To log in, enter your email address.".tr,
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 16,
                                color: TextColors.neutral500,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        inputSection(),
                        SizedBox(height: 8,),
                        forgotsection(),
                        const SizedBox(height: 30),
                        AppButton(text: "Log in".tr, onPressed: () {
                          Get.to(Forgot());
                        }),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            print('Log In tapped');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text.rich(
                               TextSpan(
                                text: "Don’t have an account?".tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                    color: TextColors.neutral500,
                                    fontFamily: 'Satoshi',
                                    fontSize: 16,
                                ), // optional base style
                                children: [
                                  TextSpan(
                                    text: "Create an account".tr,
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
                        Or(),
                        const  SizedBox(height: 20),
                        googleButton(),
                        const SizedBox(height: 30),
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
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w500,
                              )
                          ),
                          Positioned(
                            top: 20,
                            child: Container(
                              width: 150,
                              height: 1,
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
                        controller: passwordcontroller,
                        next: true,
                        maxline: 1,
                        hintText: "Email Address".tr,
                      ),
                      SizedBox(height: 20.h),
                      _buildLabel("Password".tr),
                      CustomTextField(
                        filColor: Appcolors.primary,
                        borderColor: TextColors.neutral900,
                        controller: passwordcontroller,
                        hintText: 'Password'.tr,
                        isPassword: true,
                      ),
                    ],
                  );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text.tr,
        style: TextStyle(
          fontFamily: 'Satoshi',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
