import 'package:flutter/material.dart';
import 'package:wellbyn/utils/app_colors.dart';

class RowWithTitleAndAction extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? actionColor;
  final double? titleFontSize;
  final double? actionFontSize;

  const RowWithTitleAndAction({
    super.key,
    required this.title,
    required this.actionText,
    this.onTap,
    this.titleColor,
    this.actionColor,
    this.titleFontSize,
    this.actionFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize ?? 20,
            fontWeight: FontWeight.w500,
            fontFamily: "Satoshi",
            color: titleColor ?? TextColors.neutral900,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: TextStyle(
              fontFamily: "Satoshi",
              fontSize: actionFontSize ?? 16,
              color: actionColor ?? Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
