import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../models/allergies.dart';
import '../../models/medication.dart';

class OnboradingProfileMedication extends GetxController{
  final RxList<Allergy> allergies = <Allergy>[
    Allergy(name: 'Penicillin', severity: 'Moderate'),
    Allergy(name: 'Shellfish', severity: 'Severe'),
  ].obs;

  final RxList<Medication> medications = <Medication>[
    Medication(name: 'Lisinopril', dosage: '10mg', frequency: 'Once daily'),
    Medication(name: 'Metformin', dosage: '500mg', frequency: 'Twice daily'),
  ].obs;

  final RxMap<String, bool> existingConditions = <String, bool>{

  }.obs;

  List<String> get selectedexistingConditions => existingConditions.entries
      .where((entry) => entry.value == true)
      .map((entry) => entry.key)
      .toList();

  final RxMap<String, bool> lifestyleFactors = <String, bool>{

  }.obs;

  List<String> get selectedLifestyleFactors => lifestyleFactors.entries
      .where((entry) => entry.value == true)
      .map((entry) => entry.key)
      .toList();

  // Form controllers
  final TextEditingController allergyNameController = TextEditingController();
  final TextEditingController medicationNameController =
  TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController lifestyleController = TextEditingController();

  // Form keys
  final GlobalKey<FormState> allergyFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> medicationFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> conditionFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> lifestyleFormKey = GlobalKey<FormState>();

  // Selected severity for allergy dialog
  final RxString selectedSeverity = 'Mild'.obs;

  void toggleCondition(String key, bool value) {
    existingConditions[key] = value;
  }

  void addCondition(String value) {
    if (!existingConditions.containsKey(value)) {
      existingConditions[value] = false;
    }
  }

  void addMedication(Medication med) {
    medications.add(med);
  }

  void addAllergy(Allergy allergy) {
    allergies.add(allergy);
  }

  void deleteAllergy(int index) {
    if (index >= 0 && index < allergies.length) {
      allergies.removeAt(index);
    }
  }

  void deleteMedication(int index) {
    if (index >= 0 && index < medications.length) {
      medications.removeAt(index);
    }
  }

  //RxMap<String, bool> lifestyleFactors = <String, bool>{}.obs;

  void toggleLifestyleFactor(String key) {
    lifestyleFactors[key] = !(lifestyleFactors[key] ?? false);
  }

  void addLifestyleFactor(String value) {
    lifestyleFactors[value] = false;
  }

  // Methods for Allergies
  // void addAllergy() {
  //   if (allergyFormKey.currentState!.validate() &&
  //       allergyNameController.text.isNotEmpty) {
  //     allergies.add(
  //       Allergy(
  //         name: allergyNameController.text.trim(),
  //         severity: selectedSeverity.value,
  //       ),
  //     );
  //
  //     // Clear form
  //     allergyNameController.clear();
  //     selectedSeverity.value = 'Mild';
  //
  //     // Close dialog
  //     Get.back();
  //
  //     // Show success message
  //     Get.snackbar(
  //       'Success',
  //       'Allergy "${allergyNameController.text.trim()}" added successfully',
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 2),
  //     );
  //   }
  // }
  //
  // void deleteAllergy(int index) {
  //   if (index >= 0 && index < allergies.length) {
  //     allergies.removeAt(index);
  //   }
  // }
  //
  // void setSeverity(String severity) {
  //   selectedSeverity.value = severity;
  // }
  //
  // // Methods for Medications
  // void addMedication() {
  //   if (medicationFormKey.currentState!.validate() &&
  //       medicationNameController.text.isNotEmpty &&
  //       dosageController.text.isNotEmpty &&
  //       frequencyController.text.isNotEmpty) {
  //     medications.add(
  //       Medication(
  //         name: medicationNameController.text.trim(),
  //         dosage: dosageController.text.trim(),
  //         frequency: frequencyController.text.trim(),
  //       ),
  //     );
  //
  //     // Clear form
  //     medicationNameController.clear();
  //     dosageController.clear();
  //     frequencyController.clear();
  //
  //     // Close dialog
  //     Get.back();
  //
  //     // Show success message
  //     Get.snackbar(
  //       'Success',
  //       'Medication "${medicationNameController.text.trim()}" added successfully',
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 2),
  //     );
  //   }
  // }
  //
  // void deleteMedication(int index) {
  //   if (index >= 0 && index < medications.length) {
  //     medications.removeAt(index);
  //   }
  // }
  //
  // // Methods for Existing Conditions
  // void updateExistingCondition(String condition, bool value) {
  //   existingConditions[condition] = value;
  // }
  //
  // void addNewCondition() {
  //   if (conditionFormKey.currentState!.validate() &&
  //       conditionController.text.isNotEmpty) {
  //     String newCondition = conditionController.text.trim();
  //     existingConditions[newCondition] = false;
  //
  //     // Clear form
  //     conditionController.clear();
  //
  //     // Close dialog
  //     Get.back();
  //
  //     // Show success message
  //     Get.snackbar(
  //       'Success',
  //       '"$newCondition" added successfully',
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 2),
  //     );
  //   }
  // }
  //
  // // Methods for Lifestyle Factors
  // void updateLifestyleFactor(String factor, bool value) {
  //   lifestyleFactors[factor] = value;
  // }
  //
  // void addNewLifestyleFactor() {
  //   if (lifestyleFormKey.currentState!.validate() &&
  //       lifestyleController.text.isNotEmpty) {
  //     String newFactor = lifestyleController.text.trim();
  //     lifestyleFactors[newFactor] = false;
  //
  //     // Clear form
  //     lifestyleController.clear();
  //
  //     // Close dialog
  //     Get.back();
  //
  //     // Show success message
  //     Get.snackbar(
  //       'Success',
  //       '"$newFactor" added successfully',
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 2),
  //     );
  //   }
  // }
  //
  // // Navigation
  // void goBack() {
  //   Get.back();
  // }
  //
  // // Form validation
  // String? validateRequired(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'This field is required';
  //   }
  //   return null;
  // }
  //
  // @override
  // void onClose() {
  //   // Dispose controllers
  //   allergyNameController.dispose();
  //   medicationNameController.dispose();
  //   dosageController.dispose();
  //   frequencyController.dispose();
  //   conditionController.dispose();
  //   lifestyleController.dispose();
  //   super.onClose();
  // }

  //=======================================================================================

  final signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: const Color(0xFF000000),
    exportBackgroundColor: const Color(0xFFFFFFFF),
  );

  var isSignatureNotEmpty = false.obs;

  void clearSignature() {
    signatureController.clear();
    isSignatureNotEmpty.value = false;
  }

  var symptoms = <String, bool>{
    'Bleeding gums': false,
    'Loose tooth': false,
    'Tooth sensitivity': false,
    'Jaw pain or clicking': false,
  }.obs;

  var checkin = <String, bool>{'Yes': false, 'No': false}.obs;

  void toggleSymptom(String key) {
    symptoms[key] = !(symptoms[key] ?? false);
  }

  void togglecheck(String key) {
    checkin[key] = !(checkin[key] ?? false);
    checkin.refresh();
  }
}