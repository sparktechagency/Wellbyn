import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/doctor/book_overview.dart';
import 'package:wellbyn/views/screen/doctor/book_report.dart';
import 'package:wellbyn/views/screen/doctro_message/doctor_message.dart';

import '../utils/nab_ids.dart';
import '../views/screen/doctor/doctor.dart';
import '../views/screen/doctor/doctor_details.dart';

class DoctorNav extends StatelessWidget {
  const DoctorNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.profile),
      onGenerateRoute: (settings) {
        if (settings.name == '/doctor_details') {
          final args = settings.arguments as Map<String, dynamic>?;

          return GetPageRoute(
            settings: settings,
            page: () => DoctorDetails(doctorId: args?['doctorId'] ?? ''),
            transition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 400),
          );
        } else if (settings.name == "/book_report") {
          return GetPageRoute(
            settings: settings,
            page: () => BookReport(),
            transition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 400),
          );
        } else if (settings.name == "/book_overview") {
          return GetPageRoute(
            settings: settings,
            page: () => BookOverview(),
            transition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 400),
          );
        } else if (settings.name == "/doctor_message") {
          return GetPageRoute(
            settings: settings,
            page: () => DoctorMessage(),
            transition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 400),
          );
        } else {
          return GetPageRoute(
            settings: settings,
            page: () => Doctor(),
            transition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 400),
          );
        }
      },
    );


  }
}
