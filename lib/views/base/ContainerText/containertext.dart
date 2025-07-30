import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
class Containertext extends StatelessWidget {
  final String text;
  final double? height;
  final Color? Textcolor;

  Containertext({super.key, required this.text, this.height,this.Textcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color:Colors.white,
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
          fontSize: 12,
          letterSpacing: 0.2,
          color:Textcolor?? TextColors.neutral500,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
