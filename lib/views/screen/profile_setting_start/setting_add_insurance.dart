import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:signature/signature.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/custom_button.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_personal_info.dart';
import 'package:wellbyn/views/screen/profile_setting_start/widget/labeledtextfield.dart';

import '../../../controllers/profile_setting_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import 'package:get/get.dart';
import '../../base/icon_text_button.dart';
class SettingAddInsurance extends StatelessWidget {
   SettingAddInsurance({super.key});

  List<String> bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
  List<String> state = ["AO", "AI", "BI", "CD", "HI+", "CO-", "HO", "KA"];

  String? selectedGender;

  List<String> marital = [
    "Single",
    "Marride",
    "Divorced",
    "Widowed",
    "Separated",
    "Unknown",
  ];

   ProfileSettingController _contrller = Get.put(ProfileSettingController());
   TextEditingController name= TextEditingController();
   final signatureCtrl = Get.put(ProfileSettingController());



   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Add New Insurance Info",
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
            Get.back();
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText("Policy Holder Info",fontSize: 20,color: TextColors.neutral500,),
            SizedBox(height: 20),
            Obx(
                  () => LabeledDropdownFieldes(
                titile: "Type Selected",
                label: "Type",
                items: marital,
                selectedValue: _contrller.selectedMarital.value.isEmpty
                    ? null
                    : _contrller.selectedMarital.value,
                onChanged: (value) {
                  _contrller.selectecMarital(value);
                },
              ),
            ),
            SizedBox(height: 20),
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
              label:"Phone",
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
                selectedValue: _contrller.selectedMarital.value.isEmpty
                    ? null
                    : _contrller.selectedMarital.value,
                onChanged: (value) {
                  _contrller.selectecMarital(value);
                },
              ),
            ),


            const SizedBox(height: 24),
            Divider(height: 1, color: TextColors.neutral200),
            const SizedBox(height: 24),
            AppText("Insured",fontSize: 20,color: TextColors.neutral500,),
            const SizedBox(height: 24),
            Obx(
                  () => LabeledDropdownFieldes(
                    titile: "Selected Plan ",
                    label: "Plan Name",
                items: marital,
                selectedValue: _contrller.selectedMarital.value.isEmpty
                    ? null
                    : _contrller.selectedMarital.value,
                onChanged: (value) {
                  _contrller.selectecMarital(value);
                },
              ),
            ),
            SizedBox(height: 20.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label:"Full Name",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "First Name",
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextFielde(
                    next: true,
                    controller: name,
                    hintText: "Middle",
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    borderColor:
                    TextColors.neutral900, // Pass borderColor here
                  ),
                ),
                SizedBox(width: 8),

                Expanded(
                  child: CustomTextFielde(
                    next: true,
                    controller: name,
                    hintText: "Last",
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    borderColor:
                    TextColors.neutral900, // Pass borderColor here
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            LabeledTextFielded(
              borderColor: TextColors.neutral900,
              label:"Group-policy",
              controller: name,
              next: true,
              maxline: 1,
              hintText: "G987654321",
            ),
            const SizedBox(height: 24),
            Obx(
                  () => LabeledDropdownFieldes(
                titile: "Selected Plan ",
                label: "Plan Name",
                items: marital,
                selectedValue: _contrller.selectedMarital.value.isEmpty
                    ? null
                    : _contrller.selectedMarital.value,
                onChanged: (value) {
                  _contrller.selectecMarital(value);
                },
              ),
            ),
            const SizedBox(height: 24),
            Divider(height: 1, color: TextColors.neutral200),
            const SizedBox(height: 24),

            AppText(
              "Insuranced Card",
              color: TextColors.neutral900,
              fontSize: 16,
            ),
            SizedBox(height: 8),
            IconTextButton(
              onTap: () {},
              height: 40,
              width: 145,
              text: "Upload Card",
              svgAsset: AppIcons.addIcon02,
              backgroundColor: Appcolors.primary,
              bordercolor: Appcolors.action,
              textColor: Appcolors.action,
            ),
            SizedBox(height: 20),
            AppText(
              "Digital Signature ",
              color: TextColors.neutral900,
              fontSize: 16,
            ),
            SizedBox(height: 8),
            IconTextButton(
              onTap: () {},
              height: 40,
              width: 180,
              text: "Upload Signature",
              svgAsset: AppIcons.addIcon02,
              backgroundColor: Appcolors.primary,
              bordercolor: Appcolors.action,
              textColor: Appcolors.action,
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText("OR",fontSize: 16,color: TextColors.neutral500,),
                const SizedBox(width: 6,),
                Expanded(child: Divider(height: 1, color: TextColors.neutral200)),
              ],
            ),

            SizedBox(height: 20),
            AppText(
              "Draw Signature ",
              color: TextColors.neutral900,
              fontSize: 16,
            ),
            SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Appcolors.primary,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: TextColors.neutral200,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Signature(
                      controller: signatureCtrl.signatureController,
                      backgroundColor: Colors.white,
                      height: 120,
                    ),
                  ),
                ),
                // 🔁 Reactive clear button
                if(signatureCtrl.signatureController.isNotEmpty)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: signatureCtrl.clearSignature,
                      child: Container(
                        padding: const EdgeInsets.all(4),
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
                        child: const Icon(
                          Icons.clear,
                          size: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24,),

            CustomButton(
              fontSize: 16,
              textColor: Appcolors.primary,
              color: Appcolors.action,
                onTap: (){},
                text: "Save Change"),



            const SizedBox(height: 35,),

          ],
        ),
        ),
      ),
    );
  }
}
