import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
class ProfileListTile extends StatelessWidget {
  final String leadingIconPath;
  final String title;
  final String trailingIconPath;
  final VoidCallback? onTap;

  const ProfileListTile({
    super.key,
    required this.leadingIconPath,
    required this.title,
    required this.trailingIconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Appcolors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              offset: Offset(2, 0), // Right
              blurRadius: 3,
            ),
            // Left shadow
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              offset: Offset(-2, 0), // Left
              blurRadius: 3,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 2),
              blurRadius: 3,
            ),
// Top shadow
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, -2),
              blurRadius: 3,
            ),

          ],
        ),
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.all(2),
        child: Row(
          children: [
            SvgPicture.asset(leadingIconPath),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Satoshi',
                color: TextColors.neutral900,
                 fontWeight:  FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(trailingIconPath),
          ],
        ),
      ),
    );
  }
}
