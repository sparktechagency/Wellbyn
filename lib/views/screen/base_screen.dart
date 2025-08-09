import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/nav/appointment_nav.dart';
import 'package:wellbyn/nav/doctor.dart';
import 'package:wellbyn/nav/home_nav.dart';
import 'package:wellbyn/nav/profile_nav.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';
import '../../controllers/baseController/base_controller.dart';

import '../base/NavBar/nav_bar.dart';


// STEP 1: Optimized BaseScreen with lazy loading and widget caching
class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  // Step 2: Cache static widgets that don't change
  static  final Widget _homeScreen = HomeScreen();

  static  final Widget _bottomNavBar = BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final currentIndex = BaseController.to.currentIndex.value;
        // Step 3: Use conditional rendering instead of IndexedStack for better memory
        return _buildCurrentScreen(currentIndex);
      }),
      bottomNavigationBar: _bottomNavBar,
    );
  }

  // Step 4: Build only the current screen to save memory
  Widget _buildCurrentScreen(int index) {
    switch (index) {
      case 0:
        return HomeNav();
      case 1:
        return DoctorNav();
      case 2:
        return  AppointmentNav();
      case 3:
        return const ProfileNav();
      default:
        return _homeScreen;
    }
  }
}

