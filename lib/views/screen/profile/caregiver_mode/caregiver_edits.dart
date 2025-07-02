import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:wellbyn/controllers/caregiver_controller.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/nab_ids.dart';
import 'package:wellbyn/views/base/custom_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../base/app_text.dart';
import '../../../base/icon_text_button.dart';

class CaregiverEdits extends StatelessWidget {
  CaregiverEdits({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController names = TextEditingController();
  final CaregiverController caregiverController = Get.put(CaregiverController());

  List<String> item= ["Father","Mother","Brother","Sistar","other"];
  List<String> items= ["Partial controll ","Full access","Sub access",];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Caregiver Mode",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              LabeledTextField(
                maxline: 1,
                borderColor: TextColors.neutral900,
                label: "Name ",
                controller: names,
                hintText: "name",

              ),
              SizedBox(height: 20),
              Obx(() => LabeledDropdownField(
                label: "Relation",
                items: item,
                selectedValue: caregiverController.selectedValue.value.isEmpty
                    ? null
                    : caregiverController.selectedValue.value,
                onChanged: (value) {
                  caregiverController.selectedValue(value);
                },
              )),


              // LabeledTextField(
              //   maxline: 1,
              //   borderColor: TextColors.neutral900,
              //   label: "Relation ",
              //   controller: names,
              //   suffixSvgAsset: AppIcons.arrowdwonIcon,
              //   hintText: "Father",
              //   readOnly: true,
              //   onTap: () {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return Dialog(
              //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              //           shadowColor: TextColors.neutral200,
              //           child: Padding(
              //             padding: const EdgeInsets.all(16.0),
              //             child: Column(
              //               mainAxisSize: MainAxisSize.min, // Important to wrap content
              //               children: const [
              //
              //
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
              SizedBox(height: 20),

              LabeledTextField(
                maxline: 1,
                borderColor: TextColors.neutral500,
                label: "Date of birth ",
                controller: name,
                readOnly: true,
                onTap: () {
                  // Use custom date picker instead
                  showCustomDatePicker(
                    context: context,
                    onDateSelected: (DateTime selectedDate) {
                      String formattedDate = DateFormat(
                        'MM/dd/yyyy',
                      ).format(selectedDate);
                      name.text = formattedDate;
                    },
                  );
                },
                suffixSvgAsset: AppIcons.calenderIcon01,
                suffixSvgColor: Appcolors.action,
                hintText: "mm/dd/yyyy",
              ),

              SizedBox(height: 20),

              LabeledTextField(
                maxline: 1,
                borderColor: TextColors.neutral900,
                label: "Email ",
                controller: names,
                hintText: "name@gmail.com",
              ),
              SizedBox(height: 20),
              LabeledTextField(
                maxline: 1,
                borderColor: TextColors.neutral900,
                label: "Phone ",
                keyboardType: TextInputType.number,
                controller: names,
                hintText: "+00184545",
              ),
              SizedBox(height: 20),
              Obx(() => LabeledDropdownField(
                label: "Permission",
                items: items,
                selectedValue: caregiverController.selectedControll.value.isEmpty
                    ? null
                    : caregiverController.selectedControll.value,
                onChanged: (value) {
                  caregiverController.selectedControll(value);
                },
              )),
              SizedBox(height: 5,),
              Text(
                style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontFamily: "Satoshi",color: TextColors.neutral500),
                "Sensitive information such as patient names, email addresses, passwords, and similar data cannot be changed.",
              ),
              SizedBox(height: 40),

              CustomButton(
                height: 48,
                fontSize: 16,
                textColor: Appcolors.primary,
                broderColor: Appcolors.action,
                color: Appcolors.action,
                text: "Save and change",
                onTap: () {
                  print("click here ");
                  // Get.toNamed("/caregiver_edits", id: NavIds.profilenav);
                },
              ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldes extends StatefulWidget {
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

  const CustomTextFieldes({
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
  State<CustomTextFieldes> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFieldes> {
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
                  vertical: 12,
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

class LabeledTextField extends StatelessWidget {
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

  const LabeledTextField({
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
        CustomTextFieldes(
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

class CustomDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime) onDateSelected;
  final Color primaryColor;
  final Color backgroundColor;

  const CustomDatePicker({
    Key? key,
    this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
    this.primaryColor = Colors.blue,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime selectedDate;
  late DateTime displayedMonth;
  bool showYearPicker = false;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
    displayedMonth = DateTime(selectedDate.year, selectedDate.month);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with month/year navigation
          _buildHeader(),
          SizedBox(height: 16),

          // Show either year picker or calendar
          if (showYearPicker)
            _buildYearPicker()
          else ...[
            // Weekday labels
            _buildWeekdayLabels(),
            SizedBox(height: 8),
            // Calendar grid
            _buildCalendarGrid(),
          ],

          SizedBox(height: 16),
          // Action buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: showYearPicker
              ? null
              : () {
                  setState(() {
                    displayedMonth = DateTime(
                      displayedMonth.year,
                      displayedMonth.month - 1,
                    );
                  });
                },
          icon: Icon(
            Icons.chevron_left,
            color: showYearPicker ? Colors.grey : widget.primaryColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              showYearPicker = !showYearPicker;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: showYearPicker
                  ? widget.primaryColor.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "${_getMonthName(displayedMonth.month)} ${displayedMonth.year}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.primaryColor,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: showYearPicker
              ? null
              : () {
                  setState(() {
                    displayedMonth = DateTime(
                      displayedMonth.year,
                      displayedMonth.month + 1,
                    );
                  });
                },
          icon: Icon(
            Icons.chevron_right,
            color: showYearPicker ? Colors.grey : widget.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildYearPicker() {
    int currentYear = DateTime.now().year;
    int startYear = widget.firstDate.year;
    int endYear = widget.lastDate.year;

    return Container(
      height: 200,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: endYear - startYear + 1,
        itemBuilder: (context, index) {
          int year = startYear + index;
          bool isSelected = year == displayedMonth.year;
          bool isCurrentYear = year == currentYear;

          return GestureDetector(
            onTap: () {
              setState(() {
                displayedMonth = DateTime(year, displayedMonth.month);
                showYearPicker = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? widget.primaryColor : Colors.transparent,
                border: isCurrentYear
                    ? Border.all(color: widget.primaryColor)
                    : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  year.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWeekdayLabels() {
    final weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      children: weekdays.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth = DateTime(
      displayedMonth.year,
      displayedMonth.month + 1,
      0,
    ).day;
    final firstDayOfMonth = DateTime(
      displayedMonth.year,
      displayedMonth.month,
      1,
    );
    final firstWeekday = firstDayOfMonth.weekday % 7;

    List<Widget> dayWidgets = [];

    // Empty cells for days before the first day of the month
    for (int i = 0; i < firstWeekday; i++) {
      dayWidgets.add(Container());
    }

    // Days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(displayedMonth.year, displayedMonth.month, day);
      final isSelected =
          date.day == selectedDate.day &&
          date.month == selectedDate.month &&
          date.year == selectedDate.year;
      final isToday =
          date.day == DateTime.now().day &&
          date.month == DateTime.now().month &&
          date.year == DateTime.now().year;

      dayWidgets.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = date;
            });
          },
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected ? widget.primaryColor : Colors.transparent,
              border: isToday ? Border.all(color: widget.primaryColor) : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: dayWidgets,
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel', style: TextStyle(color: Colors.grey.shade600)),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onDateSelected(selectedDate);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('Select'),
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}

// Updated helper function
void showCustomDatePicker({
  required BuildContext context,
  required Function(DateTime) onDateSelected,
  DateTime? initialDate,
}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: CustomDatePicker(
        initialDate: initialDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        primaryColor: Appcolors.action,
        backgroundColor: Appcolors.page,
        onDateSelected: onDateSelected,
      ),
    ),
  );
}

class CustomDropdownDialogs extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String> onChanged;

  const CustomDropdownDialogs({
    Key? key,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownDialogState createState() => _CustomDropdownDialogState();
}

class _CustomDropdownDialogState extends State<CustomDropdownDialogs> {
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
          title: Text('Select Relation',style: TextStyle(fontFamily:"Satoshi" ),),
          content: Container(
            width: 70,
            color: Appcolors.page,
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
                  tileColor: isSelected ? Appcolors.action.withOpacity(0.1) : null,
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openDialog,
      borderRadius: BorderRadius.circular(8),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: Appcolors.primary,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Appcolors.disabled),
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
                ? FontWeight.normal
                : FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class LabeledDropdownField extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const LabeledDropdownField({
    super.key,
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
        AppText(
          label,
          fontSize: 16,
          color: TextColors.neutral900,
        ),
        SizedBox(height: 6.h),
        CustomDropdownDialogs(
          items: items,
          selectedValue: selectedValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

// class CustomDropdownDialoges extends StatefulWidget {
//   final List<String> items;
//   final String? selectedValue;
//   final ValueChanged<String> onChanged;
//
//   const CustomDropdownDialoges({
//     Key? key,
//     required this.items,
//     this.selectedValue,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   _CustomDropdownDialogStates createState() => _CustomDropdownDialogStates();
// }
//
// class _CustomDropdownDialogStates extends State<CustomDropdownDialoges> {
//   String? _selectedValue;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedValue = widget.selectedValue;
//   }
//
//   void _openDialog() async {
//     final selected = await showDialog<String>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Appcolors.page,
//           title: Text('Select Relation',style: TextStyle(fontFamily:"Satoshi" ),),
//           content: Container(
//             width: 70,
//             color: Appcolors.page,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: widget.items.length,
//               itemBuilder: (context, index) {
//                 final item = widget.items[index];
//                 final isSelected = item == _selectedValue;
//                 return ListTile(
//                   title: Text(
//                     item,
//                     style: TextStyle(
//                       fontFamily: 'Satoshi',
//                       fontWeight: isSelected
//                           ? FontWeight.w700
//                           : FontWeight.w500,
//                       fontSize: 15,
//                       color: isSelected ? Appcolors.action : Colors.black,
//                     ),
//                   ),
//                   trailing: isSelected
//                       ? Icon(Icons.check, color: Appcolors.action, size: 20)
//                       : null,
//                   tileColor: isSelected ? Appcolors.action.withOpacity(0.1) : null,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   onTap: () {
//                     Navigator.pop(context, item);
//                   },
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//
//     if (selected != null) {
//       setState(() {
//         _selectedValue = selected;
//       });
//       widget.onChanged(selected);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: _openDialog,
//       borderRadius: BorderRadius.circular(8),
//       child: InputDecorator(
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Appcolors.primary,
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Appcolors.disabled),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.blue, width: 2),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.red),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Colors.redAccent, width: 2),
//           ),
//           suffixIcon: Padding(
//             padding: const EdgeInsets.all(12),
//             child: SvgPicture.asset(
//               AppIcons.arrowdwonIcon,
//               color: TextColors.neutral900,
//             ),
//           ),
//         ),
//         child: Text(
//           _selectedValue ?? 'Select state',
//           style: TextStyle(
//             color: _selectedValue == null ? Colors.grey[600] : Colors.black,
//             fontWeight: _selectedValue == null
//                 ? FontWeight.normal
//                 : FontWeight.w300,
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }
// }
