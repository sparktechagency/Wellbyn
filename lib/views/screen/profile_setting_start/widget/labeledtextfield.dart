
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../base/app_text.dart';
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
    this.borderColor, // Add this to constructor
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
  final VoidCallback? onTap; // 👈 Add this
  final bool? readOnly; // 👈 Optional to control editability
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
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
  final bool next;

  const CustomTextFielded({
    super.key,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.hintText,
    this.borderColor,
    this.prefixIcon,
    this.next=false,
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
    this.suffixSvgAsset,
    this.suffixSvgColor,
    this.onTap,
    this.readOnly,
  });

  @override
  State<CustomTextFielded> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFielded> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.disabled,
      controller: widget.controller,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscure!,
      enabled: widget.enabled ?? true,
      textInputAction: widget.next ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (widget.next) {
          FocusScope.of(context).nextFocus();
        } else {
          FocusScope.of(context).unfocus(); // or call submit logic
        }
      },

      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      // validator: widget.validator,
      validator:
      widget.validator ??
              (value) {
            if (value == null || value.isEmpty) {
              return "Please enter ${widget.hintText?.toLowerCase() ?? 'this field'}";
            }
            if (widget.isEmail == true) {
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
        fontFamily: "Satoshi",
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1.5,
            color: widget.borderColor ?? BorderColors.primary,
          ),
        ),

        prefixIcon: widget.prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SvgPicture.asset(
            color: TextColors.neutral500,
            widget.prefixIcon! as String,
            width: 16.w,
            height: 16.w,
            colorFilter: const ColorFilter.mode(
              TextColors.neutral500,
              BlendMode.srcIn,
            ),
          ),
        )
            : null,


        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1,
            color: BorderColors.tertiary, // don't use widget.borderColor here
          ),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1,
            color: BorderColors.disabled, // separate color
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: BorderColors.error),
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
          onTap: toggle,
          child: _suffixIcon(
            obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        )
            : widget.suffixSvgAsset != null
            ? Padding(
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
        )
            : widget.suffixIcon,

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: BorderColors.error, width: 2),
        ),

        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.contentPaddingHorizontal ?? 8.w,
          vertical: widget.contentPaddingVertical ?? 12.w,
        ),
        fillColor: widget.filColor,
        prefixIconColor: TextColors.neutral900,

        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: TextColors.secondary,
        ),
      ),
    );
  }

  _suffixIcon(IconData icon) {
    return Padding(padding: const EdgeInsets.all(10.0), child: Icon(icon));
  }
}
