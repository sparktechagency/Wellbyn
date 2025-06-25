import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmationScreen extends StatelessWidget {
  final String svgAsset;
  final String buttonAsset;
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onButtonTap;
  final Color buttonColor;
  final Color buttonTextColor;
  final double buttonHeight;

  const ConfirmationScreen({
    super.key,
    required this.svgAsset,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onButtonTap,
    this.buttonColor = Colors.blue,
    this.buttonTextColor = Colors.white,
    this.buttonHeight = 45,
    required this.buttonAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 1.sh),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      svgAsset,
                      width: 150.w,
                      height: 150.h,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight.h,
                      child: ElevatedButton.icon(
                        icon: SvgPicture.asset(
                         buttonAsset,
                          colorFilter:
                          ColorFilter.mode(buttonTextColor, BlendMode.srcIn),
                        ),
                        label: Text(
                          buttonText,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: buttonTextColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onPressed: onButtonTap,
                      ),
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
