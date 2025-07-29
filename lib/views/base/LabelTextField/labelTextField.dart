import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:wellbyn/helpers/di.dart';
import 'package:wellbyn/utils/app_icons.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../Apptext/app_text.dart';

class LabeledTextFielded extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final bool? isEmail;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
  final String? prefixIcon;
  final Color? borderColor; // Add this
  final int? maxline;
  final bool next;
  final VoidCallback? onTap;
  final bool? readOnly;
  final AutovalidateMode? autovalidateMode;


  const LabeledTextFielded({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.isEmail,
    this.next=false,
    this.keyboardType,
    this.suffixIcon,
    this.suffixSvgAsset,
    this.suffixSvgColor,
    this.prefixIcon,
    this.maxline,
    this.onTap,
    this.readOnly,
    this.borderColor,
    this.autovalidateMode,// Add this to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(label, fontSize: 16, color: TextColors.neutral900),
        SizedBox(height: 8.h),
        CustomTextFielded(
          controller: controller,
          hintText: hintText,
          onTap: onTap,
          autovalidateMode: autovalidateMode,
          readOnly: readOnly,
          isPassword: isPassword,
          isEmail: isEmail,
          keyboardType: keyboardType,
          suffixIcon: suffixIcon,
          suffixSvgAsset: suffixSvgAsset,
          suffixSvgColor: suffixSvgColor,
          prefixIcon: prefixIcon,
          maxLines: maxline,
          next: next,
          borderColor: borderColor, // Pass borderColor here
        ),
      ],
    );
  }
}

class CustomTextFielded extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final Color? borderColor;
  final String? obscure;
  final Color? filColor;
  final String? prefixIcon;
  final String? labelText;
  final String? hintText;
  final VoidCallback? onTap;
  final bool? readOnly;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final bool? isEmail;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final bool? enabled;
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
  final bool next;

  const CustomTextFielded({
    super.key,
    required this.controller,
    this.hintText,
    this.borderColor,
    this.prefixIcon,
    this.next = false,
    this.suffixIcon,
    this.validator,
    this.isEmail,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscure = '*',
    this.filColor,
    this.labelText,
    this.isPassword = false,
    this.autovalidateMode,
    this.onChanged,
    this.maxLines,
    this.enabled,
    this.suffixSvgAsset,
    this.suffixSvgColor,
    this.onTap,
    this.readOnly,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
  });

  @override
  State<CustomTextFielded> createState() => _CustomTextFieldedState();
}

class _CustomTextFieldedState extends State<CustomTextFielded> {
  late bool obscureText;
  Widget? cachedPrefixIcon;
  Widget? cachedSuffixIcon;
  bool isValid= true;


  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;

    isValid = widget.controller.text.trim().isNotEmpty;

    if (widget.prefixIcon != null) {
      cachedPrefixIcon = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SvgPicture.asset(
          widget.prefixIcon!,
          width: 16.w,
          height: 16.w,
          colorFilter: const ColorFilter.mode(
            TextColors.neutral500,
            BlendMode.srcIn,
          ),
        ),
      );
    }

    if (widget.suffixSvgAsset != null) {
      cachedSuffixIcon = Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          widget.suffixSvgAsset!,
          width: 20.w,
          height: 20.w,
          colorFilter: ColorFilter.mode(
            widget.suffixSvgColor ?? TextColors.neutral900,
            BlendMode.srcIn,
          ),
        ),
      );
    }

    widget.controller.addListener((){
      final hastext = widget.controller.text.trim().isNotEmpty;
      if(hastext != isValid){
        setState(() {
          isValid = hastext;
        });
      }
    });
  }

  OutlineInputBorder get focusedBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(
      width: 1.1,
      color: widget.borderColor ?? BorderColors.primary,
    ),
  );

  OutlineInputBorder get enabledBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(
      width: 0,
      color: Colors.transparent,
    ),
  );

  void togglePassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [

              BoxShadow(
                color: ShadowColor.shadowColors1.withOpacity(0.10), // Shadow color
                blurRadius: 4, // Softness
                spreadRadius: 0,
                offset: Offset(0, 3), // Position of shadow
                blurStyle: BlurStyle.normal
              ),
            ]
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? obscureText : false,
            obscuringCharacter: widget.obscure ?? '*',
            readOnly: widget.readOnly ?? false,
            enabled: widget.enabled ?? true,
            autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.disabled,
            textInputAction:
            widget.next ? TextInputAction.next : TextInputAction.done,
            maxLines: widget.isPassword ? 1 : widget.maxLines,
            cursorColor: TextColors.neutral900,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            validator: widget.validator ??
                    (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter ${widget.hintText?.toLowerCase() ?? 'this field'}";
                  }
                  if (widget.isEmail == true) {
                    if (!AppConstants.emailValidator.hasMatch(value)) {
                      return "Please check your email!";
                    }
                  }
                  return null;
                },
            style: const TextStyle(
              letterSpacing: 0.2,
              color: TextColors.neutral900,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                letterSpacing: 0.2,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: TextColors.neutral500,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.contentPaddingHorizontal ?? 8.w,
                vertical: widget.contentPaddingVertical ?? 12.w,
              ),
              fillColor: widget.filColor,
              prefixIcon: cachedPrefixIcon,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                onTap: togglePassword,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    obscureText
                        ? AppIcons.lockIcon // Replace with your "hidden" icon path
                        : AppIcons.lockIcon,   // Replace with your "visible" icon path
                    width: 20.w,
                    height: 20.w,
                    colorFilter: const ColorFilter.mode(
                      TextColors.neutral500,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              )
                  : cachedSuffixIcon ?? widget.suffixIcon,

              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: BorderColors.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: BorderColors.error, width: 1.1),
              ),


            ),
          ),
        ),
      ],
    );
  }

}