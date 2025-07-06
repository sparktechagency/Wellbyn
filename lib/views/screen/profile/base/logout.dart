import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wellbyn/utils/app_icons.dart';
import '../../../../utils/app_colors.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String iconAsset;
  final Color iconColor;
  final String title;
  final String description;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomConfirmationDialog({
    super.key,
    required this.iconAsset,
    this.iconColor = Appcolors.error700,
    required this.title,
    required this.description,
    this.confirmText = "Yes",
    this.cancelText = "No",
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                iconAsset,
                height: 30,
                width: 30,
                color: iconColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontFamily: "Satoshi",
                color: TextColors.neutral900,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Satoshi",
                color: TextColors.neutral500,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Container(height: 1, color: TextColors.neutral300),
            Align(
              child: TextButton(
                onPressed: onConfirm,
                child: Text(
                  confirmText,
                  style: TextStyle(
                    fontSize: 18,
                    color: Appcolors.error700,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Satoshi",
                  ),
                ),
              ),
            ),
            Container(height: 1, color: TextColors.neutral300),
            Align(
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return TextColors.action;
                  }),
                ),
                onPressed: onCancel,
                child: Text(
                  cancelText,
                  style: TextStyle(
                    fontSize: 18,
                    color: TextColors.primary,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Satoshi",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
