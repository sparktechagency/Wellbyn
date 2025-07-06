import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepCircle extends StatelessWidget {
  final bool isActive;
  final String step;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeTextColor;
  final Color inactiveTextColor;

  const StepCircle({
    super.key,
    required this.isActive,
    required this.step,
    required this.activeColor,
    required this.inactiveColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        step,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: isActive ? activeTextColor : inactiveTextColor,
        ),
      ),
    );
  }
}
