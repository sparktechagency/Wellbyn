import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonVariant { filled, outlined }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final bool isDisabled;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.filled,
    this.isDisabled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2E8BC9); // Primary/500
    final Color hoverColor = const Color(0xFF1565C0);   // Primary/700
    final Color disabledColor = const Color(0xFFCBD5E1); // Neutral/300
    final Color background = isDisabled
        ? disabledColor
        : variant == ButtonVariant.filled
        ? primaryColor
        : Colors.white;

    final Color textColor = isDisabled
        ? Colors.grey
        : variant == ButtonVariant.filled
        ? Colors.white
        : primaryColor;

    final BorderSide borderSide = BorderSide(
      color: isDisabled ? disabledColor : primaryColor,
      width: 1.5,
    );

    return Opacity(
      opacity: isDisabled ? 0.6 : 1,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: Size(double.infinity, 50.h),
          backgroundColor: background,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: variant == ButtonVariant.outlined ? borderSide : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20.sp, color: textColor),
              SizedBox(width: 8.w),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
