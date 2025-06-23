import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/base_controller.dart';
import '../../utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  final List<String> _icons = const [
    'assets/icons/home.svg',
    'assets/icons/stethoscope.svg',
    'assets/icons/calendar.svg',
    'assets/icons/user.svg',
  ];

  final List<String> _labels = const [
    'Home',
    'Doctor',
    'Appointment',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    final BaseController controller = Get.find<BaseController>();

    return Obx(() {
      final selectedIndex = controller.currentIndex.value;

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
              children: List.generate(_icons.length, (index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => controller.changePage(index),
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
    });
  }
}
