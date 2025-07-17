import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/custom_button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/nab_ids.dart';
import '../../base/Apptext/app_text.dart';
import '../../base/icon_text_button.dart';

class AddInsurance extends StatelessWidget {
  AddInsurance({super.key});

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Add new insuranc info ",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back(id: NavIds.profilenav);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              LabeledTextField(
                borderColor: TextColors.neutral900,
                label: "Insurance Provider",
                controller: name,
                maxline: 1,
                hintText: "Enter insurance name",
              ),
              SizedBox(height: 20),
              LabeledTextField(
                borderColor: TextColors.neutral900,
                label: "Insurance Provider",
                controller: name,
                maxline: 1,
                hintText: "Enter insurance name",
              ),
              SizedBox(height: 20),
              LabeledTextField(
                borderColor: TextColors.neutral900,
                label: "Insurance Provider",
                controller: name,
                maxline: 1,
                hintText: "Enter insurance name",
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: LabeledTextField(
                      label: "Effective Date",
                      controller: name,
                      maxline: 1,
                      suffixSvgAsset: AppIcons.calenderIcon01,
                      suffixSvgColor: Appcolors.action,

                      hintText: "mm/dd/yyyy",
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: LabeledTextField(
                      label: "Expiration Date",
                      suffixSvgAsset: AppIcons.calenderIcon01,
                      suffixSvgColor: Appcolors.action,
                      controller: name,
                      maxline: 1,
                      hintText: "mm/dd/yyyy",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              LabeledTextField(
                borderColor: TextColors.neutral900,
                label: "Deductible",
                controller: name,
                maxline: 1,
                hintText: "G987654321",
              ),
              SizedBox(height: 20),

              AppText(
                "Insurance card",
                fontSize: 16,
                color: TextColors.neutral900,
              ),
              SizedBox(height: 12.h),
              IconTextButton(
                // isLoading: controller.isLoading.value,
                text: "Upload card",
                svgAsset: AppIcons.addIcon,
                backgroundColor: Appcolors.primary,
                textColor: Appcolors.action,
                bordercolor: Appcolors.action,
                height: 40,
                width: 145,
                onTap: () {
                  // Your logic
                  print("Button tapped");
                  // controller.startLoading();
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                onTap: () {},
                text: "Save Change",
                broderColor: Colors.transparent,
                color: TextColors.action,
                fontSize: 16,
                textColor: Appcolors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFielde extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final Color? borderColor;
  final String? obscure;
  final Color? filColor;
  final Widget? prefixIcon;
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

  const CustomTextFielde({
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
    this.suffixSvgAsset,
    this.suffixSvgColor,
    this.onTap,
    this.readOnly,
  });

  @override
  State<CustomTextFielde> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFielde> {
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
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1.5,
            color: widget.borderColor ?? BorderColors.primary,
          ),
        ),

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
          horizontal: widget.contentPaddingHorizontal ?? 10.w,
          vertical: widget.contentPaddingVertical ?? 12.w,
        ),
        fillColor: widget.filColor,
        prefixIconColor: TextColors.neutral900,

        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: TextColors.secondary,
        ),
      ),
    );
  }

  _suffixIcon(IconData icon) {
    return Padding(padding: const EdgeInsets.all(10.0), child: Icon(icon));
  }
}

class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final bool? isEmail;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
  final Widget? prefixIcon;
  final Color? borderColor; // Add this
  final int? maxline;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.isEmail,
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
        CustomTextFielde(
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
          borderColor: borderColor, // Pass borderColor here
        ),
      ],
    );
  }
}
