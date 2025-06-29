import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/custom_field.dart';

import '../../../../utils/nab_ids.dart';
import 'madicalinfoheader.dart';

class MedicalInformationScreen extends StatefulWidget {
  const MedicalInformationScreen({Key? key}) : super(key: key);

  @override
  _MedicalInformationScreenState createState() =>
      _MedicalInformationScreenState();
}

class _MedicalInformationScreenState extends State<MedicalInformationScreen> {
  // Data models
  List<Allergy> allergies = [
    const Allergy(name: 'Penicillin', severity: 'Moderate'),
    const Allergy(name: 'Shellfish', severity: 'Severe'),
  ];

  List<Medication> medications = [
    const Medication(name: 'Lisinopril', frequency: 'Once daily'),
    const Medication(name: 'Metformin', frequency: 'Twice daily'),
  ];

  Map<String, bool> existingConditions = {
    'Diabetes': false,
    'Hypertension': false,
    'Anxiety': false,
    'Depression': false,
    'Asthma': false,
    'None': false,
  };

  Map<String, bool> lifestyleFactors = {
    'Smoking': false,
    'Former Smoker': false,
    'Alcohol': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Edit Medical Infor",
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.snackbar("title", "not fountion add here ");
        },
        child: Container(
          height: 50,
          width: 130,
          padding: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Appcolors.action,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.editIcon, color: Appcolors.primary),
              SizedBox(width: 8),
              AppText("Edit details", color: Appcolors.primary, fontSize: 14),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllergiesSection() {
    return _buildSection(
      title: 'Allergies',
      onAdd: _showAddAllergyDialog, // Fixed: Now correctly calls allergy dialog
      child: Container(
        padding: EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: TextColors.neutral200),
        ),
        child: Column(
          children: [
            _buildTableHeader(['Name', 'Severity', 'Action']),
            // Fixed: Changed from 'Dosage' to 'Severity'
            ...allergies.asMap().entries.map((entry) {
              int index = entry.key;
              Allergy allergy = entry.value;
              return _buildTableRow([
                allergy.name,
                allergy.severity, // Fixed: Changed from dosage to severity
                _buildDeleteButton(() => _deleteAllergy(index)),
              ]);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationsSection() {
    return _buildSection(
      title: 'Current Medications',
      onAdd: _showAddMedicationDialog,
      child: Container(
        padding: EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: TextColors.neutral200),
        ),
        child: Column(
          children: [
            _buildTableHeader(['Name', 'Frequency', 'Action']),
            ...medications.asMap().entries.map((entry) {
              int index = entry.key;
              Medication medication = entry.value;
              return _buildTableRow([
                medication.name,
                medication.frequency,
                _buildDeleteButton(() => _deleteMedication(index)),
              ]);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildExistingConditionsSection() {
    return _buildSection(
      title: 'Existing Conditions',
      onAdd: _addCondition,
      child: Column(
        children: existingConditions.entries.map((entry) {
          return _buildCheckboxItem(entry.key, entry.value, (value) {
            setState(() {
              existingConditions[entry.key] = value!;
            });
          });
        }).toList(),
      ),
    );
  }

  Widget _buildLifestyleFactorsSection() {
    return _buildSection(
      title: 'Lifestyle Factors',
      onAdd: _addLifestyleFactor,
      child: Column(
        children: lifestyleFactors.entries.map((entry) {
          return _buildCheckboxItem(entry.key, entry.value, (value) {
            setState(() {
              lifestyleFactors[entry.key] = value!;
            });
          });
        }).toList(),
      ),
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
                      Icon(Icons.add, color: Colors.blue, size: 20),
                      SizedBox(width: 4),
                      Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.blue,
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
            activeColor: Colors.blue,
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
      title: ' Add Existing Conditions',
      fieldLabel: 'Existing Conditions name',
      hintText: 'Enter existing conditions name',
      onAdd: (value) {
        setState(() {
          lifestyleFactors[value] = false;
        });
      },
    );
  }

  void _addLifestyleFactor() {
    input(
      title: 'Add Lifestyle Factor',
      fieldLabel: 'Lifestyle Factor Name',
      hintText: 'Enter lifestyle factor name',
      onAdd: (value) {
        setState(() {
          lifestyleFactors[value] = false;
        });
      },
    );
  }


  void _deleteAllergy(int index) {
    setState(() {
      allergies.removeAt(index);
    });
  }

  void _deleteMedication(int index) {
    setState(() {
      medications.removeAt(index);
    });
  }

  void _showAddMedicationDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController frequencyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Appcolors.page,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text('Add Medication'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Enter medication name',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: frequencyController,
                decoration: const InputDecoration(
                  hintText: 'e.g. Twice daily',
                  fillColor: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    frequencyController.text.isNotEmpty) {
                  setState(() {
                    medications.add(
                      Medication(
                        name: nameController.text,
                        frequency: frequencyController.text,
                      ),
                    );
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showTextInputDialog({
    required String title,
    required Function(String) onAdd,
  }) {
    String value = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Appcolors.page,
        title: Text(title),
        content: TextField(
          decoration: const InputDecoration(
            hintText: 'Name',
            border: OutlineInputBorder(),
          ),
          onChanged: (v) => value = v,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (value.isNotEmpty) {
                onAdd(value);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
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
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: TextColors.neutral500,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                 if (_formKey.currentState!.validate()) {
                  onAdd(nameController.text.trim());
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                          content: Text(
                          '"${nameController.text.trim()}" added successfully',
                            ),
                         backgroundColor: Colors.green,
                         duration: const Duration(seconds: 2),
                          ),
                        );
                       }
                          },
                          child: Container(
                            height: 40.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              color: Appcolors.action,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Appcolors.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () => Navigator.pop(context),
                  //       child: Text("Cancel", style: TextStyle(color: Colors.grey[600])),
                  //     ),
                  //     const SizedBox(width: 12),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         if (_formKey.currentState!.validate()) {
                  //           onAdd(nameController.text.trim());
                  //           Navigator.pop(context);
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //             SnackBar(
                  //               content: Text(
                  //                 '"${nameController.text.trim()}" added successfully',
                  //               ),
                  //               backgroundColor: Colors.green,
                  //               duration: const Duration(seconds: 2),
                  //             ),
                  //           );
                  //         }
                  //       },
                  //       child: const Text("Add"),
                  //     ),
                  //   ],
                  // ),
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
          backgroundColor: Colors.white,
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Allergy Name",
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
                            hintText: "Enter name",
                            controller: nameController,
                            borderColor: TextColors.neutral500,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Severity
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Severity",
                            style: TextStyle(
                              fontSize: 14,
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
                                    height: 36,
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Appcolors.secondary
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.grey.shade300,
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
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color: TextColors.neutral500,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      allergies.add(
                                        Allergy(
                                          name: nameController.text.trim(),
                                          severity: selectedSeverity,
                                        ),
                                      );
                                    });
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Allergy "${nameController.text.trim()}" added successfully',
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    color: Appcolors.action,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                        color: Appcolors.primary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
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

  void _editDetails() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit details functionality would go here')),
    );
  }
}

// Data models
class Allergy {
  final String name;
  final String severity; // Changed from 'dosage' to 'severity'

  const Allergy({required this.name, required this.severity});
}

class Medication {
  final String name;
  final String frequency;

  const Medication({required this.name, required this.frequency});
}
