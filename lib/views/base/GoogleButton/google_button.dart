import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ShadowColor.shadowColors1.withOpacity(0.10),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(8.r),
          color: Appcolors.primary,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/google.svg',
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 8.w),
              const Text(
                "Continue with Google",
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 16,
                  color: Appcolors.actionHover,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
