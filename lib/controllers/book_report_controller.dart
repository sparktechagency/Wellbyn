import 'package:get/get.dart';

class BookReportController extends GetxController {
  //========>  List of dropdown items  <========//
  final items = ["Health check.", "Blood test.", "Headache check.","Check-up.","Skin exam.", "Allergy care.","Back exam.","Digestive check.","Med review.","Other",];

  //======> Currently selected item <======//
  var selectedValue = "I need a cleaning".obs;

  //========> Method to update selected value <=======//
  void setSelected(String value) {
    selectedValue.value = value;
  }

}
