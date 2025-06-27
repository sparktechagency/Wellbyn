import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/controllers/personal_info.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/custom_field.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/nab_ids.dart';

class PersonalInfo extends StatefulWidget {
  PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

TextEditingController fistname = TextEditingController();
final genderController = Get.put(PersonalInformation());

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Patient Info",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back(id: NavIds.profilenav);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppIcons.settingIcon),
                  SizedBox(width: 5),
                  AppText(
                    "Patient Information",
                    fontSize: 18,
                    color: TextColors.neutral900,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                style: TextStyle(
                  fontSize: 14,
                  color: TextColors.neutral500,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.clip,
                "Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.",
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolors.primary,
                  borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color:Appcolors.secondary , // softer effect
                        blurRadius: 2, // reasonable softness
                        spreadRadius: 2,
                        offset: Offset(0.2, 0.2), // downward shadow
                      ),
                    ]
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      AppText("Personal Info", color: TextColors.neutral500),
                      SizedBox(height: 20),
                      lableText("Full name"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: fistname,
                        filColor: Colors.white,
                        borderColor: TextColors.neutral900,
                        labelText: "First Name",
                        enabled: false,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: fistname,
                              filColor: Colors.white,
                              borderColor: TextColors.neutral900,
                              labelText: "Middle",
                              enabled: false,
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: CustomTextField(
                              controller: fistname,
                              filColor: Colors.white,
                              borderColor: TextColors.neutral900,
                              labelText: "Last",
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      lableText("Date of birth"),
                      SizedBox(height: 6),
                      CustomTextFields(
                        suffixIcon: AppIcons.calenderIcon01,
                        controller: fistname,
                        filColor: Colors.white,
                        iconColor: Appcolors.action,
                        borderColor: TextColors.neutral300,
                        labelText: "mm/dd/yyyy",
                        enabled: false,
                      ),
                      SizedBox(height: 4),
                      AppText(
                        "O year old",
                        color: TextColors.neutral500,
                        fontSize: 14,
                      ),
                      const SizedBox(height: 20),
                      lableText("Sex"),

                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: Gender.values.map((gender) {
                            return Obx(() {
                              final isSelected =
                                  genderController.selectedGender.value ==
                                  gender;
                              return GestureDetector(
                                onTap: () =>
                                    genderController.selectGender(gender),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.grey,
                                            width: 2,
                                          ),
                                        ),
                                        child: Center(
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            height: isSelected ? 10 : 0,
                                            width: isSelected ? 10 : 0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isSelected
                                                  ? Colors.blue
                                                  : Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Text(
                                        gender.name.capitalizeFirst!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: isSelected
                                              ? Colors.black
                                              : Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      lableText("Marital Status"),
                      CustomTextFields(
                        suffixIcon: AppIcons.arrowdwonIcon,
                        controller: fistname,
                        filColor: Colors.white,
                        borderColor: TextColors.neutral300,
                        labelText: "Selected status",
                        enabled: false,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          lableText("Number of Children "),
                          AppText(
                            "(optional",
                            fontSize: 14,
                            color: TextColors.neutral500,
                          ),
                        ],
                      ),
                      CustomTextFields(
                        controller: fistname,
                        filColor: Colors.white,
                        borderColor: TextColors.neutral300,
                        labelText: "0",
                        enabled: false,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolors.primary,
                  borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color:Appcolors.secondary , // softer effect
                        blurRadius: 2, // reasonable softness
                        spreadRadius: 2,
                        offset: Offset(0.2, 0.2), // downward shadow
                      ),
                    ]
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      AppText("Contact Info", color: TextColors.neutral500),
                      SizedBox(height: 20),
                      lableText("Email"),
                      SizedBox(height: 8),
                      CustomTextFields(
                        controller: fistname,
                        filColor: Colors.white,
                        borderColor: TextColors.neutral300,
                        labelText: "email@email.com",
                        enabled: false,
                      ),
                      SizedBox(height: 8),
                      lableText("Phone"),
                      SizedBox(height: 5),
                      CustomTextFields(
                        controller: fistname,
                        filColor: Colors.white,
                        borderColor: TextColors.neutral300,
                        labelText: "+0015411411",
                        enabled: false,
                      ),
                      SizedBox(width: 6),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolors.primary,
                  borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color:Appcolors.secondary , // softer effect
                        blurRadius: 2, // reasonable softness
                        spreadRadius: 2,
                        offset: Offset(0.2, 0.2), // downward shadow
                      ),
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      AppText("Address", color: TextColors.neutral500),
                      const SizedBox(height: 20),

                      // Address Line 2 with optional
                      Row(
                        children: [
                          lableText("Address Line 2"),
                          const SizedBox(width: 4),
                          AppText(
                            "(optional)",
                            color: TextColors.neutral500,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomTextFields(
                        controller: fistname,
                        filColor: Colors.white,
                        borderColor: TextColors.neutral300,
                        labelText: "Address Line 2",
                        enabled: false,
                      ),
                      const SizedBox(height: 16),

                      // Driver's License
                      lableText("Driver's License"),
                      const SizedBox(height: 8),
                      CustomTextFields(
                        controller: fistname,
                        filColor: Colors.white,
                        borderColor: TextColors.neutral300,
                        labelText: "License number",
                        enabled: false,
                      ),
                      const SizedBox(height: 16),

                      // City, State, Zip — Responsive Row
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                lableText("City"),
                                const SizedBox(height: 8),
                                CustomTextFields(
                                  controller: fistname,
                                  filColor: Colors.white,
                                  borderColor: TextColors.neutral300,
                                  labelText: "City",
                                  enabled: false,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                lableText("State"),
                                const SizedBox(height: 8),
                                CustomTextFields(
                                  iconSize: 16,
                                  suffixIcon: AppIcons.arrowdwonIcon,
                                  controller: fistname,
                                  filColor: Colors.white,
                                  borderColor: TextColors.neutral300,
                                  labelText: "State",
                                  enabled: false,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                lableText("Zip Code"),
                                const SizedBox(height: 8),
                                CustomTextFields(

                                  controller: fistname,
                                  filColor: Colors.white,
                                  borderColor: TextColors.neutral300,
                                  labelText: "Zip",
                                  enabled: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Appcolors.primary,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color:Appcolors.secondary , // softer effect
                        blurRadius: 2, // reasonable softness
                        spreadRadius: 2,
                        offset: Offset(0.2, 0.2), // downward shadow
                      ),
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      AppText("Address", color: TextColors.neutral500),

                      const SizedBox(height: 20),

                      // Driver's License
                      lableText("Employer"),
                      const SizedBox(height: 8),
                      CustomTextFields(
                        controller: fistname,
                        filColor: Colors.white,
                        borderColor: TextColors.neutral300,
                        labelText: "Company name",
                        enabled: false,
                      ),
                      const SizedBox(height: 20),
                      lableText("Driver's License"),
                      const SizedBox(height: 8),
                      CustomTextFields(
                        controller: fistname,
                        filColor: Colors.white,
                        borderColor: TextColors.neutral300,
                        labelText: "License number",
                        enabled: false,
                      ),
                      // City, State, Zip — Responsive Row

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }

  lableText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: TextColors.neutral900,
      ),
    );
  }
}

class CustomTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Color filColor;
  final Color borderColor;
  final Color? iconColor;
  final bool enabled;
  final int? fontsize;
  final String? suffixIcon;
  final double? iconSize;

  const CustomTextFields({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.filColor,
    required this.borderColor,
    this.enabled = true,
    this.suffixIcon,
    this.iconColor,
    this.fontsize,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      style: TextStyle(
        fontSize: 14,
        fontFamily: "Satoshi",
        color: TextColors.neutral500,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: filColor,
        labelText: labelText,
        labelStyle: TextStyle(
          color: enabled ? TextColors.neutral900 : TextColors.neutral500,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor.withOpacity(0.4)),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: suffixIcon != null
              ? SvgPicture.asset(
                  suffixIcon!,
            height: iconSize ?? 20, // Use provided size or fallback
            width: iconSize ?? 20,
            color: iconColor ?? TextColors.neutral500,
                )
              : null,
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 28,
          maxWidth: 32,
        ),
      ),
    );
  }
}
