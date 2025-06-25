import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CaregiverController extends GetxController {
  RxList<String> yourCaregivers = <String>[
    'John Doe',
    'Jane Smith',
  ].obs;

  RxList<Map<String, String>> asCaregiver = <Map<String, String>>[
    {'name': 'Alex Johnson', 'relation': 'Uncle'},
    {'name': 'Emma Watson', 'relation': 'Sister'},
  ].obs;

  void removeYourCaregiver(int index) {
    yourCaregivers.removeAt(index);
  }

  void removeAsCaregiver(int index) {
    asCaregiver.removeAt(index);
  }
}
