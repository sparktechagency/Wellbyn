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
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Appcolors.primary,
          boxShadow: [
          BoxShadow(
          color:Colors.black12 , // softer effect
          blurRadius: 1, // reasonable softness
          spreadRadius: 1,
          offset: Offset(0, 0.3), // downward shadow
          ),
          ]
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
            SvgPicture.asset(trailingIconPath, color: TextColors.neutral900,),
          ],
        ),
      ),
    );
  }
}
