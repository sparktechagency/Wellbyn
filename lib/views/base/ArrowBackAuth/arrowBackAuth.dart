import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_constants.dart';

class BackButtonWithText extends StatelessWidget {
  final String text;
  final String iconPath;
  final double iconWidth;
  final double iconHeight;
  final Color iconColor;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const BackButtonWithText({
    super.key,
    this.text = "Back to login",
    this.iconPath = "assets/icons/back.svg",
    this.iconWidth = 20, // Changed from 4 to 16 for visibility
    this.iconHeight = 24,
    this.iconColor = Colors.black,
    this.textStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: iconWidth,
            height: iconHeight,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          SizedBox(width: 12),
          Text(
            text,
            style: textStyle ??
                 TextStyle(
                  fontFamily:AppConstants.FONT_FAMILY,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
          )
        ],
      ),
    );
  }
}
