import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:wellbyn/utils/app_constants.dart';

import '../../utils/app_colors.dart';

class IconTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String svgAsset;
  final Color backgroundColor;
  final Color textColor;
  final Color bordercolor;
  final double height;
  final double? width;
  final Color? svgAssetcolor;
  final bool isLoading;
  final int fontsize;
  final String? lottieAsset;

  const IconTextButton({
    super.key,
    required this.onTap,
    this.text = "Back to login",
    this.svgAsset = "assets/icons/back.svg",
    this.backgroundColor = const Color(0xFF0055FF),
    this.textColor = Colors.white,
    this.height = 45,
    this.width,
    this.fontsize=14,
    this.svgAssetcolor,
    this.bordercolor = Colors.transparent,
    this.isLoading = false,
    this.lottieAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap, // prevent tap during loading
      child: Container(
        height: height.h,
        width: width != null ? width!.w : double.infinity, // full width fallback
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
                color: ShadowColor.shadowColors1.withOpacity(0.10), // Shadow color
                blurRadius: 4, // Softness
                spreadRadius: 0,
                offset: Offset(0, 3), // Position of shadow
                blurStyle: BlurStyle.normal
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? lottieAsset != null
              ? Lottie.asset(
            lottieAsset!,
            width: 24.w,
            height: 24.w,
          )
              : SizedBox(
            height: 24.w,
            width: 24.w,
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAsset,
                width: 18.w,
                height: 18.w,
                colorFilter: ColorFilter.mode(
                  svgAssetcolor ?? textColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: AppConstants.FONT_FAMILY,
                    fontSize:fontsize.h,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
