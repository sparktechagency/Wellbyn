import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/doctor/book_report.dart';

import '../utils/nab_ids.dart';
import '../views/screen/doctor/doctor.dart';
import '../views/screen/doctor/doctor_details.dart';

class DoctorNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.profile),  // unique nested key for nested navigator
      onGenerateRoute: (settings) {
        if (settings.name == '/doctor_details') {
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => DoctorDetails(doctorId: args?['doctorId'] ?? ''),
          );
        }else if(settings.name =="/book_report"){
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => BookReport(),
          );
        }
        else {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => Doctor(),
          );
        }
      },
    );
  }
}
