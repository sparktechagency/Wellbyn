import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';

import 'package:wellbyn/models/medication.dart';
import 'package:wellbyn/models/allergies.dart';
import 'package:wellbyn/utils/app_colors.dart';

class ProfileSettingController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  RxBool showText = false.obs;
  RxBool isStep2Active = false.obs;

  toggleText() {
    showText.value = !showText.value;
  }

  void activateStep2() {
    isStep2Active.value = true;
  }

  //----------------------------Here can to do the profile setting patient information all details collect started add method and other info ---------------------------//
  //====================================================================================================================================================================//
  var selectedGender = 'Male'.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
    //print(selectedGender);
  }

  final RxString selectedMarital = ''.obs;
  final RxString selectedBloodGroup = ''.obs;

  void selectecMarital(String? value) {
    if (value != null) {
      selectedMarital.value = value;
    }
  }

  var selectedState = "tr".obs;

  void selecteStated(String? value) {
    if (value != null) {
      selectedState.value = value;
    }
  }

  RxString base64CompressedImage = ''.obs;
  RxString studentAddPath = ''.obs;

  // Change these lines to use Uint8List with proper import
  Rx<Uint8List?> frontLicenseImage = Rx<Uint8List?>(null);
  Rx<Uint8List?> backLicenseImage = Rx<Uint8List?>(null);

  Rx<File?> frontLicenseFile = Rx<File?>(null);
  Rx<File?> backLicenseFile = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  Future<File?> pickAddImage(ImageSource source) async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return null;
    final extension = pickedFile.path.split('.').last.toLowerCase();
    if (!['jpg', 'jpeg', 'png'].contains(extension)) {
      Get.snackbar("Invalid Format", "Only JPG, JPEG, PNG files are allowed.");
      return null;
    }
    File originalfile = File(pickedFile.path);
    File compressedFile = await compressImage(originalfile);
    final bytes = await compressedFile.readAsBytes();
    base64CompressedImage.value = base64Encode(bytes);
    studentAddPath.value = compressedFile.path;
    return compressedFile;
  }

  Future<File> compressImage(File file) async {
    final targetPath = file.path.replaceFirst(
      RegExp(r'\.(jpg|jpeg|png|webp|heic)$'),
      '_compressed.jpg',
    );
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70,
      format: CompressFormat.jpeg,
    );
    if (result == null) {
     // print("⚠️ Compression failed. Using original image.");
      return file;
    }
    return File(result.path);
  }

  Future<void> pickLicenseImage({required bool isFront}) async {
    final File? image = await pickAddImage(ImageSource.gallery);
    if (image != null) {
      final Uint8List bytes = await image
          .readAsBytes(); // Removed unnecessary cast
      if (isFront) {
        frontLicenseImage.value = bytes;
        frontLicenseFile.value = image;
      } else {
        backLicenseImage.value = bytes;
        backLicenseFile.value = image;
      }
    }
  }

  var selectedDate = DateTime.now().obs;
  var formattedDate = ''.obs;

  Future<DateTime?> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Appcolors.action,           // Header color, selected date circle
              onPrimary: Appcolors.page,           // Text on header
              onSurface: TextColors.neutral900,    // Default text color (body)
            ),
            iconTheme: IconThemeData(
              color: Appcolors.action,             // Calendar & arrow icons
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(

                foregroundColor: Appcolors.action, // OK / CANCEL button color
              ),
            ),
            dialogBackgroundColor: Appcolors.page,
            // Background color of the dialog
          ),
          child: child!,
        );

      },
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
      formattedDate.value = DateFormat('MMMM d, y').format(picked);
      final formattedForApi = DateFormat('yyyy-MM-dd').format(picked);
      return picked;
    }
    return null;
  }

  //------------------------------here and the all getx controller in use the profile setting all and end the profile section details page edn ------------------------------//
  //=========================================================================================================================================================================//

  final RxList<Allergy> allergies = <Allergy>[
    Allergy(name: 'Penicillin', severity: 'Moderate'),
    Allergy(name: 'Shellfish', severity: 'Severe'),
  ].obs;

  final RxList<Medication> medications = <Medication>[
    Medication(name: 'Lisinopril', dosage: '10mg', frequency: 'Once daily'),
    Medication(name: 'Metformin', dosage: '500mg', frequency: 'Twice daily'),
  ].obs;

  final RxMap<String, bool> existingConditions = <String, bool>{
    'Diabetes': false,
    'Hypertension': false,
    'Anxiety': false,
    'Depression': false,
    'Asthma': false,
    'None': false,
  }.obs;

  List<String> get selectedexistingConditions => existingConditions.entries
      .where((entry) => entry.value == true)
      .map((entry) => entry.key)
      .toList();

  final RxMap<String, bool> lifestyleFactors = <String, bool>{
    'Smoking': false,
    'Former Smoker': false,
    'Alcohol': false,
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
