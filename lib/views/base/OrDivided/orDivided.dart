import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../TextStyle/text_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(height: 1.h, color: TextColors.neutral200),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "OR",
            style: Styles.labelStyle,
          ),
        ),
        Expanded(
          child: Container(height: 1.h, color: TextColors.neutral200),
        ),
      ],
    );
  }
}
