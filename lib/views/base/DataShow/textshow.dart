import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';

class TextshowData extends StatelessWidget {
  final String text;
  final double? height;
  final Color? color;
  final VoidCallback? onTap;

  const TextshowData({
    Key? key,
    required this.text,
    this.height,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: height ?? 50.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: ShadowColor.shadowColors1.withOpacity(0.10),
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 3),
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: TextColors.neutral900,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
