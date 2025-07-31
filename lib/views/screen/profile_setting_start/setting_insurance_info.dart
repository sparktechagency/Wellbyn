import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:signature/signature.dart';
import 'package:wellbyn/controllers/profile_setting_controller.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/views/screen/base_screen.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_add_insurance.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_personal_info.dart';
import 'package:wellbyn/views/screen/profile_setting_start/widget/circle.dart';
import 'package:wellbyn/views/screen/profile_setting_start/widget/labevalue.dart';

import '../../../controllers/scrollController.dart';
import '../../../controllers/stepcontroller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../base/Apptext/app_text.dart';
import '../../base/custom_button.dart';
import '../../base/icon_text_button.dart';
import '../profile/base/infoitem.dart';
import '../profile/base/logout.dart';
import '../profile/base/madicalinfoheader.dart';

class SettingInsuranceInfo extends StatefulWidget {
  SettingInsuranceInfo({super.key});

  @override
  State<SettingInsuranceInfo> createState() => _SettingInsuranceInfoState();
}

class _SettingInsuranceInfoState extends State<SettingInsuranceInfo> {
  final signatureCtrl = Get.put(ProfileSettingController());
  late ScrollControllerGetX scroll=Get.put(ScrollControllerGetX());

  late final StepController controller;

  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => StepController());
    controller = Get.find<StepController>();
    controller.resetForNewPage(); // Reset when page opens
    // Remove the startAnimationSequence call - animation starts automatically
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Profile Setting",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 0.2,
            fontFamily: AppConstants.FONT_FAMILY,
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
      body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Obx(() => AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeInOutSine,
                  switchOutCurve: Curves.easeInOutCubic,
                  transitionBuilder: (child, animation) {
                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(0, -0.4),
                      end: Offset.zero,
                    ).animate(animation);

                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      ),
                    );
                  },
                  child: scroll.isProgressVisible2.value
                      ? Container(
                    key: const ValueKey('progress'),
                    child: _buildProgressIndicator(),
                  )
                      : Container(
                    key: const ValueKey('empty'),
                    height: 0,
                    width: double.infinity,
                  ),
                ),
              )),
              SizedBox(height: 8),
              //_________________________________________________

              Flexible(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: scroll.scrollController2,
                  child:Column(
                    children: [
                      SizedBox(height: 32),
                      MedicalInfoHeader(
                        title: "Medical Information",
                        description:
                        'Greetings! To keep your insurance information current and facilitate ongoing communication with your healthcare providers, we kindly request that you provide your insurance details.',
                        iconPath: AppIcons.shieduserIcon,
                      ),
                      SizedBox(height: 32),
                      IconTextButton(
                        bordercolor: Appcolors.action,
                        onTap: () {
                          Get.to(SettingAddInsurance());
                        },
                        text: "App Primary Card",
                        svgAsset: AppIcons.addIcon02,
                        fontsize: 16,
                        height: 50,
                        backgroundColor: Appcolors.action,
                        textColor: Appcolors.primary,
                      ),
                      SizedBox(height: 12),
                      IconTextButton(
                        height: 50,
                        bordercolor: Appcolors.action,
                        onTap: () {
                          Get.to(SettingAddInsurance());
                        },
                        text: "App Other Card",
                        svgAsset: AppIcons.addIcon02,
                        fontsize: 16,
                        backgroundColor: Appcolors.primary,
                        textColor: Appcolors.action,
                      ),

                      SizedBox(height: 32),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2, // example number of items
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.only(
                              top: 24,
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
                                  color: TextColors.neutral300,
                                  margin: EdgeInsets.symmetric(vertical: 16),
                                ),
                                SizedBox(height: 8),
                                LabelValueText(
                                  label: "Patient Relationship to Insured",
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
                                  fontsize: 14,
                                  text: "View Card",
                                  svgAsset: AppIcons.viewIcon,
                                  backgroundColor: Appcolors.primary,
                                  bordercolor: Appcolors.action,
                                  textColor: Appcolors.action,
                                ),
                                SizedBox(height: 24),
                                AppText(
                                  "Digital Signature ",
                                  color: TextColors.neutral900,
                                  fontSize: 16,
                                ),
                                SizedBox(height: 8),
                                IconTextButton(
                                  onTap: () {},
                                  height: 40,
                                  fontsize: 14,
                                  width: 166,
                                  text: "View Signature",
                                  svgAsset: AppIcons.viewIcon,
                                  backgroundColor: Appcolors.primary,
                                  bordercolor: Appcolors.action,
                                  textColor: Appcolors.action,
                                ),

                                SizedBox(height: 24,),

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

                                SizedBox(height: 24,),
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

                      SizedBox(height: 32,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              // padding controls width
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Appcolors.primary,
                                boxShadow: [
                                  BoxShadow(
                                    color: ShadowColor.shadowColors1.withOpacity(
                                      0.10,
                                    ),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 3),
                                    blurStyle: BlurStyle.normal,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Previous",
                                style: TextStyle(
                                  fontFamily: AppConstants.FONT_FAMILY,
                                  fontSize: 16,
                                  color: TextColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => BaseScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Appcolors.action,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontFamily: AppConstants.FONT_FAMILY,
                                  fontSize: 16,
                                  color: Appcolors.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),

    );
  }

  Widget _buildProgressIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            StepCircle(
              isActive: true,
              step: '1',
              activeColor: Appcolors.action,
              inactiveColor: Colors.white,
              activeTextColor: Colors.white,
              inactiveTextColor: TextColors.neutral900,
            ),
            // FIXED: Create AnimatedLine with unique key to prevent recreation
            Expanded(
              child: Container(
                height: 1,
                color: TextColors.action,
              ),
            ),
            StepCircle(
              isActive: true,
              step: '2',
              activeColor: Appcolors.action,
              inactiveColor: Colors.white,
              activeTextColor: Colors.white,
              inactiveTextColor: TextColors.neutral900,
            ),

            Expanded(
              child: AnimatedLine(
                key: ValueKey('animated_line_step1_to_step2'), // Add unique key
                isHalfColor: true,
                onAnimationComplete: () {
                  controller.onLineAnimationComplete();
                },
              ),
            ),
            Obx(() => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.linear,
              child: StepCircle(
                isActive: controller.isStep2Active.value,
                step: '3',
                activeColor: Appcolors.action,
                inactiveColor: Colors.white,
                activeTextColor: Colors.white,
                inactiveTextColor: TextColors.neutral900,
              ),
            )),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SizedBox(
              width: 46.w,
              child: Center(
                child: Text(
                  "Step", // Fixed: Added step number
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: TextColors.action,
                    fontFamily: AppConstants.FONT_FAMILY,
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            SizedBox(
              width: 46.w,
              child: Center(
                child: Text(
                  "Step", // Fixed: Added step number
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: TextColors.action,
                    fontFamily: AppConstants.FONT_FAMILY,
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            SizedBox(
              width: 46.w,
              child: Center(
                child: Obx(() => controller.isStep2Active.value? Text(
                  "Step", // Fixed: Added step number
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: TextColors.action,
                    fontFamily: AppConstants.FONT_FAMILY,
                  ),
                ): SizedBox.shrink())
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLine({required bool isHalfColor}) {
    return Expanded(child: Container(height: 1, color:isHalfColor? TextColors.action : TextColors.neutral200));
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
