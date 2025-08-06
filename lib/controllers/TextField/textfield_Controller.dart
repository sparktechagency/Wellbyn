import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  RxString selectedValue = 'Male'.obs;
  RxString relationShip = 'Father'.obs;
  RxString selectedValuePermission = 'Partal control'.obs;
  RxString maritialValue  = 'Select state'.obs;
  RxString categoySelected  = 'Select'.obs;
  RxString bloodGroup  = 'None'.obs;
  RxString state  = 'Select'.obs;



  //==================> label Textfield here work <===================//
  late bool obscureText;
  late FocusNode focusNode;
  final _touched = false.obs;
  final _hasError = false.obs;
  final _isValid = false.obs;
  //======>  Getters for reactive variables  <=========//
  bool get touched => _touched.value;
  bool get hasError => _hasError.value;
  bool get isValid => _isValid.value;

//=======> setters <=========//
  set touched(bool value) => _touched.value = value;
  set hasError(bool value) => _hasError.value = value;
  set isValid(bool value) => _isValid.value = value;

  void togglePassword (){
    obscureText = !obscureText;
    update();
  }

  void marksAsTouched(){
    if(!touched){
      touched =true;
    }
  }
  @override
  void onClose() {
    //======> TODO: implement onClose <======//
    focusNode.dispose();
    super.onClose();
  }
}
