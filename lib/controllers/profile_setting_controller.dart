import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileSettingContrller extends GetxController{

  var selectedGender = 'Male'.obs;



  // Change selected gender
  void selectGender(String gender) {
    selectedGender.value = gender;
    print(selectedGender);

  }

  final RxString selectedMarital = ''.obs;

  void selectecMarital(String? value) {
    if (value != null) {
      selectedMarital.value = value;
    }
  }


  var selectedDate = DateTime.now().obs;
  var formattedDate = ''.obs;
  Future<DateTime?> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
      formattedDate.value = DateFormat('MMMM d, y').format(picked);
      final formattedForApi = DateFormat('yyyy-MM-dd').format(picked);

      //await fetchStudentsByDate(formattedForApi, classId);
      // await fetchStudentsForClass(classId);


      // Return the picked date so the caller can react as well
      return picked;
    }

    // User canceled the picker, return null
    return null;
  }
}