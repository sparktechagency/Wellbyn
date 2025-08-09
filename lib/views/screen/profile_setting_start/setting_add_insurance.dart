import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/custombutton/custom_button.dart';
import 'package:wellbyn/views/base/iconsTextbutton/icon_text_button.dart';
import 'package:wellbyn/controllers/profile_setting_controller.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';


import '../../../controllers/TextField/textfield_Controller.dart';
import '../../../controllers/profile_setting/personal_info.dart';
import '../../base/LabelTextField/labelTextField.dart';
import '../../base/LableDropDownFielded/lableDropDownFielded.dart';
import '../../base/PickUpdate/pickupdate.dart';


class SettingAddInsurance extends StatelessWidget {
  SettingAddInsurance({super.key});

  final List<String> marital = [
    "Single",
    "Marride",
    "Divorced",
    "Widowed",
    "Separated",
    "Unknown",
  ];

  final OnboardingProfileInfo _controller = Get.put(OnboardingProfileInfo());
  final TextEditingController name = TextEditingController();

  final DropdownController  dropdownController = Get.put(DropdownController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Add New Insurance Info",
          style: TextStyle(
            fontSize: 20.sp,
            letterSpacing: 0.2,
            fontFamily: AppConstants.FONT_FAMILY,
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 24.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
        
        
            LabeledDropdownFielded(
              label: "Insurance Name",
              titile: "Marital Status",
              items: [
                "Single",
                "Married",
                "Divorced",
                "Widowed",
                "Separated",
                "Unknown",
              ],
              selectedValue: dropdownController.maritialValue,
              onChanged: (value) {
                // Optional additional logic
                print("Selected: $value");
              },
            ),
            SizedBox(height: 24.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Contact ID",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "G987654321",
            ),
            SizedBox(height: 24.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Group Number",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "G987654321",
            ),
            SizedBox(height: 24.h),
            Divider(height: 1.h, color: TextColors.neutral200),
            SizedBox(height: 24.h),
            LabeledDropdownFielded(
              label: "Patient Relationship To Insured",
              titile: "Marital Status",
              items: [
                "Single",
                "Married",
                "Divorced",
                "Widowed",
                "Separated",
                "Unknown",
              ],
              selectedValue: dropdownController.maritialValue,
              onChanged: (value) {
                // Optional additional logic
                print("Selected: $value");
              },
            ),
            SizedBox(height: 24.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Full Name",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "First Name",
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: CustomTextFielded(
                    next: true,
                    controller: name,
                    hintText: "Middle",
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    borderColor: TextColors.neutral900,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomTextFielded(
                    next: true,
                    controller: name,
                    hintText: "Last",
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    borderColor: TextColors.neutral900,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Contract ID",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "G987654321",
            ),
            SizedBox(height: 24.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Address Line 1",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "Street address",
            ),
            SizedBox(height: 24.h),
        
            Row(
              children: [
                Expanded(
                  child: LabeledTextFielded(
                    next: true,
                    borderColor: TextColors.neutral900,
                    label: "City",
                    controller: name,
                    keyboardType: TextInputType.number,
                    maxline: 1,
                    hintText: "",
                  ),
                ),
                SizedBox(width: 8.w,),
                Expanded(
                  child:   LabeledDropdownFielded(
                    label: "State",
                    titile: "State",
                    items:[
                      "AO",
                      "AI",
                      "BI",
                      "CD",
                      "HI+",
                      "CO-",
                      "HO",
                      "KA",
                    ],
                    selectedValue: dropdownController.state,
                    onChanged: (value) {
                      // Optional additional logic
                      print("Selected: $value");
                    },
                  ),
                ),
                SizedBox(width: 8.w,),
                Expanded(
                  child: LabeledTextFielded(
                    next: true,
                    borderColor: TextColors.neutral900,
                    label: "Zip",
                    controller: name,
                    keyboardType: TextInputType.number,
                    maxline: 1,
                    hintText: "",
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Employer Name",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "Company name",
            ),
            SizedBox(height: 24.h,),
        
            LabeledDropdownFielded(
              label: "Sex",
              titile: "City",
              items: ["Male", "Female", "Other"],
              selectedValue: dropdownController.selectedValue,
              onChanged: (value) {
                // Optional additional logic
                print("Selected: $value");
              },
            ),
        
            SizedBox(height: 24.h,),


              CustomDatePickerField(
                selectedDate: _controller.formattedDate,
                onTap: () => _controller.pickDate(Get.context!),
                hintText: "mm/dd/yyyy",
                svgIconPath: AppIcons.calenderIcon01,
              ),
        
            SizedBox(height: 24.h,),
        
            AppText(
              "Insuranced Card",
              fontSize: 16.sp,
              color: TextColors.neutral900,
            ),
            SizedBox(height: 8.h),
            IconTextButton(
              onTap: () {},
              height: 46.h,
              width: 160,
              text: "Upload Card",
              fontsize: 16,
              svgAsset: AppIcons.addIcon02,
              backgroundColor: Appcolors.primary,
              bordercolor: Appcolors.action,
              textColor: Appcolors.action,
            ),
            SizedBox(height: 24.h),
            AppText(
              "Digital Signature ",
              fontSize: 16.sp,
              color: TextColors.neutral900,
            ),
            SizedBox(height: 8.h),
            IconTextButton(
              onTap: () {},
              height: 46.h,
              width: 190,
              fontsize: 16,
              text: "Upload Signature",
              svgAsset: AppIcons.addIcon02,
              backgroundColor: Appcolors.primary,
              bordercolor: Appcolors.action,
              textColor: Appcolors.action,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                AppText(
                  "OR",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: TextColors.neutral900,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Divider(
                    height: 1.h,
                    color: TextColors.neutral200,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            AppText(
              "Draw Signature ",
              fontSize: 16,
        
              color: TextColors.neutral900,
            ),
            SizedBox(height: 8.h),
            Stack(
              children: [
                Container(
                  height: 140.h,
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                      color: Appcolors.primary,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: ShadowColor.shadowColors1.withOpacity(0.10),
                          offset: Offset(0, 3),
                          blurRadius: 4,
        
                        )
                      ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Signature(
                      controller: _controller.signatureController,
                      backgroundColor: Colors.white,
                      height: 120.h,
                    ),
                  ),
                ),
                if (_controller.signatureController.isNotEmpty)
                  Positioned(
                    top: 4.h,
                    right: 4.w,
                    child: GestureDetector(
                      onTap: _controller.clearSignature,
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Icon(
                          Icons.clear,
                          size: 18.sp,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 32.h),
            CustomButton(
              fontSize: 16.sp,
              textColor: Appcolors.primary,
              color: Appcolors.action,
              onTap: () {},
              text: "Save Change",
            ),
              SizedBox(height: 50.h),
          ]),
        
        
        ),
      ),
    );
  }

  Widget _buildSectionContainer({
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Appcolors.primary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Appcolors.secondary,
            blurRadius: 7,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...children,
          ],
        ),
      ),
    );}

  Widget _buildLine({required bool isHalfColor}) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 1,
        color: isHalfColor ? TextColors.action : TextColors.neutral200,
      ),
    );
  }
}
