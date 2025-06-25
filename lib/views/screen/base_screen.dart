
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wellbyn/nav/doctor.dart';
import 'package:wellbyn/nav/profile_nav.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';
import 'package:wellbyn/views/screen/appointment/appointment.dart';
import 'package:wellbyn/views/screen/doctor/doctor.dart';
import 'package:wellbyn/views/screen/doctor/doctor_details.dart';
import 'package:wellbyn/views/screen/profile/base/medical_info.dart';
import 'package:wellbyn/views/screen/profile/base/personal_info.dart';
import 'package:wellbyn/views/screen/profile/setting.dart';

import '../../controllers/base_controller.dart';
import '../base/nav_bar.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: BaseController.to.currentIndex.value,
        children: [
          const HomeScreen(),
          DoctorNav(),
          Appointment(),
          ProfileNav(),

        ],
      )),
      bottomNavigationBar:  BottomNavBar(),
    );
  }
}
