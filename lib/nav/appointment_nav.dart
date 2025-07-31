import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';
import 'package:wellbyn/views/screen/appointment/appointment.dart';
import 'package:wellbyn/views/screen/compiled/appoinetment_details.dart';
import 'package:wellbyn/views/screen/doctor/doctor_profile.dart';

import '../utils/nab_ids.dart';
import '../views/screen/upcoming/chekIn_appointment.dart';

class AppointmentNav extends StatelessWidget {
  AppointmentNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.appointment),
      onGenerateRoute: (settings) {
        if (settings.name == '/appointment/details') {
          return GetPageRoute(
            settings: settings,
            page: () =>  Appointment(),
            transition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 400),

          );
        } else if(settings.name =="/appoinetment_details"){
          return GetPageRoute(
            settings: settings,
            page: () => AppoinetmentDetails(),
            transitionDuration: Duration(milliseconds: 400),
            transition: Transition.rightToLeft,
          );
        }else if(settings.name =="/chekIn_appointment"){
          return GetPageRoute(
            settings: settings,
            page: () => ChekinAppointment(),
            transition: Transition.rightToLeft,
          );
        }
        else if(settings.name =="/doctor_profile"){
          return GetPageRoute(
            settings: settings,
            page: () => DoctorProfile(),
            transition: Transition.rightToLeft,
          );
        }
        else {
          return GetPageRoute(
            settings: settings,
            page: () =>  Appointment(),
            transition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 400),
          );
        }
      },
    );
  }
}
