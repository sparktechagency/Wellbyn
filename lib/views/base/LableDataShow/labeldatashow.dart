import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';

class Labeldatashow extends StatelessWidget {
  final String text;
  final String LableText;
  final double? height;
  final Color? color;


  const Labeldatashow({
    Key? key,
    required this.text,
    this.height,
    required this.LableText,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LableText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Inter",
            color: TextColors.neutral900,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.h,),
        Container(
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
                fontSize: 14,
                color: TextColors.neutral500,
                fontWeight: FontWeight.w500,
              ),
            ),
        ),
      ],
    );
  }
}
