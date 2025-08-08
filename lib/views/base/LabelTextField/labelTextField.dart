import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
  final Color? borderColor;
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
    this.next = false,
    this.keyboardType,
    this.suffixIcon,
    this.suffixSvgAsset,
    this.suffixSvgColor,
    this.prefixIcon,
    this.maxline,
    this.onTap,
    this.readOnly,
    this.borderColor,
    this.autovalidateMode,
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
          borderColor: borderColor,
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
  late FocusNode _focusNode;

  bool _hasTyped = false; // Only true when user has actually typed something
  bool _hasError = false;
  bool _isValid = false;
  bool _shouldShowError = false; // Controls when to show error visually
  bool _hasTapped = false; // Track if field has been tapped

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
    _focusNode = FocusNode();

    // Setup validator function
    final validator = widget.validator ?? defaultValidator;

    // Initial validation check
    final text = widget.controller.text.trim();
    final error = validator(text) != null;
    _isValid = text.isNotEmpty && !error;
    _hasError = false; // Start with no visual error
    _shouldShowError = false;

    // Listen to controller changes
    widget.controller.addListener(() {
      final text = widget.controller.text.trim();
      final error = validator(text) != null;
      final valid = text.isNotEmpty && !error;

      setState(() {
        _isValid = valid;

        // Show error only when field has been typed in and is now empty and unfocused
        if (_hasTyped && text.isEmpty && !_focusNode.hasFocus) {
          _shouldShowError = true;
          _hasError = true;
        }
        // Hide error when user enters valid text
        else if (text.isNotEmpty && !error) {
          _shouldShowError = false;
          _hasError = false;
        }
        // Keep error visible if text is still invalid
        else if (_hasTyped && text.isNotEmpty && error) {
          _shouldShowError = true;
          _hasError = true;
        }
      });
    });

    // Handle focus changes
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // Field lost focus - reset tap state
        setState(() {
          _hasTapped = false;
        });

        if (_hasTyped) {
          final text = widget.controller.text.trim();
          if (text.isEmpty) {
            setState(() {
              _shouldShowError = true;
              _hasError = true;
            });
          }
        }
      }
      setState(() {});
    });

  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _controllerListener() {
    final validator = widget.validator ?? defaultValidator;
    final text = widget.controller.text.trim();
    final error = validator(text) != null;
    final valid = text.isNotEmpty && !error;

    if (mounted) {
      setState(() {
        _isValid = valid;
        if (_hasTyped && text.isEmpty && !_focusNode.hasFocus) {
          _shouldShowError = true;
          _hasError = true;
        } else if (text.isNotEmpty && !error) {
          _shouldShowError = false;
          _hasError = false;
        } else if (_hasTyped && text.isNotEmpty && error) {
          _shouldShowError = true;
          _hasError = true;
        }
      });
    }
  }

  String? _validate(String? value) {
    // Always return the actual validation result for form validation
    final error = widget.validator?.call(value) ?? defaultValidator(value);

    // But update visual error state based on user interaction
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && error != null) {
        setState(() {
          _shouldShowError = true;
          _hasError = true;
          _hasTyped = true; // Form validation means user tried to submit
        });
      }
    });

    return error;
  }

  FormFieldValidator<String> get defaultValidator => (val) {
    if (val == null || val.isEmpty) {
      return "Please enter ${widget.hintText?.toLowerCase() ?? 'this field'}";
    }
    if (widget.isEmail == true && !AppConstants.emailValidator.hasMatch(val)) {
      return "Please enter a valid email";
    }
    return null;
  };

  void togglePassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {

    final bool hasFocus = _focusNode.hasFocus;
    final bool hasText = widget.controller.text.trim().isNotEmpty;


    final bool showShadow = (!hasFocus && !_hasTyped && !_hasTapped && !hasText) ||
        (_isValid && !hasFocus && hasText);


    final Color backgroundColor = showShadow
        ? (widget.filColor ?? Colors.white)
        : Colors.transparent;


    Widget? cachedPrefixIcon;
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

    Widget? cachedSuffixIcon;
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

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: showShadow
                ? [
              BoxShadow(
                color: ShadowColor.shadowColors1.withOpacity(0.10),
                blurRadius: 4,
                spreadRadius: 0,
                offset: const Offset(0, 3),
              ),
            ]
                : [],
          ),
          child: TextFormField(
            focusNode: _focusNode,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? obscureText : false,
            obscuringCharacter: widget.obscure ?? '*',
            readOnly: widget.readOnly ?? false,
            enabled: widget.enabled ?? true,
            autovalidateMode:
            widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
            textInputAction: widget.next
                ? TextInputAction.next
                : TextInputAction.done,
            maxLines: widget.isPassword ? 1 : widget.maxLines,
            cursorColor: TextColors.neutral900,
            onTap: () {
              // Mark as tapped when user taps - this removes white background
              if (!_hasTapped) {
                setState(() {
                  _hasTapped = true;
                });
              }
              widget.onTap?.call();
            },
            onChanged: (value) {
              // Mark as typed when user actually enters text
              if (!_hasTyped && value.trim().isNotEmpty) {
                setState(() {
                  _hasTyped = true;
                });
              }

              // Only hide error when user enters VALID text
              final trimmedValue = value.trim();
              if (trimmedValue.isNotEmpty) {
                final error = (widget.validator?.call(trimmedValue) ?? defaultValidator(trimmedValue)) != null;
                if (!error && _shouldShowError) {
                  setState(() {
                    _shouldShowError = false;
                    _hasError = false;
                  });
                }
              }

              widget.onChanged?.call(value);
            },
            validator: _validate,
            style: const TextStyle(
              letterSpacing: 0.2,
              color: TextColors.neutral900,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: backgroundColor,
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
              prefixIcon: cachedPrefixIcon,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                onTap: togglePassword,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    obscureText ? AppIcons.viewIcon : AppIcons.viewIcon,
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
              disabledBorder: enabledBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder,
            ),
          ),
        ),
      ],
    );
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
    borderSide: const BorderSide(width: 0, color: Colors.transparent),
  );

  OutlineInputBorder get errorBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: BorderColors.error),
  );

  OutlineInputBorder get focusedErrorBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: BorderColors.error, width: 1.1),
  );
}