import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wellbyn/utils/app_icons.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final Color? borderColor;
  final String? obscure;
  final Color? filColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final bool isPassword;
  final bool? isEmail;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final bool? enabled;

  const CustomTextField({
    super.key,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.hintText,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.isEmail,
    required this.controller,
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
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
      child: TextFormField(
        autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.disabled,
        controller: widget.controller,
        maxLines: widget.isPassword ? 1 : widget.maxLines,
        keyboardType: widget.keyboardType,
        obscuringCharacter: widget.obscure!,
        enabled: widget.enabled ?? true,
        // validator: widget.validator,
        validator:
            widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return "Please enter ${widget.hintText?.toLowerCase() ?? 'this field'}";
              }

              if (widget.isEmail == true) {
                // Email validation
                bool isValidEmail = AppConstants.emailValidator.hasMatch(value);
                if (!isValidEmail) {
                  return "Please check your email!";
                }

              }

              return null;
            },

        cursorColor: TextColors.neutral900,
        obscureText: widget.isPassword ? obscureText : false,
        onChanged: widget.onChanged,
        style: TextStyle(
            color: TextColors.neutral900,
            fontSize: 16,
            fontFamily: AppConstants.FONT_FAMILY,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: BorderColors.error),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              width: 1.1,
              color: widget.borderColor ?? BorderColors.primary,
            ),
          ),

          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.contentPaddingHorizontal ?? 15.w,
            vertical: widget.contentPaddingVertical ?? 12.w,
          ),
          fillColor: widget.filColor,
          prefixIconColor: TextColors.neutral900,
          prefixIcon: widget.prefixIcon != null
              ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.prefixIcon,
          )
              : null,
          prefixIconConstraints: widget.prefixIcon != null
              ? BoxConstraints(minHeight: 20.w, minWidth: 20.w)
              : null,

          suffixIconColor: TextColors.neutral900,
          suffixIcon: widget.isPassword
              ? GestureDetector(
            onTap: toggle,
            child: _svgSuffixIcon(
              obscureText
                  ? AppIcons.viewIcon  // e.g., 'assets/icons/eye_closed.svg'
                  : AppIcons.viewIcon,  // e.g., 'assets/icons/eye_open.svg'
            ),
          )
              : widget.suffixIcon,
          labelText: widget.labelText,
          // Always enabled to keep full custom styling
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: AppConstants.FONT_FAMILY,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: TextColors.secondary,
          ),
        ),
      ),
    );
  }

  Widget _svgSuffixIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SvgPicture.asset(
        assetPath,
        width: 16.w,
        height: 16.w,
        colorFilter: const ColorFilter.mode(TextColors.neutral900, BlendMode.srcIn),
      ),
    );
  }

}
