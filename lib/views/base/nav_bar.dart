import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/base_controller.dart';
import '../../utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  // Step 1: Make lists static const for better memory management
  static const List<String> _icons = [
    'assets/icons/home.svg',
    'assets/icons/stethoscope.svg',
    'assets/icons/calendar.svg',
    'assets/icons/man.svg',
  ];

  static const List<String> _icon = [
    'assets/icons/home_bold.svg',
    'assets/icons/doctor_bold.svg',
    'assets/icons/appointment_bold.svg',
    'assets/icons/uers_bold.svg',
  ];

  static const List<String> _labels = [
    'Home',
    'Doctor',
    'Appointment',
    'Profile',
  ];

  // Step 2: Pre-define colors as static const to avoid recreation
  static const Color selectedColor = Color(0xFF2D8BC9);
  static const Color unselectedColor = Colors.black54;
  static const Color shadowColor = Colors.black26;

  @override
  Widget build(BuildContext context) {
    final BaseController controller = Get.find<BaseController>();
    return Obx(() {
      final selectedIndex = controller.currentIndex.value;

      return Container(
        height: 81.h,
        decoration: const BoxDecoration(
          color: Appcolors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(-2, 1),
            )
          ],
        ),
        child: SafeArea(
          child: Obx(() {
            final selectedIndex = controller.currentIndex.value;

            return Row(
              children: List.generate(_icons.length, (index) {
                final isSelected = selectedIndex == index;

                return Expanded(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () => controller.changePage(index),
                      borderRadius: BorderRadius.circular(8.r),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedScale(
                              scale: isSelected ? 1.0 : 1.0,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeInOut,
                              child: SvgPicture.asset(
                                isSelected ?_icon[index] : _icons[index],
                                colorFilter: ColorFilter.mode(
                                  isSelected ? selectedColor : unselectedColor,
                                  BlendMode.srcIn,
                                ),
                                height: 24,
                                width: 24,
                              ),
                            ),
                            const SizedBox(height: 4),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected ? selectedColor : unselectedColor,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                fontFamily: 'Inter',
                              ),
                              child: Text(_labels[index]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      );

    });

  }
}