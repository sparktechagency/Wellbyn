import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';


class LogoHeader extends StatelessWidget {
  final String imagePath;
  final String title;
  final double imageSize;
  final double fontSize;

  const LogoHeader({
    super.key,
    required this.imagePath,
    required this.title,
    this.imageSize = 150,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          imagePath,
          width: imageSize.w,
          height: imageSize.h,
          color: Appcolors.action,
          semanticsLabel: 'App Logo',
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontFamily: AppConstants.FONT_FAMILY,
            fontSize: fontSize.sp,
            color: TextColors.primary2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
