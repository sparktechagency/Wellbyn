import 'package:get/get.dart';

enum Gender { male, female, other }
class PersonalInformation extends GetxController{
  var selectedGender = Gender.male.obs;

  void selectGender(Gender gender) {
    selectedGender.value = gender;
  }
}