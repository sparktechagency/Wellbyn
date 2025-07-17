import 'package:flutter/material.dart';
import 'package:wellbyn/utils/app_colors.dart';

import '../../../utils/app_constants.dart';
class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const AppText(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 20,
        fontFamily: AppConstants.FONT_FAMILY,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? TextColors.neutral900,
      ),
    );
  }
}
