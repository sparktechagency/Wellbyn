import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class CustomDatePickerField extends StatelessWidget {
  final RxString selectedDate;
  final VoidCallback onTap;
  final String hintText;
  final String svgIconPath;

  const CustomDatePickerField({
    super.key,
    required this.selectedDate,
    required this.onTap,
    required this.hintText,
    required this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Appcolors.primary,
          boxShadow: [
            BoxShadow(
              color: ShadowColor.shadowColors1.withOpacity(0.10),
              blurRadius: 4,
              offset: Offset(0, 3),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Text(
              selectedDate.value.isEmpty ? hintText : selectedDate.value,
              style: TextStyle(
                fontFamily: AppConstants.FONT_FAMILY,
                fontSize: 16,
                color: selectedDate.value.isEmpty
                    ? TextColors.neutral500
                    : TextColors.neutral900,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              svgIconPath,
              color: TextColors.action,
            ),
          ],
        ),
      ),
    ));
  }
}
