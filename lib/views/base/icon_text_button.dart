import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

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
  final String? lottieAsset; // ✅ optional Lottie animation

  const IconTextButton({
    super.key,
    required this.onTap,
    this.text = "Back to login",
    this.svgAsset = "assets/icons/back.svg",
    this.backgroundColor = const Color(0xFF0055FF), // default example
    this.textColor = Colors.white,
    this.height = 45,
    this.width,
    this.svgAssetcolor,
    this.bordercolor = Colors.transparent,
    this.isLoading = false,
    this.lottieAsset, // ✅
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width?.w,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: bordercolor),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
          ?  Text(
            "Loading...",
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          )
              // ? lottieAsset != null
              //       ? Lottie.asset(
              //           lottieAsset!,
              //           width: 30,
              //           height: 30,
              //           fit: BoxFit.fitHeight, // ✅ Use contain to center properly
              //           repeat: true,
              //           animate: true,
              //
              //         )
              //       : SizedBox(
              //           height: 20.w,
              //           width: 20.w,
              //           child: CircularProgressIndicator(
              //             strokeWidth: 2,
              //             valueColor: AlwaysStoppedAnimation<Color>(textColor),
              //           ),
              //         )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      svgAsset,
                      width: 16.w,
                      height: 22.h,
                      colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      text,
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 15,
                        color: textColor,
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
