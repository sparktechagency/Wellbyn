import 'package:get/get.dart';

class DoctorDetailsController extends GetxController{
  RxBool isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
  var selectedTime = ''.obs;

  void selectTime(String time) {
    selectedTime.value = time;
  }
 //  final Rx<DateTime> currentMonth = DateTime.now().obs;
 //  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
 // // final RxString selectedTime = ''.obs;
 //
 //  final List<String> timeSlots = [
 //    '11:45 am',
 //    '2:15 pm',
 //    '4:30 am',
 //    '6:20 pm',
 //    '10:05 pm',
 //    '7:00 pm',
 //    '1:55 am',
 //  ];
 //
 //  void initDefaults() {
 //    final today = DateTime.now();
 //    selectedDate.value = DateTime(today.year, today.month, today.day);
 //  }
 //
 //  void changeMonth(int offset) {
 //    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month + offset);
 //  }
 //
 //  void selectDate(DateTime date) {
 //    selectedDate.value = date;
 //  }
 //
 //  void selectTime(String time) {
 //    selectedTime.value = time;
 //  }

}