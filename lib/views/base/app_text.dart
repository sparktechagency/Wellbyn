import 'package:flutter/material.dart';
import 'package:wellbyn/utils/app_colors.dart';
class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  const AppText(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 20,
        fontFamily: "Satoshi",
        fontWeight: FontWeight.w500,
        color: color ?? TextColors.neutral900,
      ),
    );
  }
}
