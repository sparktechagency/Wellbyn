import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/custombutton/custom_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/nab_ids.dart';
import '../../../base/iconsTextbutton/icon_text_button.dart';
class AddInsurance extends StatelessWidget {
   AddInsurance({super.key});

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Appcolors.page,
        appBar: AppBar(
          backgroundColor: Appcolors.page,
          title: Text(
            "Add New Insurance Info",
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabeledTextField(
                  maxline: 1,
                  borderColor: TextColors.neutral900,
                  label: "Insurance Provider",
                  controller: name,
                  hintText: "Enter insurance name",
                ),
                SizedBox(height: 20),
                LabeledTextField(
                  maxline: 1,
                  borderColor: TextColors.neutral900,
                  label: "Phone ",
                  controller: name,
                  hintText: "Enter phone numbor",
                ),
                SizedBox(height: 20),
                LabeledTextField(
                  maxline: 1,
                  borderColor: TextColors.neutral900,
                  label: "Group numbor",
                  controller: name,
                  hintText: "Enter groud numbor",
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: LabeledTextField(
                        maxline: 1,
                        borderColor: TextColors.neutral900,
                        label: "Effective Date",
                        controller: name,
                        suffixSvgAsset: AppIcons.calenderIcon01,
                        suffixSvgColor: TextColors.action,
                        hintText: "mm/dd/yyy",
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: LabeledTextField(
                        maxline: 1,
                        borderColor: TextColors.neutral900,
                        label: "Expiration Date",
                        controller: name,
                        suffixSvgAsset: AppIcons.calenderIcon01,
                        suffixSvgColor: TextColors.action,
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
                  hintText: "Enter Deductible ",
                ),
                SizedBox(height: 20),
                AppText(
                  "Insurance card",
                  fontSize: 16,
                  color: TextColors.neutral900,
                ),
                SizedBox(height: 8),
                IconTextButton(
             // isLoading: controller.isloading.value,
              width: 150,
              height: 40,
              text: "Upload card ",
              //lottieAsset: "assets/animations/loading.json",
              textColor: Appcolors.action,
              bordercolor: Appcolors.action,
              backgroundColor: Appcolors.primary,
              svgAsset: AppIcons.addIcon,
              onTap: () {
               // controller.loadDoctordetailesData();
                Get.toNamed("/add_insurance",id: NavIds.profilenav);

              },),
                SizedBox(height: 20),
                CustomButton(
             // isLoading: controller.isloading.value,
              text: "Save Change",
              height: 45,
              color: Appcolors.action,
              fontSize: 16,
              //lottieAsset: "assets/animations/loading.json",
              textColor: Appcolors.primary,
              onTap: () {
              //  controller.loadDoctordetailesData();
                Get.toNamed("/add_insurance",id: NavIds.profilenav);

              },),
              ],
            ),
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
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
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
      style: TextStyle(color: TextColors.neutral900, fontSize: 15,fontWeight: FontWeight.w400),
      decoration: InputDecoration(

        suffixIcon: widget.isPassword
            ? GestureDetector(
          onTap: toggle,
          child: _suffixIcon(
            obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        )
            : widget.suffixSvgAsset != null
            ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
          child: SvgPicture.asset(
            widget.suffixSvgAsset!,
            width: 15.w,
            height: 15.w,
            colorFilter: ColorFilter.mode(
              widget.suffixSvgColor ?? TextColors.neutral900,
              BlendMode.srcIn,
            ),
          ),
        )
            : widget.suffixIcon,

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
          fontSize: 16.sp,
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
  final Color? borderColor;
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
    this.borderColor,
    this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          fontSize: 16,
          color: TextColors.neutral900,
        ),
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
          borderColor: borderColor,
          maxLines: maxline,
        ),
      ],
    );
  }
}
