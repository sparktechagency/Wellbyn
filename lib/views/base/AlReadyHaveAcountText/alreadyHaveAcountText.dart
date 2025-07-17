import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  final String leadingText;
  final String actionText;
  final VoidCallback onTap;
  final double fontSize;
  final String fontFamily;

  const AlreadyHaveAccountText({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.onTap,
    this.fontSize = 16,
    required this.fontFamily ,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text.rich(
          TextSpan(
            text: leadingText,
            style: TextStyle(
              color: TextColors.neutral500,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
            ),
            children: [
              TextSpan(
                text: actionText,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: fontFamily,
                  color: Appcolors.action,
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
