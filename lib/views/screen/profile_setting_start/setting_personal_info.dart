import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/controllers/profile_setting_controller.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_medical_info.dart';
import 'package:wellbyn/views/screen/profile_setting_start/widget/circle.dart';
import '../../../controllers/dotted_boder.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_icons.dart';
import '../../base/app_text.dart';

enum Gender { male, female, other }

class SettingPersonalInfo extends StatefulWidget {
  SettingPersonalInfo({super.key});

  static const List<String> bloodGroups = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
  ];
  static const List<String> states = [
    "AO",
    "AI",
    "BI",
    "CD",
    "HI+",
    "CO-",
    "HO",
    "KA",
  ];
  static const List<String> maritalStatuses = [
    "Single",
    "Married",
    "Divorced",
    "Widowed",
    "Separated",
    "Unknown",
  ];

  @override
  State<SettingPersonalInfo> createState() => _SettingPersonalInfoState();
}

class _SettingPersonalInfoState extends State<SettingPersonalInfo> {
  // Controllers should be final and initialized in the constructor
  late final TextEditingController _nameController;
  late final TextEditingController _middleNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _cityController;
  late final TextEditingController _zipController;
  late final TextEditingController _childrenController;
  late final TextEditingController _employerController;
  late final TextEditingController _licenseController;
  late final TextEditingController _ssnController;
  late final TextEditingController _numboroffchlid;

  late final ProfileSettingController _controller = Get.put(
    ProfileSettingController(),
  );

  @override
  void initState() {
    super.initState();
    // Initialize controllers only once
    _nameController = TextEditingController();
    _middleNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _cityController = TextEditingController();
    _zipController = TextEditingController();
    _childrenController = TextEditingController();
    _employerController = TextEditingController();
    _licenseController = TextEditingController();
    _ssnController = TextEditingController();
    _numboroffchlid = TextEditingController();
  }

  @override
  void dispose() {
    // Properly dispose all controllers to prevent memory leaks
    _nameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _zipController.dispose();
    _childrenController.dispose();
    _employerController.dispose();
    _licenseController.dispose();
    _ssnController.dispose();
    _numboroffchlid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressIndicator(),
              _buildPatientInfoSection(),
              _buildPersonalInfoSection(),
              _buildContactInfoSection(),
              _buildAddressSection(),
              _buildAdditionalInfoSection(),
              const SizedBox(height: 52),
              _buildNavigationButtons(),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  // Extracted widget methods to break down the build method
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Appcolors.page,
      title: Text(
        "Profile Settings",
        style: TextStyle(
          fontSize: 20,
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
          width: 30.w,
          height: 30.h,
          color: TextColors.neutral900,
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
                child: TypingTextWidget(text: "Step",
                  style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: TextColors.action,
                  fontFamily: "Satoshi",
                ),)
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
                    fontFamily: "Satoshi",
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
                    fontFamily: "Satoshi",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

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
              fontSize: 18,
              color: TextColors.neutral900,
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          "Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.",
          style: TextStyle(
            fontSize: 14,
            color: TextColors.neutral500,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _buildPersonalInfoSection() {
    return _buildSectionContainer(
      title: "Personal Info",
      children: [
        LabeledTextField(
          borderColor: TextColors.neutral900,
          label: "Full Name",
          controller: _nameController,
          next: true,
          maxline: 1,
          hintText: "First Name",
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: CustomTextFielde(
                next: true,
                controller: _middleNameController,
                hintText: "Middle",
                keyboardType: TextInputType.name,
                maxLines: 1,
                borderColor: TextColors.neutral900,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomTextFielde(
                next: true,
                controller: _lastNameController,
                hintText: "Last",
                keyboardType: TextInputType.name,
                maxLines: 1,
                borderColor: TextColors.neutral900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Obx(
          () => LabeledTextFields(
            maxline: 1,
            borderColor: TextColors.neutral200,
            label: "Date of birth ",
            controller: TextEditingController(
              text: _controller.formattedDate.value,
            ),
            readOnly: true,
            onTap: () => _controller.pickDate(Get.context!),
            suffixSvgAsset: AppIcons.calenderIcon01,
            suffixSvgColor: Appcolors.action,
            hintText: "mm/dd/yyyy",
          ),
        ),
        const SizedBox(height: 20),
        _buildLabel("Sex"),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGenderButton("Male"),
              _buildGenderButton("Female"),
              _buildGenderButton("Other"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => LabeledDropdownFieldes(
            titile: "Marital Status",
            label: "Marital Status",
            items: SettingPersonalInfo.maritalStatuses,
            selectedValue: _controller.selectedMarital.value.isEmpty
                ? null
                : _controller.selectedMarital.value,
            onChanged: _controller.selectecMarital,
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => LabeledDropdownFieldes(
            titile: "Blood Group Selected ",
            label: "Blood Group",
            items: SettingPersonalInfo.bloodGroups,
            selectedValue: _controller.selectedBloodGroup.value.isEmpty
                ? null
                : _controller.selectedBloodGroup.value,
            onChanged: _controller.selectedBloodGroup,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              "Number of Children",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: TextColors.neutral900,
                fontFamily: "Satoshi",
              ),
            ),
            Text(
              " (optional)",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: TextColors.neutral500,
                fontFamily: "Satoshi",
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomTextFielde(
          borderColor: TextColors.neutral900,
          controller: _numboroffchlid,
          hintText: "0",
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildContactInfoSection() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Divider(height: 1, color: TextColors.neutral200),
        const SizedBox(height: 20),
        _buildSectionContainer(
          title: "Contact info",
          children: [
            LabeledTextField(
              next: true,
              borderColor: TextColors.neutral900,
              label: "Email",
              controller: _emailController,
              maxline: 1,
              hintText: "name@gmail.com",
            ),
            const SizedBox(height: 20),
            LabeledTextField(
              next: true,
              borderColor: TextColors.neutral900,
              label: "Phone",
              controller: _phoneController,
              keyboardType: TextInputType.number,
              maxline: 1,
              hintText: "+02154555585",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddressSection() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Divider(height: 1, color: TextColors.neutral200),
        const SizedBox(height: 20),
        _buildSectionContainer(
          title: "Address",
          children: [
            LabeledTextField(
              next: true,
              borderColor: TextColors.neutral900,
              label: "Address Line 1",
              controller: _addressController,
              maxline: 1,
              hintText: "Street address",
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Address Line 2 ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: TextColors.neutral900,
                    fontFamily: "Satoshi",
                  ),
                ),
                Text(
                  " (optional)",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: TextColors.neutral500,
                    fontFamily: "Satoshi",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomTextFielde(
              borderColor: TextColors.neutral900,
              controller: _middleNameController,
              hintText: "Apartment, suite, unit, etc.",
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "City",
                        fontSize: 16,
                        color: TextColors.neutral900,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextFieldeses(
                        borderColor: TextColors.neutral900,
                        controller: _cityController,
                        maxLines: 1,
                        hintText: "City",
                        keyboardType: TextInputType.text,
                        contentPaddingVertical: 13,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "State",
                        fontSize: 16,
                        color: TextColors.neutral900,
                      ),
                      SizedBox(height: 8.h),
                      Obx(
                        () => CustomDropdownDialogss(
                          items: SettingPersonalInfo.states,
                          titile: "Select State",
                          selectedValue: _controller.selectedState.value.isEmpty
                              ? null
                              : _controller.selectedState.value,
                          onChanged: _controller.selecteStated,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "ZIP",
                        fontSize: 16,
                        color: TextColors.neutral900,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextFieldeses(
                        borderColor: TextColors.neutral900,
                        controller: _zipController,
                        hintText: "ZIP code",
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        contentPaddingVertical: 13,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdditionalInfoSection() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Divider(height: 1, color: TextColors.neutral200),
        const SizedBox(height: 20),
        _buildSectionContainer(
          title: "Additional info",
          children: [
            LabeledTextField(
              next: true,
              borderColor: TextColors.neutral900,
              label: "Employer",
              controller: _employerController,
              maxline: 1,
              hintText: "Company name",
            ),
            const SizedBox(height: 20),
            LabeledTextField(
              next: true,
              borderColor: TextColors.neutral900,
              label: "Driver's License",
              controller: _licenseController,
              maxline: 1,
              hintText: "License number",
            ),
            const SizedBox(height: 20),
            _buildLabel("Upload Driver's License Images"),
            const SizedBox(height: 5),
            _buildImageUploadSection(),
            const SizedBox(height: 10),
            Text(
              "Accepted formats: JPG, PNG. Max file size: 5MB",
              style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w500,
                color: TextColors.neutral500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: _buildLabel("Last 4 digits of SSN"),
            ),
            const SizedBox(height: 8),
            CustomTextFielde(
              borderColor: TextColors.neutral900,
              suffixSvgAsset: AppIcons.viewIcon,
              suffixSvgColor: TextColors.neutral500,
              hintText: "45454",
              prefixIcon: AppIcons.lockIcon,
              controller: _ssnController,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "For identification purposes only",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Satoshi",
                  color: TextColors.neutral500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
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
                borderRadius: BorderRadius.circular(10),
                color: Appcolors.primary,
                border: Border.all(width: 1, color: TextColors.neutral900),
              ),
              child: Center(
                child: Text(
                  "Previous",
                  style: TextStyle(
                    fontFamily: "Satoshi",
                    fontSize: 16,
                    color: TextColors.neutral900,
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
                    fontFamily: "Satoshi",
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
                aspectRatio: 16 / 7,
                child: _controller.frontLicenseImage.value != null
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
                aspectRatio: 16 / 7,
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

  Widget _buildGenderButton(String label) {
    return Obx(() {
      bool isSelected = _controller.selectedGender.value == label;
      return GestureDetector(
        onTap: () => _controller.selectGender(label),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Appcolors.action),
              ),
              child: isSelected
                  ? Container(
                      margin: const EdgeInsets.all(2.8),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontFamily: "Satoshi",
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: "Satoshi",
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
            offset: const Offset(0.2, 0.2),
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

  Widget _buildStep({required bool isActive, required String step}) {
    return Container(
      width: 46.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: isActive ? Appcolors.action : Colors.white,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        step,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: isActive ? Colors.white : TextColors.neutral900,
        ),
      ),
    );
  }

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

// Keep all your other widget classes (CustomDropdownDialogss, LabeledDropdownFieldes,
// CustomTextFielde, LabeledTextField, CustomTextFieldeses, LabeledTextFields)
// as they are, but ensure they use const constructors where possible

class CustomDropdownDialogss extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final String titile;
  final ValueChanged<String> onChanged;

  const CustomDropdownDialogss({
    Key? key,
    required this.items,
    this.selectedValue,
    required this.titile,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownDialogState createState() => _CustomDropdownDialogState();
}

class _CustomDropdownDialogState extends State<CustomDropdownDialogss> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  Future<void> _openDialog() async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) => _DropdownDialogContent(
        title: widget.titile,
        items: widget.items,
        selectedValue: _selectedValue,
      ),
    );

    if (selected != null && selected != _selectedValue) {
      setState(() => _selectedValue = selected);
      widget.onChanged(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openDialog,
      borderRadius: BorderRadius.circular(8),
      child: _DropdownInputDecorator(selectedValue: _selectedValue),
    );
  }
}

class _DropdownDialogContent extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? selectedValue;

  const _DropdownDialogContent({
    required this.title,
    required this.items,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Appcolors.page,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: _DropdownList(items: items, selectedValue: selectedValue),
      ),
    );
  }
}

class _DropdownList extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;

  const _DropdownList({required this.items, required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => _DropdownListItem(
        item: items[index],
        isSelected: items[index] == selectedValue,
      ),
    );
  }
}

class _DropdownListItem extends StatelessWidget {
  final String item;
  final bool isSelected;

  const _DropdownListItem({required this.item, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? Appcolors.action.withOpacity(0.1)
          : Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(
          item,
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 15,
            color: isSelected ? Appcolors.action : Colors.black,
          ),
        ),
        trailing: isSelected
            ? const Icon(Icons.check, color: Appcolors.action, size: 20)
            : null,
        onTap: () => Navigator.pop(context, item),
      ),
    );
  }
}

class _DropdownInputDecorator extends StatelessWidget {
  final String? selectedValue;

  const _DropdownInputDecorator({required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        filled: true,
        fillColor: Appcolors.primary,
        contentPadding: const EdgeInsets.only(
          left: 10,
          right: 15,
          top: 4,
          bottom: 4,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: BorderColors.tertiary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            AppIcons.arrowdwonIcon,
            color: TextColors.neutral900,
          ),
        ),
      ),
      child: Text(
        selectedValue ?? 'Select state',
        style: TextStyle(
          color: selectedValue == null ? Colors.grey[600] : Colors.black,
          fontWeight: selectedValue == null ? FontWeight.w600 : FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}

class LabeledDropdownFieldes extends StatelessWidget {
  final String label;
  final String titile;
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const LabeledDropdownFieldes({
    super.key,
    required this.titile,
    required this.label,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(label, fontSize: 16, color: TextColors.neutral900),
        SizedBox(height: 6.h),
        CustomDropdownDialogss(
          items: items,
          titile: titile,
          selectedValue: selectedValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class CustomTextFielde extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Color? borderColor;
  final String? prefixIcon;
  final String? hintText;
  final VoidCallback? onTap;
  final bool readOnly;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final bool? isEmail;
  final AutovalidateMode autovalidateMode;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final bool enabled;
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
  final bool next;
  final Color? fillColor;

  const CustomTextFielde({
    super.key,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.hintText,
    this.borderColor,
    this.prefixIcon,
    this.next = false,
    this.suffixIcon,
    this.validator,
    this.isEmail,
    required this.controller,
    this.keyboardType,
    this.fillColor,
    this.isPassword = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.onChanged,
    this.maxLines,
    this.enabled = true,
    this.suffixSvgAsset,
    this.suffixSvgColor,
    this.onTap,
    this.readOnly = false,
  });

  @override
  State<CustomTextFielde> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFielde> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autovalidateMode,
      controller: widget.controller,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      obscuringCharacter: '*',
      enabled: widget.enabled,
      textInputAction: widget.next
          ? TextInputAction.next
          : TextInputAction.done,
      onFieldSubmitted: (_) => widget.next
          ? FocusScope.of(context).nextFocus()
          : FocusScope.of(context).unfocus(),
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      validator: widget.validator ?? _defaultValidator,
      cursorColor: TextColors.neutral900,
      obscureText: widget.isPassword ? _obscureText : false,
      onChanged: widget.onChanged,
      style: _textStyle,
      decoration: _buildInputDecoration(),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter ${widget.hintText?.toLowerCase() ?? 'this field'}";
    }
    if (widget.isEmail == true &&
        !AppConstants.emailValidator.hasMatch(value)) {
      return "Please check your email!";
    }
    return null;
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      focusedBorder: _focusedBorder,
      prefixIcon: _buildPrefixIcon(),
      enabledBorder: _enabledBorder,
      disabledBorder: _disabledBorder,
      errorBorder: _errorBorder,
      suffixIcon: _buildSuffixIcon(),
      focusedErrorBorder: _focusedErrorBorder,
      contentPadding: _contentPadding,
      fillColor: widget.fillColor,
      prefixIconColor: TextColors.neutral900,
      hintText: widget.hintText,
      hintStyle: _hintStyle,
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon == null) return null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SvgPicture.asset(
        widget.prefixIcon!,
        width: 16.w,
        height: 16.w,
        colorFilter: const ColorFilter.mode(
          TextColors.neutral500,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        onPressed: _toggleObscureText,
        padding: const EdgeInsets.all(10),
      );
    }

    if (widget.suffixSvgAsset != null) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          widget.suffixSvgAsset!,
          width: 20.w,
          height: 20.w,
          colorFilter: ColorFilter.mode(
            widget.suffixSvgColor ?? TextColors.neutral900,
            BlendMode.srcIn,
          ),
        ),
      );
    }

    return widget.suffixIcon;
  }

  // Static styles to avoid recreation
  static const _textStyle = TextStyle(
    color: TextColors.neutral900,
    fontSize: 15,
    fontFamily: "Satoshi",
    fontWeight: FontWeight.w500,
  );

  static const _hintStyle = TextStyle(
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: TextColors.secondary,
  );

  EdgeInsets get _contentPadding => EdgeInsets.symmetric(
    horizontal: widget.contentPaddingHorizontal ?? 10.w,
    vertical: widget.contentPaddingVertical ?? 12.w,
  );

  OutlineInputBorder get _focusedBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(
      width: 1.5,
      color: widget.borderColor ?? BorderColors.primary,
    ),
  );

  OutlineInputBorder get _enabledBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(width: 1, color: BorderColors.tertiary),
  );

  OutlineInputBorder get _disabledBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(width: 1, color: BorderColors.disabled),
  );

  OutlineInputBorder get _errorBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: BorderColors.error),
  );

  OutlineInputBorder get _focusedErrorBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: BorderColors.error, width: 2),
  );
}

class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final bool? isEmail;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
  final String? prefixIcon;
  final Color? borderColor; // Add this
  final int? maxline;
  final bool next;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.isEmail,
    this.next = false,
    this.keyboardType,
    this.suffixIcon,
    this.suffixSvgAsset,
    this.suffixSvgColor,
    this.prefixIcon,
    this.maxline,
    this.borderColor, // Add this to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(label, fontSize: 16, color: TextColors.neutral900),
        SizedBox(height: 8.h),
        CustomTextFielde(
          controller: controller,
          hintText: hintText,
          isPassword: isPassword,
          isEmail: isEmail,
          keyboardType: keyboardType,
          suffixIcon: suffixIcon,
          suffixSvgAsset: suffixSvgAsset,
          suffixSvgColor: suffixSvgColor,
          prefixIcon: prefixIcon,
          maxLines: maxline,
          next: next,
          borderColor: borderColor, // Pass borderColor here
        ),
      ],
    );
  }
}

class CustomTextFieldeses extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final VoidCallback? onTap;
  final bool? readOnly;
  final Color? borderColor;
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
  final String? obscure;
  final Color? filColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final bool isPassword;
  final bool? isEmail;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final bool? enabled;
  final int? height;

  const CustomTextFieldeses({
    super.key,
    this.suffixSvgAsset,
    this.onTap,
    this.readOnly,
    this.suffixSvgColor,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.hintText,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
    this.validator,
    this.isEmail,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscure = '*',
    this.filColor,
    this.labelText,
    this.isPassword = false,
    this.autovalidateMode,
    this.onChanged,
    this.maxLines,
    this.enabled,
  });

  @override
  State<CustomTextFieldeses> createState() => _CustomTextFieldStates();
}

class _CustomTextFieldStates extends State<CustomTextFieldeses> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.disabled,
      controller: widget.controller,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscure!,
      enabled: widget.enabled ?? true,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      // validator: widget.validator,
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Please enter ${widget.hintText?.toLowerCase() ?? 'this field'}";
            }
            if (widget.isEmail == true) {
              bool isValidEmail = AppConstants.emailValidator.hasMatch(value);
              if (!isValidEmail) {
                return "Please check your email!";
              }
            }
            return null;
          },

      cursorColor: TextColors.neutral900,
      obscureText: widget.isPassword ? obscureText : false,
      onChanged: widget.onChanged,
      style: TextStyle(
        color: TextColors.neutral900,
        fontSize: 15,
        fontFamily: "Satoshi",
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1,
            color: widget.borderColor ?? BorderColors.primary,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1,
            color: BorderColors.tertiary, // don't use widget.borderColor here
          ),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1,
            color: BorderColors.primary, // separate color
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.contentPaddingHorizontal ?? 8.w,
          vertical:
              widget.contentPaddingVertical ?? 6.h, // reduced vertical padding
        ),

        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: toggle,
                child: _suffixIcon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : widget.suffixSvgAsset != null
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 9,
                ),
                child: SvgPicture.asset(
                  widget.suffixSvgAsset!,
                  width: 18.w,
                  height: 18.w,
                  colorFilter: ColorFilter.mode(
                    widget.suffixSvgColor ?? TextColors.neutral900,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : widget.suffixIcon,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: BorderColors.error),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: BorderColors.error, width: 2),
        ),

        fillColor: widget.filColor,
        prefixIconColor: TextColors.neutral900,

        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: TextColors.secondary,
        ),
      ),
    );
  }

  _suffixIcon(IconData icon) {
    return Padding(padding: const EdgeInsets.all(10.0), child: Icon(icon));
  }
}

class LabeledTextFields extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final Color? borderColor;
  final int? maxline;
  final bool isPassword;
  final bool? isEmail;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final bool? readOnly;
  final bool? enabled;

  const LabeledTextFields({
    super.key,
    this.borderColor,
    required this.label,
    this.maxline,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.isEmail,
    this.keyboardType,
    this.suffixIcon,
    this.suffixSvgAsset,
    this.suffixSvgColor,
    this.onTap,
    this.enabled,
    this.readOnly,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          //fontWeight: FontWeight.w500,
          fontSize: 16,
          color: TextColors.neutral900,
        ),
        SizedBox(height: 6.h),
        CustomTextFieldeses(
          enabled: enabled,
          controller: controller,
          hintText: hintText,
          isPassword: isPassword,
          isEmail: isEmail,
          keyboardType: keyboardType,
          suffixIcon: suffixIcon,
          suffixSvgAsset: suffixSvgAsset,
          suffixSvgColor: suffixSvgColor,
          prefixIcon: prefixIcon,
          contentPaddingVertical: 12,
          borderColor: borderColor,
          maxLines: maxline,
          readOnly: readOnly,
          onTap: onTap,
        ),
      ],
    );
  }
}

class AnimatedLine extends StatefulWidget {
  final bool isHalfColor;
  final double height;
  final Duration duration;
  final Duration delay;
  final VoidCallback? onAnimationComplete; // NEW

  const AnimatedLine({
    Key? key,
    required this.isHalfColor,
    this.height = 1.0,
    this.duration = const Duration(milliseconds: 1000),
    this.delay = const Duration(milliseconds: 400),
    this.onAnimationComplete, // NEW
  }) : super(key: key);

  @override
  _AnimatedLineState createState() => _AnimatedLineState();
}

class _AnimatedLineState extends State<AnimatedLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

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

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward().whenComplete(() {
          if (widget.onAnimationComplete != null) {
            widget.onAnimationComplete!(); // Trigger callback
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


//
// class TypingTextWidget extends StatelessWidget {
//   final String text;
//   final TextStyle? style;
//   final Duration speed;
//
//   TypingTextWidget({
//     Key? key,
//     required this.text,
//     this.style,
//     this.speed = const Duration(milliseconds: 100),
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(TypingTextController(fullText: text, speed: speed));
//     controller.startTyping();
//
//     return Obx(() => Text(controller.displayedText.value, style: style));
//   }
// }
//
// class TypingTextController extends GetxController {
//   RxString displayedText = "".obs;
//   int currentIndex = 0;
//   late Timer _timer;
//
//   final String fullText;
//   final Duration speed;
//
//   TypingTextController({required this.fullText, this.speed = const Duration(milliseconds: 100)});
//
//   void startTyping() {
//     _timer = Timer.periodic(speed, (timer) {
//       if (currentIndex < fullText.length) {
//         displayedText.value += fullText[currentIndex];
//         currentIndex++;
//       } else {
//         _timer.cancel();
//       }
//     });
//   }
//
//   @override
//   void onClose() {
//     _timer.cancel();
//     super.onClose();
//   }
// }


// Controller
class TypingTextController extends GetxController {
  RxString displayedText = "".obs;
  int currentIndex = 0;
  late Timer _timer;

  final String fullText;
  final Duration speed;
  final Duration delay;
  final VoidCallback? onTypingComplete;

  TypingTextController({
    required this.fullText,
    this.speed = const Duration(milliseconds: 200),
    this.delay = Duration.zero,
    this.onTypingComplete,
  });

  void startTyping() {
    Future.delayed(delay, () {
      _timer = Timer.periodic(speed, (timer) {
        if (currentIndex < fullText.length) {
          displayedText.value += fullText[currentIndex];
          currentIndex++;
        } else {
          _timer.cancel();
          onTypingComplete?.call(); // <-- Trigger callback here
        }
      });
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}

// Widget
class TypingTextWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration speed;
  final Duration delay;
  final VoidCallback? onComplete; // <-- Add this

  const TypingTextWidget({
    Key? key,
    required this.text,
    this.style,
    this.speed = const Duration(milliseconds: 200),
    this.delay = Duration.zero,
    this.onComplete,
  }) : super(key: key);

  @override
  State<TypingTextWidget> createState() => _TypingTextWidgetState();
}

class _TypingTextWidgetState extends State<TypingTextWidget> {
  late TypingTextController controller;

  @override
  void initState() {
    super.initState();

    // Ensure old controller (if any) is removed before re-putting
    if (Get.isRegistered<TypingTextController>(tag: widget.text)) {
      Get.delete<TypingTextController>(tag: widget.text);
    }

    controller = Get.put(
      TypingTextController(
        fullText: widget.text,
        speed: widget.speed,
        delay: widget.delay,
        onTypingComplete: widget.onComplete,
      ),
      tag: widget.text,
    );

    controller.startTyping();
  }


  @override
  void dispose() {
    Get.delete<TypingTextController>(tag: widget.text);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(controller.displayedText.value, style: widget.style));
  }
}
