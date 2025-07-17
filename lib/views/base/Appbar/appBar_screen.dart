import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class AppBarTheApp extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final bool centerTitle;
  final bool showBackButton;

  const AppBarTheApp({
    super.key,
    required this.title,
    this.onBack,
    this.centerTitle = true,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolors.page,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontFamily: "Satoshi",
          fontWeight: FontWeight.w500,
          color: TextColors.neutral500,
        ),
      ),
      centerTitle: centerTitle,
      leading: showBackButton
          ? IconButton(
        onPressed: onBack ?? () => Get.back(),
        icon: SvgPicture.asset(
          'assets/icons/arrow-left.svg',
          width: 30.w,
          height: 30.h,
          color: TextColors.neutral900,
        ),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
