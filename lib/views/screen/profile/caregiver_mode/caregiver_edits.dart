import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:wellbyn/controllers/caregivermode/caregiver_controller.dart';
import 'package:wellbyn/controllers/profile_setting/personal_info.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/nab_ids.dart';
import 'package:wellbyn/views/base/custombutton/custom_button.dart';
import '../../../../controllers/TextField/textfield_Controller.dart';
import '../../../../controllers/profile_setting_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../base/Apptext/app_text.dart';
import '../../../base/LabelTextField/labelTextField.dart';
import '../../../base/LableDropDownFielded/lableDropDownFielded.dart';
import '../../../base/iconsTextbutton/icon_text_button.dart';

class CaregiverEdits extends StatelessWidget {
  CaregiverEdits({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController names = TextEditingController();
  final CaregiverController caregiverController = Get.put(CaregiverController());
  final DropdownController  dropdownController = Get.put(DropdownController());
  final OnboardingProfileInfo _controller = Get.put(OnboardingProfileInfo(),);
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              LabeledTextFielded(
                maxline: 1,
                borderColor: TextColors.neutral900,
                label: "Name ",
                controller: names,
                hintText: "Name",

              ),
              SizedBox(height: 20),
              LabeledDropdownFielded(
                label: "Relation",
                titile: "Relation",
                items: item,
                selectedValue: dropdownController.relationShip,
                onChanged: (value) {
                  // Optional additional logic
                  print("Selected: $value");
                },
              ),

              SizedBox(height: 20),

              Obx(() => LabeledTextFielded(
                maxline: 1,
                borderColor: Appcolors.primary,
                label: "Date of birth ",
                controller: TextEditingController(
                  text: _controller.formattedDate.value,
                ),
                readOnly: true,
                onTap: () => _controller.pickDate(Get.context!),
                suffixSvgAsset: AppIcons.calenderIcon01,
                suffixSvgColor: Appcolors.action,
                hintText: "mm/dd/yyyy",
              ),),

              SizedBox(height: 20),

              LabeledTextFielded(
                maxline: 1,
                borderColor: TextColors.neutral900,
                label: "Email ",
                controller: names,
                hintText: "name@gmail.com",
              ),
              SizedBox(height: 20),
              LabeledTextFielded(
                maxline: 1,
                borderColor: TextColors.neutral900,
                label: "Phone ",
                keyboardType: TextInputType.number,
                controller: names,
                hintText: "+00184545",
              ),
              SizedBox(height: 20),
              LabeledDropdownFielded(
                label: "Permission",
                titile: "Permisson",
                items: items,
                selectedValue: dropdownController.selectedValuePermission,
                onChanged: (value) {
                  // Optional additional logic
                  print("Selected: $value");
                },
              ),
              SizedBox(height: 5,),
              Text("Sensitive information such as patient names, email addresses, passwords, and similar data cannot be changed.",style: TextStyle(
                fontSize: 14.sp,
                letterSpacing: 0.2,
                fontWeight: FontWeight.w500,
                color: TextColors.neutral500,),),
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


