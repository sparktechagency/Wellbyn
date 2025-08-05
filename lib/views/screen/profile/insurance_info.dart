import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:signature/signature.dart';
import 'package:wellbyn/controllers/insurance_controller.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/iconsTextbutton/icon_text_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/nab_ids.dart';

import '../../../controllers/profile_setting/personal_info.dart';
import '../../../controllers/profile_setting_controller.dart';
import '../../../utils/app_constants.dart';
import '../profile_setting_start/widget/labevalue.dart';
import 'base/infoitem.dart';
import 'base/logout.dart';
import 'base/madicalinfoheader.dart';

class InsuranceInfo extends StatelessWidget {
   InsuranceInfo({super.key});

   final InsuranceController controller = Get.put(InsuranceController());
   final signatureCtrl = Get.put(OnboardingProfileInfo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Insurance Info",
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicalInfoHeader(
                title: "Medical Information",
                description:
                    'Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.',
                iconPath: AppIcons.shieduserIcon,
              ),
              SizedBox(height: 20,),

              Obx((){
              return IconTextButton(
                isLoading: controller.isLoading.value,
                text: "Add new card",
                svgAsset: AppIcons.addIcon,
                backgroundColor:Appcolors.action,
                textColor: Appcolors.primary,
                bordercolor: Colors.transparent,
                height: 50,
                onTap: () {
                  // Your logic
                  print("Button tapped");
                  controller.startLoading();
                },
              );

              }),

              SizedBox(height: 24.h,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2, // example number of items
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.only(
                      top: 30,
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: ShadowColor.shadowColors1.withOpacity(0.10), // Shadow color
                            blurRadius: 4, // Softness
                            spreadRadius: 0,
                            offset: Offset(0, 3), // Position of shadow
                            blurStyle: BlurStyle.normal
                        ),
                      ],
                      color: Appcolors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Insurance Name",
                                  // ➤ Makes the card label dynamic
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppConstants.FONT_FAMILY,
                                    color: TextColors.neutral500,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Bluesky ",
                                  // ➤ Makes the card label dynamic
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppConstants.FONT_FAMILY,
                                    color: TextColors.neutral900,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                _showCustomLogoutDialog(context);

                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  color: Appcolors.error50,
                                  boxShadow: [
                                    BoxShadow(
                                        color: ShadowColor.shadowColors1.withOpacity(0.10), // Shadow color
                                        blurRadius: 4, // Softness
                                        spreadRadius: 0,
                                        offset: Offset(0, 3), // Position of shadow
                                        blurStyle: BlurStyle.normal
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SvgPicture.asset(
                                  AppIcons.delete02Icon,
                                  height: 15,
                                  width: 15,
                                  color: Appcolors.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),

                        LabelValueText(
                          label: "Contact ID",
                          value: "G987654321",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                          valueStyle: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),

                        SizedBox(height: 20),

                        LabelValueText(
                          label: "Group Number",
                          value: "H123456789",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                          valueStyle: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        SizedBox(height: 20),

                        LabelValueText(
                          label: "Expiration Date",
                          value: "31/12/2025",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                          valueStyle: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 0.5,
                          color: TextColors.neutral200,
                          margin: EdgeInsets.symmetric(vertical: 16),
                        ),
                        SizedBox(height: 8),
                        LabelValueText(
                          label: "Patient Relationship to Insured",
                          value: "Father",
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                          valueStyle: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: LabelValueText(
                                label: "First Name",
                                value: "Father",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: TextColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                                valueStyle: TextStyle(
                                  fontSize: 16,
                                  color: TextColors.neutral900,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: LabelValueText(
                                label: "Middle Name",
                                value: "Father",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: TextColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                                valueStyle: TextStyle(
                                  fontSize: 16,
                                  color: TextColors.neutral900,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                              ),
                            ),

                            Flexible(
                              flex: 1,
                              child: LabelValueText(
                                label: "Last Name",
                                value: "Father",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: TextColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                                valueStyle: TextStyle(
                                  fontSize: 16,
                                  color: TextColors.neutral900,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        LabelValueText(
                          label: "Contract ID",
                          value: "H123456789",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                          valueStyle: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        SizedBox(height: 20),
                        LabelValueText(
                          label: "Address Line 1",
                          value: "H123456789",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                          valueStyle: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: LabelValueText(
                                label: "City",
                                value: "Manhattan",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: TextColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                                valueStyle: TextStyle(
                                  fontSize: 16,
                                  color: TextColors.neutral900,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: LabelValueText(
                                label: "State",
                                value: "NYC",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: TextColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                                valueStyle: TextStyle(
                                  fontSize: 16,
                                  color: TextColors.neutral900,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                              ),
                            ),

                            Flexible(
                              flex: 1,
                              child: LabelValueText(
                                label: "ZIP",
                                value: "00976",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: TextColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                                valueStyle: TextStyle(
                                  fontSize: 16,
                                  color: TextColors.neutral900,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        LabelValueText(
                          label: "Employer Name",
                          value: "Mahmudcompany",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                          valueStyle: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        SizedBox(height: 20),
                        LabelValueText(
                          label: "Sex",
                          value: "Male",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                          valueStyle: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        SizedBox(height: 20),
                        LabelValueText(
                          label: "Date of Birht",
                          value: "31/12/2006",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                          valueStyle: TextStyle(
                            fontSize: 16,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        Container(
                          height: 0.5,
                          color: TextColors.neutral200,
                          margin: EdgeInsets.symmetric(vertical: 16),
                        ),
                        SizedBox(height: 8),
                        AppText(
                          "Insuranced Card",
                          color: TextColors.neutral900,
                          fontSize: 16,
                        ),
                        SizedBox(height: 8),
                        IconTextButton(
                          onTap: () {},
                          height: 40,
                          width: 135,
                          text: "View Card",
                          svgAsset: AppIcons.viewIcon,
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
                          width: 166,
                          text: "View Signature",
                          svgAsset: AppIcons.viewIcon,
                          backgroundColor: Appcolors.primary,
                          bordercolor: Appcolors.action,
                          textColor: Appcolors.action,
                        ),

                        SizedBox(height: 20,),

                        AppText('Draw Signature ',fontSize: 16,color: TextColors.neutral900,),
                        SizedBox(height: 8),
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ShadowColor.shadowColors1.withOpacity(0.10),
                                      blurRadius: 4,
                                      offset: Offset(0, 3),
                                      spreadRadius: 0,
                                    )
                                  ]
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

                        SizedBox(height: 20,),
                        IconTextButton(
                          onTap: () {},
                          height: 50,
                          text: "Edit Details",
                          svgAsset: AppIcons.editIcon,
                          backgroundColor: Appcolors.primary,
                          bordercolor: Appcolors.action,
                          textColor: Appcolors.action,
                        ),

                      ],
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

   void _showCustomLogoutDialog(BuildContext context) {
     showDialog(
       context: context,
       builder: (context) => CustomConfirmationDialog (
         onConfirm: (){
           Get.back();
         } ,
         iconColor: Appcolors.error700,
         onCancel: () => Get.back(),
         iconAsset: AppIcons.alertIcon,
         title: 'Log out? ',
         description: 'Are you sure you want to log out of your account?',
       ),
     );
   }
}




