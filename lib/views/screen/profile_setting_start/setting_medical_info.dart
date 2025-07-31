import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/controllers/stepcontroller.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_insurance_info.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_personal_info.dart';
import 'package:wellbyn/views/screen/profile_setting_start/widget/circle.dart';
import '../../../controllers/profile_setting/medical_info.dart';
import '../../../controllers/profile_setting_controller.dart';
import 'package:wellbyn/models/medication.dart';
import 'package:wellbyn/models/allergies.dart';
import '../../../controllers/scrollController.dart';
import '../../base/LabelTextField/labelTextField.dart';
import '../profile/base/madicalinfoheader.dart';


class SettingMedicalInfo extends StatefulWidget {
  SettingMedicalInfo({Key? key}) : super(key: key);

  @override
  _MedicalInformationScreenState createState() =>
      _MedicalInformationScreenState();
}

class _MedicalInformationScreenState extends State<SettingMedicalInfo> {
  OnboradingProfileMedication _controller = Get.put(OnboradingProfileMedication());
  late ScrollControllerGetX scroll = Get.put(ScrollControllerGetX());
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //=================> Animated here sizebox here <=================
            Obx(()=> AnimatedSize(
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
                  child: scroll.isProgressVisible1.value
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
              ),),

            //_______________________============> Hello bro how are you  <=====================
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: scroll.scrollController1,
                child: Column(
                  children: [
                    SizedBox(height: 25),

                    // Header text
                    MedicalInfoHeader(
                      title: "Medical Information",
                      description:
                          'Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.',
                      iconPath: AppIcons.medicalfileIcon,
                    ),

                    const SizedBox(height: 32),

                    // Allergies Section
                    _buildAllergiesSection(),
                    const SizedBox(height: 16),

                    // Current Medications Section
                    _buildMedicationsSection(),
                    const SizedBox(height: 16),

                    // Existing Conditions Section
                    _buildExistingConditionsSection(),
                    const SizedBox(height: 16),

                    // Lifestyle Factors Section
                    _buildLifestyleFactorsSection(),
                    SizedBox(height: 48.h),

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
                            height: 48,
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
                            Get.to(() => SettingInsuranceInfo());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Appcolors.action,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Save & Next",
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

                    SizedBox(height: 35),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //==============build progress indicator <===============
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
              child: AnimatedLine(
                key: ValueKey('animated_line_step1_to_step2'), // Add unique key
                isHalfColor: true,
                onAnimationComplete: () {
                  controller.onLineAnimationComplete();
                },
              ),
            ),
            Obx(
              () => AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
                child: StepCircle(
                  isActive: controller.isStep2Active.value,
                  step: '2',
                  activeColor: Appcolors.action,
                  inactiveColor: Colors.white,
                  activeTextColor: Colors.white,
                  inactiveTextColor: TextColors.neutral900,
                ),
              ),
            ),
            Expanded(child: Container(height: 1, color: TextColors.neutral200)),
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
                child: Obx(
                  () => controller.isStep2Active.value
                      ? Text(
                          "Step", // Fixed: Added step number
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: TextColors.action,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        )
                      : SizedBox.shrink(), // Fixed: Use SizedBox.shrink() instead of null
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
  //==============build allergiseSection <===============
  // Widget _buildAllergiesSection() {
  //   return _buildSection(
  //     title: 'Allergies',
  //     onAdd: _showAddAllergyDialog,
  //     child: Obx(
  //       () => Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(width: 1, color: Appcolors.primary),
  //           borderRadius: BorderRadius.circular(12),
  //           color: Colors.white,
  //         ),
  //         child: Column(
  //           children: [
  //             _buildTableHeader(['Name', 'Severity', 'Action']),
  //             ListView.builder(
  //               shrinkWrap: true,
  //               physics: NeverScrollableScrollPhysics(),
  //               itemCount: _controller.allergies.length,
  //               itemBuilder: (context, index) {
  //                 final allergy = _controller.allergies[index];
  //                 final isLast = index == _controller.allergies.length - 1;
  //                 return _buildTableRow(
  //                   [
  //                     allergy.name,
  //                     allergy.severity,
  //                     _buildDeleteButton(
  //                       () => _controller.deleteAllergy(index),
  //                     ),
  //                   ],
  //                   index,
  //                   isLast: isLast,
  //                 );
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildAllergiesSection() {
    return _buildSection(
      title: 'Allergies',
      onAdd: _showAddAllergyDialog,
      child: Obx(
            () => Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Appcolors.primary),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: _controller.allergies.isEmpty
              ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'No allergies added yet...',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                color: Colors.grey,
              ),
            ),
          )
              : Column(
            children: [
              _buildTableHeader(['Name', 'Severity', 'Action']),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controller.allergies.length,
                itemBuilder: (context, index) {
                  final allergy = _controller.allergies[index];
                  final isLast = index == _controller.allergies.length - 1;
                  return _buildTableRow(
                    [
                      allergy.name,
                      allergy.severity,
                      _buildDeleteButton(
                            () => _controller.deleteAllergy(index),
                      ),
                    ],
                    index,
                    isLast: isLast,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  //==============build MedicationSection <===============
  Widget _buildMedicationsSection() {
    return _buildSection(
      title: 'Current Medications',
      onAdd: _showAddMedicationDialog,
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Appcolors.primary),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child:_controller.medications.isEmpty ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'No medications added yet...',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                color: Colors.grey,
              ),
            ),
          ) : Column(
            children: [
              _buildTableHeader(['Name', 'Frequency', 'Action']),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controller.medications.length,
                itemBuilder: (context, index) {
                  final medication = _controller.medications[index];
                  final isLast = index == _controller.medications.length - 1;

                  return _buildTableRow(
                    [
                      medication.name,
                      medication.frequency,
                      _buildDeleteButton(
                        () => _controller.deleteMedication(index),
                      ),
                    ],
                    index,
                    isLast: isLast,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //==============build _buildExistingConditionsSection <===============

  // Widget _buildExistingConditionsSection() {
  //   return _buildSection(
  //     title: 'Existing Conditions',
  //     onAdd: _addCondition,
  //     child: Obx(
  //       () => ListView.builder(
  //         shrinkWrap: true,
  //         physics: NeverScrollableScrollPhysics(),
  //         itemCount: _controller.existingConditions.length,
  //         itemBuilder: (context, index) {
  //           final key = _controller.existingConditions.keys.elementAt(index);
  //           final value = _controller.existingConditions[key]!;
  //           return _buildCheckboxItem(
  //             key,
  //             value,
  //             (newValue) => _controller.toggleCondition(key, newValue!),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
  Widget _buildExistingConditionsSection() {
    return _buildSection(
      title: 'Existing Conditions',
      onAdd: _addCondition,
      child: Obx(
            () {
          if (_controller.existingConditions.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'No existing conditions added yet...',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Colors.grey,
                ),
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _controller.existingConditions.length,
            itemBuilder: (context, index) {
              final key = _controller.existingConditions.keys.elementAt(index);
              final value = _controller.existingConditions[key]!;
              return _buildCheckboxItem(
                key,
                value,
                    (newValue) => _controller.toggleCondition(key, newValue!),
              );
            },
          );
        },
      ),
    );
  }


  //==============build _buildLifestyleFactorsSection <===============

  Widget _buildLifestyleFactorsSection() {
    return _buildSection(
      title: 'Lifestyle Factors',
      onAdd: showAddLifestyleFactorDialog, // Hook up your dialog input here
      child: Obx(() {

        if (_controller.lifestyleFactors.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'No existing conditions added yet...',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                color: Colors.grey,
              ),
            ),
          );
        }
        final entries = _controller.lifestyleFactors.entries.toList();
        return ListView.builder(
          shrinkWrap: true,
          // so it doesn’t take infinite height inside another scrollable
          physics: NeverScrollableScrollPhysics(),
          // if inside another scroll view
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final entry = entries[index];
            return _buildCheckboxItem(
              entry.key,
              entry.value,
              (value) => _controller.toggleLifestyleFactor(entry.key),
            );
          },
        );
      }),
    );
  }

  Widget _buildSection({
    required String title,
    required VoidCallback onAdd,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolors.primary,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: ShadowColor.shadowColors1.withOpacity(0.10),
            // Shadow color
            blurRadius: 7,
            // Softness
            spreadRadius: 0,
            offset: Offset(0, 2),
            // Position of shadow
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: AppConstants.FONT_FAMILY,
                    fontWeight: FontWeight.w500,
                    color: TextColors.neutral900,
                  ),
                ),
                GestureDetector(
                  onTap: onAdd,
                  child: const Row(
                    children: [
                      Icon(Icons.add, color: Appcolors.action, size: 20),
                      SizedBox(width: 4),
                      Text(
                        'Add',
                        style: TextStyle(
                          color: Appcolors.action,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(List<String> headers) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
        color: HexColor("#F0F5FE"),
      ),
      child: Row(
        children: headers.map((header) {
          bool isAction = header == 'Action';
          return Expanded(
            flex: isAction ? 1 : 2,
            child: Text(
              header,
              style: TextStyle(
                fontSize: 14,

                fontWeight: FontWeight.w500,
                color: TextColors.neutral500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTableRow(
    List<dynamic> cells,
    int rowIndex, {
    bool isLast = false,
  }) {
    final int lastCellIndex = cells.length - 1;
    final Color bgColor = rowIndex.isEven
        ? Appcolors.primary
        : Appcolors.actionHoverLight;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          bottomLeft: isLast ? Radius.circular(12) : Radius.zero,
          bottomRight: isLast ? Radius.circular(12) : Radius.zero,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: cells.asMap().entries.map((entry) {
          int cellIndex = entry.key;
          dynamic cell = entry.value;
          bool isAction = cellIndex == lastCellIndex;
          return Expanded(
            flex: isAction ? 1 : 2,
            child: cell is Widget
                ? cell
                : Text(
                    cell.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: TextColors.neutral900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDeleteButton(VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(AppIcons.delete02Icon),
    );
  }

  Widget _buildCheckboxItem(
    String title,
    bool value,
    Function(bool?) onChanged,
  ) {
    return Container(
      decoration: BoxDecoration(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      // Reduced from 0 to 2 for minimal spacing
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Appcolors.primary50,
              boxShadow: [
                BoxShadow(
                  color: ShadowColor.shadowColors1.withOpacity(0.10),
                  blurRadius: 2,
                  spreadRadius: 0,
                  offset: Offset(0, 3),
                  blurStyle: BlurStyle.normal,
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Transform.scale(
              scale: 1.1, // 1.0 = default size, increase for bigger checkbox
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: Appcolors.action,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: BorderSide(color: Appcolors.primary, width: 0),
              ),
            ),
          ),

          const SizedBox(width: 8),
          // Reduced from 3 to 8 for better spacing between checkbox and text
          Expanded(
            // Added Expanded to prevent overflow and better text handling
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
                color: TextColors.neutral900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Action methods
  void _addCondition() {
    input(
      title: 'Add Existing Condition',
      fieldLabel: 'Existing Condition Name',
      hintText: 'Enter existing condition name',
      onAdd: (value) {
        _controller.addCondition(value); // ✅ Use controller
      },
    );
  }

  void showAddLifestyleFactorDialog() {
    input(
      title: 'Add Lifestyle Factor',
      fieldLabel: 'Lifestyle Factor Name',
      hintText: 'Enter lifestyle factor',
      onAdd: (value) {
        if (value.trim().isNotEmpty) {
          _controller.addLifestyleFactor(value.trim());
        }
      },
    );
  }

  void _showAddMedicationDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController dosageController = TextEditingController();
    final TextEditingController frequencyController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Add Medication",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: AppConstants.FONT_FAMILY,
                        fontWeight: FontWeight.w500,
                        color: TextColors.neutral900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: TextColors.neutral200),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: LabeledTextFielded(
                      borderColor: TextColors.neutral900,
                      label: "Medication Name",
                      controller: nameController,
                      maxline: 1,
                      hintText: "Enter medication name ",
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: LabeledTextFielded(
                      borderColor: TextColors.neutral900,
                      label: "Dosage",
                      controller: dosageController,
                      maxline: 1,
                      hintText: "e.g. 10gm",
                    ),
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: LabeledTextFielded(
                      borderColor: TextColors.neutral900,
                      label: "Frequency",
                      controller: frequencyController,
                      maxline: 1,
                      hintText: "e.g. Twice daily",
                    ),
                  ),
                  const SizedBox(height: 24),

                  Divider(height: 1, color: TextColors.neutral200),
                  const SizedBox(height: 16),

                  // Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            height: 40.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: ShadowColor.shadowColors1.withOpacity(0.10),
                                      offset: Offset(0, 3),
                                      blurRadius: 4
                                  )
                                ]
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppConstants.FONT_FAMILY,
                                  fontWeight: FontWeight.w500,
                                  color: TextColors.neutral500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate() &&
                                nameController.text.isNotEmpty &&
                                dosageController.text.isNotEmpty &&
                                frequencyController.text.isNotEmpty) {
                              _controller.medications.add(
                                Medication(
                                  name: nameController.text.trim(),
                                  dosage: dosageController.text.trim(),
                                  frequency: frequencyController.text.trim(),
                                ),
                              );
                              Get.back();

                              Get.snackbar(
                                'Success',
                                '"${nameController.text.trim()}" added successfully',
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 2),
                              );
                            }
                          },

                          child: Container(
                            height: 40.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              color: Appcolors.action,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Appcolors.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void input({
    required String title,
    required String fieldLabel,
    required String hintText,
    required void Function(String value) onAdd,
  }) {
    final TextEditingController nameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: AppConstants.FONT_FAMILY,
                      fontWeight: FontWeight.w500,
                      color: TextColors.neutral900,
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                Divider(height: 1, color: TextColors.neutral200),
                const SizedBox(height: 20),
                // Allergy Name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    fieldLabel,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppConstants.FONT_FAMILY,
                      fontWeight: FontWeight.w500,
                      color: TextColors.neutral900,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextFielded(
                    maxLines: 1,
                    hintText: hintText,
                    controller: nameController,
                    borderColor: TextColors.neutral500,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 40.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: ShadowColor.shadowColors1.withOpacity(0.10),
                                    offset: Offset(0, 3),
                                    blurRadius: 4
                                )
                              ]
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.FONT_FAMILY,
                                fontWeight: FontWeight.w500,
                                color: TextColors.neutral500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            onAdd(nameController.text.trim());
                            Get.back();
                            Get.snackbar(
                              'Success',
                              '"${nameController.text.trim()}" added successfully',
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2),
                            );
                          }
                        },
                        child: Container(
                          height: 40.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: Appcolors.action,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: ShadowColor.shadowColors1.withOpacity(0.10),
                                offset: Offset(0, 3),
                                blurRadius: 4
                              )
                            ]
                          ),
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Appcolors.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddAllergyDialog() {
    final TextEditingController nameController = TextEditingController();
    String selectedSeverity = 'Mild';
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Appcolors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: StatefulBuilder(
            builder: (context, setDialogState) {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Add Allergy",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: AppConstants.FONT_FAMILY,
                            fontWeight: FontWeight.w500,
                            color: TextColors.neutral900,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),
                      Divider(height: 1, color: BorderColors.tertiary),
                      const SizedBox(height: 8),
                      // Allergy Name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: LabeledTextFielded(
                          borderColor: TextColors.neutral900,
                          label: "Allergy Name",
                          controller: nameController,
                          maxline: 1,
                          hintText: "Enter allergy name",
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Severity
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Severity",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppConstants.FONT_FAMILY,
                            fontWeight: FontWeight.w500,
                            color: TextColors.neutral900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: ['Mild', 'Moderate', 'Severe'].map((level) {
                            final isSelected = level == selectedSeverity;
                            return Expanded(
                              child: GestureDetector(
                                onTap: () => setDialogState(
                                  () => selectedSeverity = level,
                                ),
                                child: Container(
                                  height: 40,
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: ShadowColor.shadowColors1
                                            .withOpacity(0.10),
                                        // Shadow color
                                        blurRadius: 4,
                                        // Softness
                                        spreadRadius: 0,
                                        offset: Offset(0, 3),
                                        // Position of shadow
                                        blurStyle: BlurStyle.normal,
                                      ),
                                    ],

                                    color: isSelected
                                        ? Appcolors.primary50
                                        : Appcolors.primary,

                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      level,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: isSelected
                                            ? FontWeight.w500
                                            : FontWeight.w500,
                                        color: isSelected
                                            ? TextColors.primary700
                                            : TextColors.neutral500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 24),

                      Divider(height: 1, color: BorderColors.tertiary),
                      const SizedBox(height: 16),

                      // Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 40.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Appcolors.primary,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ShadowColor.shadowColors1
                                          .withOpacity(0.10),
                                      // Shadow color
                                      blurRadius: 4,
                                      // Softness
                                      spreadRadius: 0,
                                      offset: Offset(0, 3),
                                      // Position of shadow
                                      blurStyle: BlurStyle.normal,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppConstants.FONT_FAMILY,
                                      fontWeight: FontWeight.w500,
                                      color: TextColors.neutral500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _controller.allergies.add(
                                    Allergy(
                                      name: nameController.text.trim(),
                                      severity: selectedSeverity,
                                    ),
                                  );
                                  Get.back();
                                  Get.snackbar(
                                    'Success',
                                    '"${nameController.text.trim()}" added successfully',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 2),
                                  );
                                }
                              },
                              child: Container(
                                height: 40.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Appcolors.action,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                      color: Appcolors.primary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
