import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellbyn/views/screen/doctor/doctor.dart';
import 'package:wellbyn/views/screen/profile/medical_info.dart';
import '../../utils/app_colors.dart';
import '../screen/Home/home_screen.dart';
import '../screen/appointment/appointment.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

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

  final List<Widget> _pages = [
     HomeScreen(),
     Doctor(),
     Appointment(),
     MedicalInfoPage(),
  ];

  void _onTap(int index) {
    if (index >= 0 && index < _pages.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use IndexedStack to keep all pages alive
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: Container(
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
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () => _onTap(index),
                  behavior: HitTestBehavior.translucent,
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
                          fontFamily: 'Satoshi',
                          fontSize: 12,
                          color: isSelected ? const Color(0xFF2D8BC9) : Colors.black54,
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
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
