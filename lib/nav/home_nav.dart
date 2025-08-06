import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';

import '../utils/nab_ids.dart';
import '../views/screen/doctor/doctor_details.dart';

class HomeNav extends StatelessWidget {
   const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        if (settings.name == '/home/details') {
          return GetPageRoute(
            settings: settings,
            transition: Transition.rightToLeft,
            page: () =>  HomeScreen(),
            transitionDuration: Duration(milliseconds: 400),

          );
        }

        if (settings.name == '/doctor_details') {
          final args = settings.arguments as Map<String, dynamic>?;
          return GetPageRoute(
            settings: settings,
            transitionDuration: Duration(milliseconds: 400),
            transition: Transition.rightToLeft,
            page: () => DoctorDetails(doctorId: args?['doctorId'] ?? ''),
          );
        } else {
          return GetPageRoute(
            settings: settings,
            transitionDuration: Duration(milliseconds: 400),
            transition: Transition.rightToLeft,
            page: () =>  HomeScreen(),
          );
        }

      },
    );
  }
}
