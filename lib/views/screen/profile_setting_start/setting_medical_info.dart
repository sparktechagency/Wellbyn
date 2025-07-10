import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/custom_field.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_insurance_info.dart';
import 'package:wellbyn/views/screen/profile_setting_start/setting_personal_info.dart' show LabeledTextFields;
import 'package:wellbyn/views/screen/profile_setting_start/widget/circle.dart';
import '../../../controllers/profile_setting_controller.dart';
import 'package:wellbyn/models/medication.dart';
import 'package:wellbyn/models/allergies.dart';
import '../profile/base/madicalinfoheader.dart';

class SettingMedicalInfo extends StatefulWidget {
   SettingMedicalInfo({Key? key}) : super(key: key);

  @override
  _MedicalInformationScreenState createState() =>
      _MedicalInformationScreenState();
}

class _MedicalInformationScreenState extends State<SettingMedicalInfo> {
  ProfileSettingController _controller = Get.put(ProfileSettingController());




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
          padding: const EdgeInsets.all(20),
          child: Column(
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
                  _buildLine(isHalfColor: true),
                  StepCircle(
                    isActive: true,
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
              SizedBox(height: 8),
              //_________________________________________________
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
              SizedBox(height: 25),

              // Header text
              MedicalInfoHeader(
                title: "Medical Information",
                description:
                'Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.',
                iconPath: AppIcons.medicalfileIcon,
              ),

              const SizedBox(height: 24),

              // Allergies Section
              _buildAllergiesSection(),
              const SizedBox(height: 24),

              // Current Medications Section
              _buildMedicationsSection(),
              const SizedBox(height: 24),

              // Existing Conditions Section
              _buildExistingConditionsSection(),
              const SizedBox(height: 24),

              // Lifestyle Factors Section
              _buildLifestyleFactorsSection(),
              SizedBox(height: 50,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Appcolors.primary,

                            border: Border.all(
                              width: 1,
                              color: TextColors.neutral900,

                            )
                        ),
                        child: Center(child: Text("Previous",style: TextStyle(fontFamily: "Satoshi",fontSize: 16,color: TextColors.neutral900,fontWeight: FontWeight.w500),)),
                      ),
                    ),
                  ),
                  SizedBox(width: 115,),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // final selected = _controller.selectedLifestyleFactors ?? [];
                        // final selectedExtisting = _controller.selectedexistingConditions ?? [];
                        // final allergies = _controller.allergies ?? [];
                        // final medication = _controller.medications ?? [];
                        //
                        // print("Selected Lifestyle Factors: $selected");
                        // print("Selected Existing Condition Factors: $selectedExtisting");
                        //
                        // print("All Allergies:");
                        // for (var allergy in allergies) {
                        //   print("• ${allergy.name} - Severity: ${allergy.severity}");
                        // }
                        //
                        // print("All Medication:");
                        // for (var m in medication) {
                        //   print("• ${m.name} - dosage: ${m.dosage}");
                        // }

                        Get.to(() => SettingInsuranceInfo());


                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolors.action,
                        ),
                        child: Center(child: Text("Next",style: TextStyle(fontFamily: "Satoshi",fontSize: 16,color: Appcolors.primary,fontWeight: FontWeight.w500),)),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 35,),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllergiesSection() {
    return _buildSection(
      title: 'Allergies',
      onAdd: _showAddAllergyDialog,
      child: Obx(() => Container( // <-- THIS is important
          padding: EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: TextColors.neutral200),
          ),
        child: Column(
          children: [
            _buildTableHeader(['Name', 'Severity', 'Action']),
            ..._controller.allergies.asMap().entries.map((entry) {
              int index = entry.key;
              Allergy allergy = entry.value;
              return _buildTableRow([
                allergy.name,
                allergy.severity,
                _buildDeleteButton(() => _controller.deleteAllergy(index)),
              ]);
            }).toList(),
          ],
        ),
      )),
    );
  }

  Widget _buildMedicationsSection() {
    return _buildSection(
      title: 'Current Medications',
      onAdd: _showAddMedicationDialog,
      child: Obx(() => Container( // <-- wrap here
        padding: EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: TextColors.neutral200),
        ),
        child: Column(
          children: [
            _buildTableHeader(['Name', 'Frequency', 'Action']),
            ..._controller.medications.asMap().entries.map((entry) {
              int index = entry.key;
              Medication medication = entry.value;
              return _buildTableRow([
                medication.name,
                medication.frequency,
                _buildDeleteButton(() => _controller.deleteMedication(index))
              ]);
            }).toList(),
          ],
        ),
      )),
    );
  }

  Widget _buildExistingConditionsSection() {
    return _buildSection(
      title: 'Existing Conditions',
      onAdd: _addCondition, // your dialog for adding
      child: Obx(() => Column(
        children: _controller.existingConditions.entries.map((entry) {
          return _buildCheckboxItem(
            entry.key,
            entry.value,
                (value) {
              _controller.toggleCondition(entry.key, value!);
            },
          );
        }).toList(),
      )),
    );
  }


  Widget _buildLifestyleFactorsSection() {
    return _buildSection(
      title: 'Lifestyle Factors',
      onAdd: showAddLifestyleFactorDialog, // Hook up your dialog input here
      child: Obx(() => Column(
        children: _controller.lifestyleFactors.entries.map((entry) {
          return _buildCheckboxItem(
            entry.key,
            entry.value,
                (value) => _controller.toggleLifestyleFactor(entry.key),
          );
        }).toList(),
      )),
    );
  }


  Widget _buildSection({
    required String title,
    required VoidCallback onAdd,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                    fontFamily: "Satoshi",
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
      decoration: BoxDecoration(color: HexColor("#F0F5FE")),
      child: Row(
        children: headers.map((header) {
          bool isAction = header == 'Action';
          return Expanded(
            flex: isAction ? 1 : 2,
            child: Text(
              header,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: TextColors.neutral900,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTableRow(List<dynamic> cells) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Row(
        children: cells.asMap().entries.map((entry) {
          int index = entry.key;
          dynamic cell = entry.value;
          bool isAction = index == cells.length - 1;
          return Expanded(
            flex: isAction ? 1 : 2,
            child: cell is Widget
                ? cell
                : Text(
              cell.toString(),
              style: const TextStyle(fontSize: 16, color: Colors.black87),
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
      padding: const EdgeInsets.symmetric(vertical: 2), // Reduced from 0 to 2 for minimal spacing
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            value: value,
            side: BorderSide(width: 1),
            onChanged: onChanged,
            activeColor: Appcolors.action,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduces checkbox padding
            visualDensity: VisualDensity.compact, // Makes checkbox more compact
          ),
          const SizedBox(width: 8), // Reduced from 3 to 8 for better spacing between checkbox and text
          Expanded( // Added Expanded to prevent overflow and better text handling
            child: Text(
              title,
              style: TextStyle(fontSize: 16, color: TextColors.neutral900),
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
                        fontFamily: "Satoshi",
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
                    child: LabeledTextFields(
                      borderColor: TextColors.neutral900,
                      label: "Medication Name",
                      controller: nameController,
                      maxline: 1,
                      hintText:"Enter medication name ",
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: LabeledTextFields(
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
                    child: LabeledTextFields(
                      borderColor: TextColors.neutral900,
                      label:"Frequency",
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
                              border: Border.all(
                                color: TextColors.neutral500,
                              ),
                            ),
                            child: Center(
                              child:Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Satoshi",
                                    fontWeight: FontWeight.w500,
                                    color: TextColors.neutral500
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
                        )
              
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



  // void _showTextInputDialog({
  //   required String title,
  //   required Function(String) onAdd,
  // }) {
  //   String value = '';
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       backgroundColor: Appcolors.page,
  //       title: Text(title),
  //       content: TextField(
  //         decoration: const InputDecoration(
  //           hintText: 'Name',
  //           border: OutlineInputBorder(),
  //         ),
  //         onChanged: (v) => value = v,
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text('Cancel'),
  //         ),
  //         ElevatedButton(
  //           onPressed: () {
  //             if (value.isNotEmpty) {
  //               onAdd(value);
  //               Navigator.pop(context);
  //             }
  //           },
  //           child: const Text('Add'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
          child:  Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Satoshi",
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
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w500,
                      color: TextColors.neutral900,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextField(
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
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: TextColors.neutral500,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child:Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Satoshi",
                                  fontWeight: FontWeight.w500,
                                  color: TextColors.neutral500
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


  // Helper widget for step circle

  // Helper widget for line between steps
  Widget _buildLine({required bool isHalfColor}) {
    return Expanded(child: Container(height: 1, color:isHalfColor ? TextColors.action : TextColors.neutral200));
  }

  void _showAddAllergyDialog() {
    final TextEditingController nameController = TextEditingController();
    String selectedSeverity = 'Mild';
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Appcolors.page,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: StatefulBuilder(
            builder: (context, setDialogState) {
              return SingleChildScrollView(
                child:  Form(
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
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w500,
                            color: TextColors.neutral900,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),
                      Divider(height: 1, color: TextColors.neutral200),
                      const SizedBox(height: 8),
                      // Allergy Name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: LabeledTextFields(
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
                            fontFamily: "Satoshi",
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
                                    color: isSelected
                                        ? Appcolors.primary50
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: isSelected
                                          ? Appcolors.action
                                          : TextColors.neutral500,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      level,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: isSelected
                                            ? FontWeight.w500
                                            : FontWeight.w400,
                                        color: isSelected
                                            ? TextColors.action
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

                      Divider(height: 1, color: TextColors.neutral200),
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
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: TextColors.neutral500,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Satoshi",
                                        fontWeight: FontWeight.w500,
                                        color: TextColors.neutral500
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


