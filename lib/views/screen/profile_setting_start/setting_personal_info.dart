import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wellbyn/controllers/profile_setting/personal_info.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_medical_info.dart';
import 'package:wellbyn/views/screen/profile_setting_start/widget/circle.dart';
import '../../../controllers/TextField/textfield_Controller.dart';
import '../../../controllers/dotted_border/dotted_boder.dart';
import '../../../controllers/scrollController/scrollController.dart';
import '../../../controllers/stepController/stepcontroller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_icons.dart';
import '../../base/Apptext/app_text.dart';
import '../../base/LabelTextField/labelTextField.dart';
import '../../base/LableDropDownFielded/lableDropDownFielded.dart';
import '../../base/PickUpdate/pickupdate.dart';

enum Gender { male, female, other }

class SettingPersonalInfo extends StatefulWidget {
  const SettingPersonalInfo({super.key});


  @override
  State<SettingPersonalInfo> createState() => _SettingPersonalInfoState();
}

class _SettingPersonalInfoState extends State<SettingPersonalInfo> {




  final OnboardingProfileInfo _controller = Get.put(OnboardingProfileInfo(),);

  final ScrollControllerGetX scroll = Get.put(ScrollControllerGetX());
  final DropdownController  dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              begin: const Offset(0, -0.3),
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
          child: scroll.isProgressVisible.value
              ? Container(
            key: const ValueKey('progress'),
            child: _buildProgressIndicator(),
          )
              :Container(
            key: const ValueKey('empty'),
            height: 0,
            width: double.infinity,
          ),
        ),
            )),
        
              Flexible(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: scroll.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPatientInfoSection(),
        
        
                        _buildSectionContainer(children: [
        
                          LabeledTextFielded(
                              borderColor: TextColors.neutral900,
                              label: "Full Name",
                              controller: _controller.nameController,
                              maxline: 1,
                              hintText: "First Name",
                            ),
                          SizedBox(height: 8.h),
                          Row(
                              children: [
                                Expanded(
                                  child: CustomTextFielded(
                                    next: true,
                                    controller: _controller.middleNameController,
                                    hintText: "Middle",
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    borderColor: TextColors.neutral900,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: CustomTextFielded(
                                    next: true,
                                    controller: _controller.lastNameController,
                                    hintText: "Last Name",
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    borderColor: TextColors.neutral900,
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(height: 24.h),
                          CustomDatePickerField(
                            selectedDate: _controller.formattedDate,
                            onTap: () => _controller.pickDate(Get.context!),
                            hintText: "mm/dd/yyyy",
                            svgIconPath: AppIcons.calenderIcon01,
                          ),


                          SizedBox(height: 24.h),
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
        
        
        
                          SizedBox(height: 24.h),
        
                          LabeledDropdownFielded(
                            label: "Marital Status",
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
                          LabeledDropdownFielded(
                            label: "Blood Group",
                            titile: "Select Group",
                            items:[
                              "A+",
                              "A-",
                              "B+",
                              "B-",
                              "AB+",
                              "AB-",
                              "O+",
                              "O-",
                            ],
                            selectedValue: dropdownController.bloodGroup,
                            onChanged: (value) {
                              // Optional additional logic
                              print("Selected: $value");
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                              children: [
                                Text(
                                  "Number of Children",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: TextColors.neutral900,
                                    fontFamily: AppConstants.FONT_FAMILY,
                                  ),
                                ),
                                Text(
                                  " (optional)",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: TextColors.neutral500,
                                    fontFamily: AppConstants.FONT_FAMILY,
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(height: 8.h),
                          CustomTextFielded(
                              borderColor: TextColors.neutral900,
                              controller: _controller.numberOfChildController,
                              hintText: "0",
                              keyboardType: TextInputType.number,
                            ),
                          SizedBox(height: 24.h),
                          LabeledTextFielded(
                             next: true,
                             borderColor: TextColors.neutral900,
                             label: "Email",
                             controller: _controller.emailController,
                             maxline: 1,
                             hintText: "name@gmail.com",
                          ),
                          SizedBox(height: 24.h),
                          LabeledTextFielded(
                             next: true,
                             borderColor: TextColors.neutral900,
                             label: "Phone",
                             controller: _controller.phoneController,
                             keyboardType: TextInputType.number,
                             maxline: 1,
                             hintText: "+02154555585",
                          ),
        
                          SizedBox(height: 24.h),
                          LabeledTextFielded(
                            next: true,
                            borderColor: TextColors.neutral900,
                            label: "Address Line 1",
                            controller: _controller.addressController,
                            keyboardType: TextInputType.number,
                            maxline: 1,
                            hintText: "Street address",
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Text(
                                "Address Line 2",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: TextColors.neutral900,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                              ),
                              Text(
                                " (optional)",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: TextColors.neutral500,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                ),
                              ),
                            ],
                          ),
                          CustomTextFielded(
                            borderColor: TextColors.neutral900,
                            controller: _controller.numberOfChildController,
                            hintText: "Apartment, suite, unit,etc",
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 24.h),
        
                          Row(
                            children: [
                              Expanded(
                                child: LabeledTextFielded(
                                  next: true,
                                  borderColor: TextColors.neutral900,
                                  label: "City",
                                  controller: _controller.phoneController,
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
                                  label: "Zip Code",
                                  controller: _controller.phoneController,
                                  keyboardType: TextInputType.number,
                                  maxline: 1,
                                  hintText: "",
                                ),
                              ),
                            ],
                          ),
        
                          SizedBox(height: 24.h,),
                          LabeledTextFielded(
                            next: true,
                            borderColor: TextColors.neutral900,
                            label: "Driver's License",
                            controller: _controller.addressController,
                            keyboardType: TextInputType.number,
                            maxline: 1,
                            hintText: "License number",
                          ),
                          SizedBox(height: 24.h,),
                          AppText("Upload Driver's License Images",fontSize: 16,fontWeight: FontWeight.w500,),
                          _buildImageUploadSection(),
                          const SizedBox(height: 12),
                          Text(
                            "Accepted formats: JPG, PNG. Max file size: 5MB",
                            style: TextStyle(
                              fontFamily: AppConstants.FONT_FAMILY,
                              fontWeight: FontWeight.w500,
                              color: TextColors.neutral500,
                              fontSize: 14,
                            ),
                          ),
        
                          SizedBox(height: 24.h,),
        
                          const SizedBox(height: 20),
                          AppText("Last 4 Digits Of SSN",fontWeight: FontWeight.w500, fontSize: 16,),
        
                          SizedBox(height: 8.h),
        
                          CustomTextFielded(
                            isPassword: true,
                            borderColor: TextColors.neutral900,
                            suffixSvgAsset: AppIcons.viewIcon,
                            suffixSvgColor: TextColors.neutral500,
                            hintText: "45454",
                            prefixIcon: AppIcons.lockIcon,
                            controller: _controller.ssnController,
                          ),
                          SizedBox(height: 6.h,),
                          AppText("For identification purposes only",fontWeight: FontWeight.w500, fontSize: 16,color: TextColors.neutral500,),
                        ],
                        ),
        
                        const SizedBox(height: 52),
                        _buildNavigationButtons(),
                        const SizedBox(height: 35),
                      ],
                    ),
                  ),
             ),
              
            ],
          ),
        ),
      ),
    );
  }

  //===========> here our app bar <===========
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Appcolors.page,
      title: Text(
        "Profile Settings",
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
        onPressed: () => Get.back(),
        icon: SvgPicture.asset(
          'assets/icons/arrow-left.svg',
          width: 30.w,
          height: 30.h,
          color: TextColors.neutral900,
        ),
      ),
    );
  }
  //=============> progress indicator <============
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
            _buildLine(isHalfColor: false),
            StepCircle(
              isActive: false,
              step: '2',
              activeColor: Appcolors.action,
              inactiveColor: Colors.white,
              activeTextColor: Colors.white,
              inactiveTextColor: TextColors.neutral900,
            ),
            _buildLine(isHalfColor: false),
            StepCircle(
              isActive: false,
              step: '3',
              activeColor: Appcolors.action,
              inactiveColor: Colors.white,
              activeTextColor: Colors.white,
              inactiveTextColor: TextColors.neutral900,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SizedBox(
              width: 46.w,
              child: Center(
                child: Text(
                  "Step ",
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
                  "Step ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: TextColors.neutral500,
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
                  "Step ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: TextColors.neutral500,
                    fontFamily: AppConstants.FONT_FAMILY,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  //=============> patiendt info here <=========
  Widget _buildPatientInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Row(
          children: [
            SvgPicture.asset(AppIcons.settingIcon),
            const SizedBox(width: 6),
            AppText(
              "Patient Information",
              fontSize: 16,
              color: TextColors.neutral900,
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          "Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.",
          style: TextStyle(
            fontSize: 14,
            fontFamily: AppConstants.FONT_FAMILY,
            color: TextColors.neutral500,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: InkWell(
            onTap: Get.back,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                      color: ShadowColor.shadowColors1.withOpacity(0.10), // Shadow color
                      blurRadius: 4, // Softness
                      spreadRadius: 0,
                      offset: Offset(0, 3), // Position of shadow
                      blurStyle: BlurStyle.normal
                  ),
                ],
              ),
              child: Center(
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
          ),
        ),
        SizedBox(width: 115),
        Expanded(
          child: InkWell(
            onTap: () => Get.to(SettingMedicalInfo()),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Appcolors.action,
              ),
              child: Center(
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
          ),
        ),
      ],
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Obx(
          () => GestureDetector(
            onTap: () => _controller.pickLicenseImage(isFront: true),
            child: DottedBorderContainer(
              child: AspectRatio(
                aspectRatio: 16 / 6,
                child: _controller.isFrontUploading.value
                    ? Center(child: Lottie.asset(
                  'assets/animations/loading.json',
                  onLoaded: (composition) {
                  },
                ),):
                _controller.frontLicenseImage.value != null
                    ? Image.memory(
                        _controller.frontLicenseImage.value!,
                        fit: BoxFit.cover,
                      )
                    : _uploadLicenseContent(isFront: true),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => GestureDetector(
            onTap: () => _controller.pickLicenseImage(isFront: false),
            child: DottedBorderContainer(
              child: AspectRatio(
                aspectRatio: 16 / 6,
                child: _controller.backLicenseImage.value != null
                    ? Image.memory(
                        _controller.backLicenseImage.value!,
                        fit: BoxFit.cover,
                      )
                    : _uploadLicenseContent(isFront: false),
              ),
            ),
          ),
        ),
      ],
    );
  }
//========================================> _uploadLicenseContent design <===================
  Widget _uploadLicenseContent({required bool isFront}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.cameraIcons),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                fontSize: 16,
                'Upload/capture License ',
                color: TextColors.neutral500,
              ),
              AppText(
                fontSize: 16,
                isFront ? 'Front' : 'Back',
                color: TextColors.action,
              ),
            ],
          ),
        ],
      ),
    );
  }

//========================================> _buildSectionContainer <===================
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
        padding: const EdgeInsets.all(8),
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

//========================================> animated line here animation show the Animated container <===================
class AnimatedLine extends StatefulWidget {
  final bool isHalfColor;
  final double height;
  final Duration duration;
  final Duration delay;
  final VoidCallback? onAnimationComplete;

  const AnimatedLine({
    Key? key,
    required this.isHalfColor,
    this.height = 1.0,
    this.duration = const Duration(milliseconds: 1000),
    this.delay = const Duration(milliseconds: 400),
    this.onAnimationComplete,
  }) : super(key: key);

  @override
  _AnimatedLineState createState() => _AnimatedLineState();
}

class _AnimatedLineState extends State<AnimatedLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Check if animation should run
    try {
      final controller = Get.find<StepController>();
      if (controller.hasAnimated.value) {
        // Animation already completed, set to end state immediately
        _controller.value = 1.0;
        _hasAnimated = true;
      } else {
        // Start animation only if not already animated
        _startAnimation();
      }
    } catch (e) {
      // If controller not found, start animation normally
      _startAnimation();
    }
  }

  void _startAnimation() {
    Future.delayed(widget.delay, () {
      if (mounted && !_hasAnimated) {
        _controller.forward().whenComplete(() {
          _hasAnimated = true;
          if (widget.onAnimationComplete != null) {
            widget.onAnimationComplete!();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: widget.height,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                width: MediaQuery.of(context).size.width * _animation.value,
                height: widget.height,
                color: widget.isHalfColor ? Colors.blue : Colors.grey,
              );
            },
          ),
        ],
      ),
    );
  }
}




