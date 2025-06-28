import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/app_text.dart';

import '../../../../utils/nab_ids.dart';

class MedicalInformationScreen extends StatefulWidget {
  const MedicalInformationScreen({Key? key}) : super(key: key);

  @override
  _MedicalInformationScreenState createState() =>
      _MedicalInformationScreenState();
}

class _MedicalInformationScreenState extends State<MedicalInformationScreen> {
  // Data models
  List<Allergy> allergies = [
    const Allergy(name: 'Penicillin', dosage: 'Moderate'),
    const Allergy(name: 'Penicillin', dosage: 'Moderate'),
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
              Row(
                children: [
                  SvgPicture.asset(AppIcons.medicalfileIcon),
                  SizedBox(width: 5,),
                  AppText(
                    "Medical Information",
                    fontSize: 18,
                    color: TextColors.neutral900,
                  ),
                ],
              ),
              SizedBox(height: 5,),

              Text(
                'Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.',
                style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.4),
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
        onTap: (){
          Get.snackbar("title", "not fountion add here ", );
        },
        child: Container(
          height: 50,
          width: 130,
          padding: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Appcolors.action,
            borderRadius: BorderRadius.circular(8),
          ),child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.editIcon,color: Appcolors.primary,),
            SizedBox(width: 8,),
            AppText("Edit details",color: Appcolors.primary,fontSize: 14,),
          ],
        ),
        ),
      ),
    );
  }

  Widget _buildAllergiesSection() {
    return _buildSection(
      title: 'Allergies',
      onAdd: _showAddMedicationDialog,
      child: Container(
        padding: EdgeInsets.only(left: 1,right: 1,top: 1,bottom: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: TextColors.neutral200,
          )
        ),
        child: Column(
          children: [

            _buildTableHeader(['Name', 'Dosage', 'Action']),
            ...allergies.asMap().entries.map((entry) {
              int index = entry.key;
              Allergy allergy = entry.value;
              return _buildTableRow([
                allergy.name,
                allergy.dosage,
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
          padding: EdgeInsets.only(left: 1,right: 1,top: 1,bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 1,
                color: TextColors.neutral200,
              ),
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
    return  _buildSection(
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
      decoration: BoxDecoration(
        color:  HexColor("#F0F5FE"),
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
                fontWeight: FontWeight.w400,
                color:TextColors.neutral900,
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
        border: Border(
            bottom: BorderSide(
                color: Colors.grey[200]!,
                width: 1,)),
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
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(5),
            ),
            value: value,
            side: BorderSide(width: 1),
            onChanged: onChanged,
            activeColor: Colors.blue,
          ),
          const SizedBox(width: 3),
          Text(
            title,
            style: TextStyle(fontSize: 16, color: TextColors.neutral900),
          ),
        ],
      ),
    );
  }

  // Action methods
  // void _addAllergy() {
  //   _showAddDialog(
  //     title: 'Add Allergy',
  //     fields: ['Allergy Name', 'Dosage'],
  //     onAdd: (values) {
  //       setState(() {
  //         allergies.add(Allergy(name: values[0], dosage: values[1]));
  //       });
  //     },
  //   );
  // }

  // void _addMedication() {
  //   _showAddMedicationDialog(
  //     title: 'Add Medication',
  //     fields: ['Medication Name', 'Frequency'],
  //     onAdd: (values) {
  //       setState(() {
  //         medications.add(Medication(name: values[0], frequency: values[1]));
  //       });
  //     },
  //   );
  // }

  void _addCondition() {
    _showTextInputDialog(
      title: 'Add Condition',
      onAdd: (value) {
        setState(() {
          existingConditions[value] = false;
        });
      },
    );
  }

  void _addLifestyleFactor() {
    _showTextInputDialog(
      title: 'Add Lifestyle Factor',
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
    final TextEditingController dosageController = TextEditingController();
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
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Save the data
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
        title: Text(title),
        content: TextField(
          decoration: const InputDecoration(
            labelText: 'Name',
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

  void _editDetails() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit details functionality would go here')),
    );
  }
}

// Data models
class Allergy {
  final String name;
  final String dosage;

  const Allergy({required this.name, required this.dosage});
}

class Medication {
  final String name;
  final String frequency;

  const Medication({required this.name, required this.frequency});
}
