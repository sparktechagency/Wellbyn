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
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/custom_field.dart';

import '../../../controllers/dotted_boder.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nab_ids.dart';
import '../../base/custom_button.dart';

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
                title: "Personal Info",
                children: [
                  _buildLabel("Full name"),
                  SizedBox(height: 8),
                  CustomTextField(
                    controller: firstNameController,
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
                          controller: middleNameController,
                          filColor: Colors.white,
                          borderColor: TextColors.neutral900,
                          labelText: "Middle",
                          enabled: false,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: CustomTextField(
                          controller: lastNameController,
                          filColor: Colors.white,
                          borderColor: TextColors.neutral900,
                          labelText: "Last",
                          enabled: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildLabel("Date of birth"),
                  SizedBox(height: 6),
                  CustomTextFields(
                    suffixIcon: AppIcons.calenderIcon01,
                    controller: dobController,
                    filColor: Colors.white,
                    iconColor: Appcolors.action,
                    borderColor: TextColors.neutral300,
                    labelText: "mm/dd/yyyy",
                    enabled: false,
                  ),
                  SizedBox(height: 4),
                  AppText(
                    "0 years old",
                    color: TextColors.neutral500,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 20),
                  _buildLabel("Sex"),
                  _buildGenderSelection(),
                  const SizedBox(height: 20),
                  _buildLabel("Marital Status"),
                  CustomTextFields(
                    suffixIcon: AppIcons.arrowdwonIcon,
                    controller: maritalStatusController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "Select status",
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
                  CustomTextFields(
                    controller: childrenController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "0",
                    enabled: false,
                  ),
                  const SizedBox(height: 8),
                ],
              ),

              const SizedBox(height: 20),
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),

              // Contact Info Section
              _buildSectionContainer(
                title: "Contact Info",
                children: [
                  _buildLabel("Email"),
                  SizedBox(height: 8),
                  CustomTextFields(
                    controller: emailController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "email@email.com",
                    enabled: false,
                  ),
                  SizedBox(height: 8),
                  _buildLabel("Phone"),
                  SizedBox(height: 5),
                  CustomTextFields(
                    controller: phoneController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "+0015411411",
                    enabled: false,
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),

              // Address Section
              _buildSectionContainer(
                title: "Address",
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
                  CustomTextFields(
                    controller: addressLine2Controller,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "Address Line 2",
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  _buildLabel("Driver's License"),
                  const SizedBox(height: 8),
                  CustomTextFields(
                    controller: licenseController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "License number",
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
                            CustomTextFields(
                              controller: cityController,
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
                            _buildLabel("State"),
                            const SizedBox(height: 8),
                            CustomTextFields(
                              iconSize: 16,
                              suffixIcon: AppIcons.arrowdwonIcon,
                              controller: stateController,
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
                            _buildLabel("Zip Code"),
                            const SizedBox(height: 8),
                            CustomTextFields(
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
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),

              // Employment Section
              _buildSectionContainer(
                title: "Employment",
                children: [
                  _buildLabel("Employer"),
                  const SizedBox(height: 8),
                  CustomTextFields(
                    controller: employerController,
                    filColor: Colors.white,
                    borderColor: TextColors.neutral300,
                    labelText: "Company name",
                    enabled: false,
                  ),
                  const SizedBox(height: 20),
                  _buildLabel("Upload Driver's License Images"),
                  const SizedBox(height: 5),
                  _buildImageUploadSection(),
                ],
              ),

              const SizedBox(height: 10),
              _buildLabel("Accepted formats:JPG,PNG. Max file size: 5MB"),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.topLeft,
                  child: _buildLabel("Last 4 digits of SSN")),
              TextField(
                controller: emailController,
                enabled: false,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Satoshi",
                  color: TextColors.neutral500,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      color: TextColors.neutral500,
                      AppIcons.viewIcon,
                      height: 15,
                      width: 15,
                    ),
                  ),
                  fillColor: Appcolors.primary,
                  labelText: "454545",
                  labelStyle: TextStyle(
                    color: TextColors.neutral500,
                    fontSize: 14,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: TextColors.neutral500),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: TextColors.neutral500),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: TextColors.neutral500.withOpacity(0.4),
                    ),
                  ),

                  // ✅ Change this:
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(Icons.lock),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 28,
                    maxWidth: 32,
                  ),
                ),
              ),
              SizedBox(height: 2),
              Align(
                alignment: Alignment.topLeft,
                child: AppText(
                  "For identification purposes on only",
                  fontSize: 14,
                  color: TextColors.neutral500,
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

  Widget _buildSectionContainer({
    required String title,
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
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0.2, 0.2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            AppText(title, color: TextColors.neutral500),
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
  final String? preffixIcon;
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
    this.preffixIcon,
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
                  height: iconSize ?? 20,
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
