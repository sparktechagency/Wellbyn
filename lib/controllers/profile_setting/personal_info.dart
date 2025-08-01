import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';

import '../../utils/app_colors.dart';

class OnboardingProfileInfo extends GetxController{

  final nameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final childrenController = TextEditingController();
  final employerController = TextEditingController();
  final licenseController = TextEditingController();
  final ssnController = TextEditingController();
  final numberOfChildController = TextEditingController();

  @override
  void onClose() {
    // Automatically called when controller is removed from memory
    nameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipController.dispose();
    childrenController.dispose();
    employerController.dispose();
    licenseController.dispose();
    ssnController.dispose();
    numberOfChildController.dispose();
    super.onClose();
  }


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

  final RxMap<String, bool> existingConditions = <String, bool>{
    'Diabetes': false,
    'Hypertension': false,
    'Anxiety': false,
    'Depression': false,
    'Asthma': false,
    'None': false,
  }.obs;

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
    print(selectedGender);
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

  RxBool isFrontUploading = false.obs;
  RxBool isBackUploading = false.obs;


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
      print("⚠️ Compression failed. Using original image.");
      return file;
    }
    return File(result.path);
  }

  Future<void> pickLicenseImage({required bool isFront}) async {
    if(isFront){
      isFrontUploading.value = true;
    }else{
      isBackUploading.value= true;
    }

    try{
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
    }finally{
      if(isFront){
        isFrontUploading.value = false;
      }else{
        isFrontUploading.value = false;

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



}