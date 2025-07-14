import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/custom_button.dart';
import 'package:wellbyn/views/base/icon_text_button.dart';
import 'package:wellbyn/controllers/profile_setting_controller.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_personal_info.dart';
import 'package:wellbyn/views/screen/profile_setting_start/widget/labeledtextfield.dart';


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

  final ProfileSettingController _controller = Get.put(ProfileSettingController());
  final TextEditingController name = TextEditingController();

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
            fontFamily: "Satoshi",
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
            height: 24.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            AppText(
              "Policy Holder Info",
              fontSize: 20.sp,
              color: TextColors.neutral500,
            ),
            SizedBox(height: 20.h),
            Obx(
                  () => LabeledDropdownFieldes(
                titile: "Type Selected",
                label: "Type",
                items: marital,
                selectedValue: _controller.selectedMarital.value.isEmpty
                    ? null
                    : _controller.selectedMarital.value,
                onChanged: (value) => _controller.selectecMarital(value),
              ),
            ),
            SizedBox(height: 20.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Insurance ID",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "G987654321",
            ),
            SizedBox(height: 20.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Group-policy",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "G987654321",
            ),
            SizedBox(height: 20.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Phone",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "+01579859888",
            ),
            SizedBox(height: 20.h),
            Obx(
                  () => LabeledDropdownFieldes(
                titile: "Plan Name",
                label: "Selected Plan",
                items: marital,
                selectedValue: _controller.selectedMarital.value.isEmpty
                    ? null
                    : _controller.selectedMarital.value,
                onChanged: (value) => _controller.selectecMarital(value),
              ),
            ),
            SizedBox(height: 24.h),
            Divider(height: 1.h, color: TextColors.neutral200),
            SizedBox(height: 24.h),
            AppText(
              "Insured",
              fontSize: 20.sp,
              color: TextColors.neutral500,
            ),
            SizedBox(height: 24.h),
            Obx(
                  () => LabeledDropdownFieldes(
                titile: "Selected Plan ",
                label: "Plan Name",
                items: marital,
                selectedValue: _controller.selectedMarital.value.isEmpty
                    ? null
                    : _controller.selectedMarital.value,
                onChanged: (value) => _controller.selectecMarital(value),
              ),
            ),
            SizedBox(height: 20.h),
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
                  child: CustomTextFielde(
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
                  child: CustomTextFielde(
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
            SizedBox(height: 20.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label: "Group-policy",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "G987654321",
            ),
            SizedBox(height: 24.h),
            Obx(
                  () => LabeledDropdownFieldes(
                titile: "Selected Plan ",
                label: "Plan Name",
                items: marital,
                selectedValue: _controller.selectedMarital.value.isEmpty
                    ? null
                    : _controller.selectedMarital.value,
                onChanged: (value) => _controller.selectecMarital(value),
              ),
            ),
            SizedBox(height: 24.h),
            Divider(height: 1.h, color: TextColors.neutral200),
            SizedBox(height: 24.h),
            AppText(
              "Insuranced Card",
              fontSize: 16.sp,
              color: TextColors.neutral900,
            ),
            SizedBox(height: 8.h),
            IconTextButton(
              onTap: () {},
              height: 46.h,
              width: 150.w,
              text: "Upload Card",
              svgAsset: AppIcons.addIcon02,
              backgroundColor: Appcolors.primary,
              bordercolor: Appcolors.action,
              textColor: Appcolors.action,
            ),
            SizedBox(height: 20.h),
            AppText(
              "Digital Signature ",
              fontSize: 16.sp,
              color: TextColors.neutral900,
            ),
            SizedBox(height: 8.h),
            IconTextButton(
              onTap: () {},
              height: 46.h,
              width: 185.w,
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
                  fontSize: 16.sp,
                  color: TextColors.neutral500,
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
              fontSize: 16.sp,
              color: TextColors.neutral900,
            ),
            SizedBox(height: 8.h),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: Appcolors.primary,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: TextColors.neutral200,
                      width: 1.w,
                    ),
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
            SizedBox(height: 24.h),
            CustomButton(
              fontSize: 16.sp,
              textColor: Appcolors.primary,
              color: Appcolors.action,
              onTap: () {},
              text: "Save Change",
            ),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }
}