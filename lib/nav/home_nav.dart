import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';

import '../utils/nab_ids.dart';
import '../views/screen/doctor/doctor_details.dart';

class HomeNav extends StatelessWidget {
   HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        if (settings.name == '/home/details') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) =>  HomeScreen(),
          );
        }

        if (settings.name == '/doctor_details') {
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => DoctorDetails(doctorId: args?['doctorId'] ?? ''),
          );
        } else {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) =>  HomeScreen(),
          );
        }

      },
    );
  }
}
