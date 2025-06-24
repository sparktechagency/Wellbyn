import 'package:get/get.dart';

class RoleController extends GetxController {
  final isLoading = false.obs;
  var selectedRole = 'Patients'.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }
}
