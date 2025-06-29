import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';
import 'package:wellbyn/views/screen/appointment/appointment.dart';

import '../utils/nab_ids.dart';

class AppointmentNav extends StatelessWidget {
  AppointmentNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.appointment),
      onGenerateRoute: (settings) {
        if (settings.name == '/appointment/details') {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) =>  Appointment(),
          );
        } else {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) =>  Appointment(),
          );
        }
      },
    );
  }
}
