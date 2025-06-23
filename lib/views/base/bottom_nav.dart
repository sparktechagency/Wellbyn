import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/views/base/tab_navigator.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';
import 'package:wellbyn/views/screen/appointment/appointment.dart';
import 'package:wellbyn/views/screen/doctor/doctor.dart';
import 'package:wellbyn/views/screen/doctor/doctor_details.dart';
import 'package:wellbyn/views/screen/profile/medical_info.dart';

import '../../controllers/bottom_nav_controll.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({Key? key}) : super(key: key);

  final BottomNavController controller = Get.put(BottomNavController());

  final List<String> _icons = [
    'assets/icons/home.svg',
    'assets/icons/stethoscope.svg',
    'assets/icons/calendar.svg',
    'assets/icons/user.svg',
  ];

  final List<String> _labels = [
    'Home',
    'Doctor',
    'Appointment',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Scaffold(
        body: Obx(() {
          return IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              TabNavigator(
                navigatorKey: controller.navigatorKeys[0],
                child: HomeScreen(),
              ),
              
              TabNavigator(
                navigatorKey: controller.navigatorKeys[1], // ✅ navigator key for Doctor tab
                child: Doctor(
                  onDetailsTap: (String doctorId) {
                    // ✅ Use Get.to with id matching this navigator
                    Get.to(() => DoctorDetails(
                      doctorId: doctorId,
                      onBack: () => Get.back(id: 1), // go back within this navigator
                    ), id: 1); // id must match this navigator
                  },
                ),
              ),

              TabNavigator(
                navigatorKey: controller.navigatorKeys[2],
                child: Appointment(),
              ),
              TabNavigator(
                navigatorKey: controller.navigatorKeys[3],
                child: MedicalInfoPage(),
              ),
            ],
          );
        }),
        bottomNavigationBar: Obx(() {
          int selectedIndex = controller.selectedIndex.value;

          return Container(
            decoration: const BoxDecoration(
              color: Appcolors.primary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Appcolors.secondary,
                  blurRadius: 12,
                  offset: Offset(0, -2),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () => controller.selectTab(index),
                      child: SizedBox(
                        height: 60,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              _icons[index],
                              colorFilter: ColorFilter.mode(
                                isSelected ? const Color(0xFF2D8BC9) : Colors.black54,
                                BlendMode.srcIn,
                              ),
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _labels[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? const Color(0xFF2D8BC9)
                                    : Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (isSelected)
                              Container(
                                height: 3,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
