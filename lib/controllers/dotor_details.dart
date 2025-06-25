import 'package:get/get.dart';

class DoctorDetailsController extends GetxController{
  RxBool isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }


}