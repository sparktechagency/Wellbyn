import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/controllers/profile_setting_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_icons.dart';
import '../../base/app_text.dart';
import '../profile/caregiver_mode/caregiver_edits.dart'; // You should define your color constants here

enum Gender { male, female, other }

class SettingPersonalInfo extends StatelessWidget {
  SettingPersonalInfo({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  ProfileSettingContrller _contrller = Get.put(ProfileSettingContrller());

  List<String> bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
  String? selectedGender;

  List<String> marital = [
    "Single",
    "Marride",
    "Divorced",
    "Widowed",
    "Separated",
    "Unknown",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Profile Settings",
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
            Get.back();
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              //--------------uper row
              Row(
                children: [
                  _buildStep(isActive: true, step: '1'),
                  _buildLine(),
                  _buildStep(isActive: false, step: '2'),
                  _buildLine(),
                  _buildStep(isActive: false, step: '3'),
                ],
              ),
              SizedBox(height: 8),
              //_________________________________________________
              Row(
                children: [
                  SizedBox(
                    width: 46.w,
                    child: Center(
                      child: Text(
                        "Step ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: TextColors.neutral500,
                          fontFamily: "Satoshi",
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    width: 46.w,
                    child: Center(
                      child: Text(
                        "Step ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: TextColors.neutral500,
                          fontFamily: "Satoshi",
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    width: 46.w,
                    child: Center(
                      child: Text(
                        "Step ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: TextColors.neutral500,
                          fontFamily: "Satoshi",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              //_________________________________________________
              Row(
                children: [
                  SvgPicture.asset(AppIcons.settingIcon),
                  SizedBox(width: 6),
                  AppText(
                    "Patient Information",
                    fontSize: 18,
                    color: TextColors.neutral900,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                style: TextStyle(
                  fontSize: 14,
                  color: TextColors.neutral500,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.clip,
                "Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.",
              ),
              SizedBox(height: 25),

              _buildSectionContainer(
                title: "Personal Info",
                children: [
                  LabeledTextField(
                    borderColor: TextColors.neutral900,
                    label: "Full Name",
                    controller: name,
                    maxline: 1,
                    hintText: "First Name",
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFielde(
                          controller: name,
                          hintText: "Middle",
                          keyboardType: TextInputType.name,
                          maxLines: 1,
                          borderColor:
                              TextColors.neutral900, // Pass borderColor here
                        ),
                      ),
                      SizedBox(width: 8),

                      Expanded(
                        child: CustomTextFielde(
                          controller: name,
                          hintText: "Last",
                          keyboardType: TextInputType.name,
                          maxLines: 1,
                          borderColor:
                              TextColors.neutral900, // Pass borderColor here
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  Obx(() {
                    return LabeledTextFields(
                      maxline: 1,
                      borderColor: TextColors.neutral200,
                      label: "Date of birth ",
                      controller: TextEditingController(
                        text: _contrller.formattedDate.value,
                      ),
                      // 👈 Use reactive value
                      readOnly: true,
                      onTap: () {
                        _contrller.pickDate(context);
                      },
                      suffixSvgAsset: AppIcons.calenderIcon01,
                      suffixSvgColor: Appcolors.action,
                      hintText: "mm/dd/yyyy",
                    );
                  }),

                  SizedBox(height: 20),

                  _buildLabel("Sex"),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildGenderButton("Male"),
                        _buildGenderButton("Female"),
                        _buildGenderButton("Other"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  SizedBox(height: 20),

                  Obx(
                    () => LabeledDropdownFieldes(
                      titile: "Marital Status",
                      label: "Marital Status",
                      items: marital,
                      selectedValue: _contrller.selectedMarital.value.isEmpty
                          ? null
                          : _contrller.selectedMarital.value,
                      onChanged: (value) {
                        _contrller.selectecMarital(value);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => LabeledDropdownFieldes(
                      titile: "Boold Group Selected ",
                      label: "Blood Group",
                      items: bloodGroups,
                      selectedValue: _contrller.selectedMarital.value.isEmpty
                          ? null
                          : _contrller.selectedMarital.value,
                      onChanged: (value) {
                        _contrller.selectecMarital(value);
                      },
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Text("Number of Children",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: TextColors.neutral900,fontFamily: "Satoshi"),),
                      Text(" (optional)",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: TextColors.neutral500,fontFamily: "Satoshi"),),
                    ],
                  ),
                  SizedBox(height: 8,),
                  CustomTextFielde(
                    borderColor: TextColors.neutral900,

                    controller: name,
                    hintText: "0",
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),

              //======= divided by all 
              const SizedBox(height: 20),
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),
// --------------------------------------------------------------
              _buildSectionContainer(
                  title: "Contact info",
                  children: [

                 LabeledTextField(
                  borderColor: TextColors.neutral900,
                  label: "Email",
                  controller: name,
                  maxline: 1,
                  hintText: "name@gmail.com",
                ),
                SizedBox(height: 20,),
                LabeledTextField(
                  borderColor: TextColors.neutral900,
                  label: "Phone",
                  controller: name,
                  keyboardType: TextInputType.number,
                  maxline: 1,
                  hintText: "+02154555585",
                ),

              ]),



              //======= divided by all
              const SizedBox(height: 20),
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),
// --------------------------------------------------------------
              _buildSectionContainer(
                  title: "Address",
                  children: [
                    LabeledTextField(
                      borderColor: TextColors.neutral900,
                      label: "Address Line 1",
                      controller: name,
                      maxline: 1,
                      hintText: "Street address",
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Address Line 2 ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: TextColors.neutral900,fontFamily: "Satoshi"),),
                        Text(" (optional)",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: TextColors.neutral500,fontFamily: "Satoshi"),),
                      ],
                    ),

                    SizedBox(height: 8,),

                    CustomTextFielde(
                      borderColor: TextColors.neutral900,
                      controller: name,
                      hintText: "Apartment, suite, unit, etc.",
                      keyboardType: TextInputType.text,
                    ),

                    SizedBox(height: 20,),
                    // Replace your existing address row section with this fixed version

                    Row(
                      children: [
                        // City Text Field
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText("City", fontSize: 16, color: TextColors.neutral900),
                              SizedBox(height: 8.h),
                              CustomTextFieldeses(
                                borderColor: TextColors.neutral900,
                                controller: name,
                                hintText: "City",
                                keyboardType: TextInputType.text,
                                contentPaddingVertical: 12, // Consistent padding
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),

                        // State Dropdown Field
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText("State", fontSize: 16, color: TextColors.neutral900),
                              SizedBox(height: 8.h),
                              CustomTextFieldeses(
                                suffixSvgAsset: AppIcons.arrowdwonIcon,
                                borderColor: TextColors.neutral200,
                                readOnly: true,
                                controller: name,
                                maxLines: 1,
                                //hintText: "state",
                                contentPaddingVertical: 12, // Consistent padding
                                onTap: () {
                                  // Add your state selection logic here
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 8.w),

                        // ZIP Text Field
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText("ZIP", fontSize: 16, color: TextColors.neutral900),
                              SizedBox(height: 8.h),
                              CustomTextFieldeses(
                                borderColor: TextColors.neutral900,
                                controller: name,
                                hintText: "ZIP code",
                                keyboardType: TextInputType.number,
                                contentPaddingVertical: 12, // Consistent padding
                              ),
                            ],
                          ),
                        ),
                      ],
                    )

                  ]),


              //======= divided by all
              const SizedBox(height: 20),
              Divider(height: 1, color: TextColors.neutral200),
              const SizedBox(height: 20),
// --------------------------------------------------------------




            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton(String label) {

    return Obx(() {
      bool isSelected = _contrller.selectedGender.value == label;
      return GestureDetector(
        onTap: () => _contrller.selectGender(label),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Appcolors.action),
              ),
              child: isSelected
                  ? Container(
                      height: 16,
                      width: 16,
                      margin: EdgeInsets.all(2.8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontFamily: "Satoshi",
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: "Satoshi",
      ),
    );
  }

  Widget _buildSectionContainer({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Appcolors.primary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Appcolors.secondary,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0.2, 0.2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            AppText(title, color: TextColors.neutral500),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  // Helper widget for step circle
  Widget _buildStep({required bool isActive, required String step}) {
    return Container(
      width: 46.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: isActive ? Appcolors.action : Colors.white,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        step,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: isActive ? Colors.white : TextColors.neutral900,
        ),
      ),
    );
  }

  // Helper widget for line between steps
  Widget _buildLine() {
    return Expanded(child: Container(height: 1, color: TextColors.neutral200));
  }
}

class CustomDropdownDialogss extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final String titile;
  final ValueChanged<String> onChanged;

  const CustomDropdownDialogss({
    Key? key,
    required this.items,
    this.selectedValue,
    required this.titile,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownDialogState createState() => _CustomDropdownDialogState();
}

class _CustomDropdownDialogState extends State<CustomDropdownDialogss> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  void _openDialog() async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Appcolors.page,
          title: Text(
            widget.titile,
            style: TextStyle(
              fontFamily: "Satoshi",
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Appcolors.page,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = item == _selectedValue;
                return ListTile(
                  title: Text(
                    item,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      fontSize: 15,
                      color: isSelected ? Appcolors.action : Colors.black,
                    ),
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check, color: Appcolors.action, size: 20)
                      : null,
                  tileColor: isSelected
                      ? Appcolors.action.withOpacity(0.1)
                      : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onTap: () {
                    Navigator.pop(context, item);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        _selectedValue = selected;
      });
      widget.onChanged(selected);
    }
  }

  // void _openDialog() async {
  //   final selected = await showDialog<String>(
  //     context: context,
  //     builder: (context) {
  //       return Dialog(
  //         child: SizedBox(
  //           width: 150,
  //           height: 500,
  //           child: AlertDialog(
  //             backgroundColor: Appcolors.page,
  //             title: Text(
  //               widget.titile,
  //               style: TextStyle(
  //                 fontFamily: "Satoshi",
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 16,
  //               ),
  //             ),
  //             content: Container(
  //               color: Appcolors.page,
  //               child: ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: widget.items.length,
  //                 itemBuilder: (context, index) {
  //                   final item = widget.items[index];
  //                   final isSelected = item == _selectedValue;
  //                   return ListTile(
  //                     title: Text(
  //                       item,
  //                       style: TextStyle(
  //                         fontFamily: 'Satoshi',
  //                         fontWeight: isSelected
  //                             ? FontWeight.w700
  //                             : FontWeight.w500,
  //                         fontSize: 15,
  //                         color: isSelected ? Appcolors.action : Colors.black,
  //                       ),
  //                     ),
  //                     trailing: isSelected
  //                         ? Icon(Icons.check, color: Appcolors.action, size: 20)
  //                         : null,
  //                     tileColor: isSelected
  //                         ? Appcolors.action.withOpacity(0.1)
  //                         : null,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     onTap: () {
  //                       Navigator.pop(context, item);
  //                     },
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //
  //   if (selected != null) {
  //     setState(() {
  //       _selectedValue = selected;
  //     });
  //     widget.onChanged(selected);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openDialog,
      borderRadius: BorderRadius.circular(8),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,

          fillColor: Appcolors.primary,
          contentPadding: EdgeInsets.only(left: 10,right: 15,top: 4,bottom: 4),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: TextColors.neutral200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.redAccent, width: 2),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              AppIcons.arrowdwonIcon,
              color: TextColors.neutral900,
            ),
          ),
        ),
        child: Text(
          _selectedValue ?? 'Select state',
          style: TextStyle(
            color: _selectedValue == null ? Colors.grey[600] : Colors.black,
            fontWeight: _selectedValue == null
                ? FontWeight.w600
                : FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class LabeledDropdownFieldes extends StatelessWidget {
  final String label;
  final String titile;
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const LabeledDropdownFieldes({
    super.key,
    required this.titile,
    required this.label,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(label, fontSize: 16, color: TextColors.neutral900),
        SizedBox(height: 6.h),
        CustomDropdownDialogss(
          items: items,
          titile: titile,
          selectedValue: selectedValue,
          onChanged: onChanged,
        ),
      ],
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
        fontSize: 15,
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
          fontWeight: FontWeight.w500,
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

class CustomTextFieldeses extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final VoidCallback? onTap;
  final bool? readOnly;
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
  final int? height;

  const CustomTextFieldeses({
    super.key,
    this.suffixSvgAsset,
    this.onTap,
    this.readOnly,
    this.suffixSvgColor,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.hintText,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
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
  State<CustomTextFieldeses> createState() => _CustomTextFieldStates();
}

class _CustomTextFieldStates extends State<CustomTextFieldeses> {
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
        fontSize: 15,
        fontFamily: "Satoshi",
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        isDense: true,
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
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.contentPaddingHorizontal ?? 8.w,
          vertical:
              widget.contentPaddingVertical ?? 6.h, // reduced vertical padding
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 9,
                ),
                child: SvgPicture.asset(
                  widget.suffixSvgAsset!,
                  width: 18.w,
                  height: 18.w,
                  colorFilter: ColorFilter.mode(
                    widget.suffixSvgColor ?? TextColors.neutral900,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : widget.suffixIcon,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: BorderColors.error),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: BorderColors.error, width: 2),
        ),

        fillColor: widget.filColor,
        prefixIconColor: TextColors.neutral900,

        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w500,
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

class LabeledTextFields extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final Color? borderColor;
  final int? maxline;
  final bool isPassword;
  final bool? isEmail;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? suffixSvgAsset;
  final Color? suffixSvgColor;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final bool? readOnly;
  final bool? enabled;

  const LabeledTextFields({
    super.key,
    this.borderColor,
    required this.label,
    this.maxline,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.isEmail,
    this.keyboardType,
    this.suffixIcon,
    this.suffixSvgAsset,
    this.suffixSvgColor,
    this.onTap,
    this.enabled,
    this.readOnly,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          //fontWeight: FontWeight.w500,
          fontSize: 16,
          color: TextColors.neutral900,
        ),
        SizedBox(height: 6.h),
        CustomTextFieldeses(
          enabled: enabled,
          controller: controller,
          hintText: hintText,
          isPassword: isPassword,
          isEmail: isEmail,
          keyboardType: keyboardType,
          suffixIcon: suffixIcon,
          suffixSvgAsset: suffixSvgAsset,
          suffixSvgColor: suffixSvgColor,
          prefixIcon: prefixIcon,
          contentPaddingVertical: 12,
          borderColor: borderColor,
          maxLines: maxline,
          readOnly: readOnly,
          onTap: onTap,
        ),
      ],
    );
  }
}
