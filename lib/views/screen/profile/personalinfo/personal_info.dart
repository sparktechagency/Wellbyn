import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wellbyn/controllers/personal_info.dart';
import 'package:wellbyn/controllers/profile_controller.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/custom_field.dart';
import 'package:wellbyn/views/base/custom_text.dart';

import '../../../../controllers/dotted_boder.dart';
import '../../../../controllers/profile_setting_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/nab_ids.dart';
import '../../../base/LabelTextField/labelTextField.dart';
import '../../../base/custom_button.dart';

class PersonalInfo extends StatefulWidget {
  PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  // Move controllers and variables inside the state class
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController childrenController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController employerController = TextEditingController();

  final genderController = Get.put(PersonalInformation());

  Uint8List? frontLicenseImage;
  Uint8List? backLicenseImage;
  File? frontLicenseFile;
  File? backLicenseFile;

  final ProfileController _controller = Get.put(ProfileController());
  final ProfileSettingController controller = Get.put(
    ProfileSettingController(),
  );
  @override
  void dispose() {
    // Dispose all controllers
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    maritalStatusController.dispose();
    childrenController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressLine2Controller.dispose();
    licenseController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    employerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.45, // 60% of screen width
        child: FloatingActionButton.extended(
          onPressed: () {
            // Handle edit action
          },
          backgroundColor: TextColors.action,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.editIcon,
                color: Appcolors.primary,
              ),
              const SizedBox(width: 6),
              Text(
                "Edit details",
                style: TextStyle(
                  color: Appcolors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
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
        physics: const BouncingScrollPhysics(),
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

              // Personal Info Section
              _buildSectionContainer(
                children: [
                  LabeledTextFielded(
                    borderColor: Appcolors.primary,
                    label: "Full Name",
                    controller: firstNameController,
                    maxline: 1,

                    readOnly: true,
                    hintText: "Full Name",
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFielded(
                          controller: middleNameController,
                          filColor: Colors.white,
                          borderColor: TextColors.neutral900,
                          labelText: "Middle",
                          hintText: "Middle",
                          enabled: false,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: CustomTextFielded(
                          controller: lastNameController,
                          filColor: Colors.white,
                          borderColor: TextColors.neutral900,
                          labelText: "Last",
                          hintText: "Last",
                          enabled: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Obx(() => LabeledTextFielded(
                    maxline: 1,
                    borderColor: TextColors.neutral200,
                    label: "Date of birth ",
                    controller: TextEditingController(
                      text: controller.formattedDate.value,
                    ),
                    readOnly: true,
                    onTap: () => controller.pickDate(Get.context!),
                    suffixSvgAsset: AppIcons.calenderIcon01,
                    suffixSvgColor: Appcolors.action,
                    hintText: "mm/dd/yyyy",
                  ),),
                  SizedBox(height: 4),

                  const SizedBox(height: 20),
                  _buildLabel("Sex"),
                  _buildGenderSelection(),
                  const SizedBox(height: 20),
                  _buildLabel("Marital Status"),
                  CustomTextFielded(
                    suffixSvgAsset: AppIcons.arrowdwonIcon,
                    controller: maritalStatusController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "Select status",
                    hintText: "Select status",
                    enabled: false,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildLabel("Number of Children "),
                      AppText(
                        "(optional)",
                        fontSize: 14,
                        color: TextColors.neutral500,
                      ),
                    ],
                  ),
                  CustomTextFielded(
                    controller: childrenController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "0",
                    hintText: "0",
                    enabled: false,
                  ),
                  const SizedBox(height: 8),
                ],
              ),

              const SizedBox(height: 20),
              const SizedBox(height: 20),

              // Contact Info Section
              _buildSectionContainer(
                children: [
                  _buildLabel("Email"),
                  SizedBox(height: 8),
                  CustomTextFielded(
                    controller: emailController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "email@email.com",
                    hintText: "email@email.com",
                    enabled: false,
                  ),
                  SizedBox(height: 20),
                  _buildLabel("Phone"),
                  SizedBox(height: 5),
                  CustomTextFielded(
                    controller: phoneController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "+0015411411",
                    hintText: "+0015411411",
                    enabled: false,
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const SizedBox(height: 20),

              // Address Section
              _buildSectionContainer(
                children: [
                  Row(
                    children: [
                      _buildLabel("Address Line 2"),
                      const SizedBox(width: 4),
                      AppText(
                        "(optional)",
                        color: TextColors.neutral500,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomTextFielded(
                    controller: addressLine2Controller,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "Address Line 2",
                    hintText: "Address Line 2",
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  _buildLabel("Driver's License"),
                  const SizedBox(height: 8),
                  CustomTextFielded(
                    controller: licenseController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "License number",
                    hintText: "License number",
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("City"),
                            const SizedBox(height: 8),
                            CustomTextFielded(
                              controller: cityController,
                              filColor: Colors.white,
                              borderColor: TextColors.neutral300,
                              hintText: "City",
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
                            _buildLabel("State"),
                            const SizedBox(height: 8),
                            CustomTextFielded(
                              suffixSvgAsset: AppIcons.arrowdwonIcon,
                              controller: stateController,
                              filColor: Colors.white,
                              borderColor: TextColors.neutral300,
                              hintText: "State",
                              maxLines: 1,
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
                            _buildLabel("Zip Code"),
                            const SizedBox(height: 8),
                            CustomTextFielded(
                              controller: zipController,
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

              const SizedBox(height: 20),
              const SizedBox(height: 20),

              // Employment Section
              _buildSectionContainer(
                children: [
                  _buildLabel("Employer"),
                  const SizedBox(height: 8),
                  CustomTextFielded(
                    controller: employerController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    hintText: "Company name",
                    enabled: false,
                  ),
                  const SizedBox(height: 20),
                  _buildLabel("Driver's License"),
                  const SizedBox(height: 8),
                  CustomTextFielded(
                    controller: licenseController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "License number",
                    hintText: "License number",
                    enabled: false,
                  ),
                  const SizedBox(height: 20),
                  _buildLabel("Upload Driver's License Images"),
                  _buildImageUploadSection(),
                  AppText("Accepted formats: JPG, PNG. Max file size: 5MB",fontSize: 14,fontWeight: FontWeight.w500,color: TextColors.neutral500,),
                  const SizedBox(height: 10),

                  const SizedBox(height: 20),
                  Align(
                      alignment: Alignment.topLeft,
                      child: _buildLabel("Last 4 digits of SSN")),
                  SizedBox(height: 8.h),
                  CustomTextFielded(
                    isPassword: true,
                    borderColor: TextColors.neutral900,
                    suffixSvgAsset: AppIcons.viewIcon,
                    suffixSvgColor: TextColors.neutral500,
                    hintText: "45454",
                    prefixIcon: AppIcons.lockIcon,
                    controller: emailController,
                  ),
                  SizedBox(height: 2),
                  Align(
                    alignment: Alignment.topLeft,
                    child: AppText(
                      "For identification purposes on only",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TextColors.neutral500.withOpacity(0.80),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 80.h),

            ],
          ),
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
        // boxShadow: [
        //   BoxShadow(
        //     color: ShadowColor.shadowColors1.withOpacity(0.10),
        //     blurRadius: 4,
        //     spreadRadius: 0,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Gender.values.map((gender) {
          return Obx(() {
            final isSelected = genderController.selectedGender.value == gender;
            return GestureDetector(
              onTap: () => genderController.selectGender(gender),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
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
                        color: isSelected ? Colors.black : Colors.grey,
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
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      children: [
        const SizedBox(height: 16),
        DottedBorderContainer(
          child: AspectRatio(
            aspectRatio: 16 / 7,
            child: frontLicenseImage != null
                ? Image.memory(frontLicenseImage!, fit: BoxFit.cover)
                : _uploadLicenseButton(isFront: true),
          ),
        ),
        const SizedBox(height: 10),
        DottedBorderContainer(
          child: AspectRatio(
            aspectRatio: 16 / 7,
            child: backLicenseImage != null
                ? Image.memory(backLicenseImage!, fit: BoxFit.cover)
                : _uploadLicenseButton(isFront: false),
          ),
        ),
      ],
    );
  }

  Widget _uploadLicenseButton({required bool isFront}) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          final File? image = await _controller.pickAddImage(
            ImageSource.gallery,
          );
          if (image != null) {
            final Uint8List bytes = await image.readAsBytes();
            setState(() {
              if (isFront) {
                frontLicenseImage = bytes;
                frontLicenseFile = image;
              } else {
                backLicenseImage = bytes;
                backLicenseFile = image;
              }
            });
          } else {
            debugPrint("No image selected");
          }
        },
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
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: TextColors.neutral900,
      ),
    );
  }
}
