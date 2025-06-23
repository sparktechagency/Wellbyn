import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/doctor/book_report.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/doctor/doctor.dart';

import '../../../utils/nab_ids.dart';
class DoctorDetails extends StatelessWidget {
  final VoidCallback? onBack;
  final String doctorId;

   DoctorDetails({super.key, this.onBack, required this.doctorId, });
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          SizedBox(
            height: screenHeight / 3,
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/image/doctor_image.png",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    onPressed: () {
                    Get.back(id: NavIds.profile);
                      },
                      icon: SvgPicture.asset(
                         'assets/icons/arrow-left.svg',
                           width: 30.w,
                           height: 30.h,
                        color: Colors.white,
                       ),
                    ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.white),
                    onPressed: () {
                      Get.toNamed('/book_report',
                          id: NavIds.profile);
                    },
                  ),
                ),
              ],
            ),
          ),

          // Bottom info & scrollable section - 2/3 of screen height
          Expanded(
            child: SizedBox(
              height: screenHeight * 2 / 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                    )
                  ],
                ),
                 child: SingleChildScrollView(
                   child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Container(height: 5, width: 40, color: Colors.grey[300])),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Dr. Moule Marrk", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Satoshi')),
                                Text("Cardiology", style: TextStyle(color: TextColors.neutral500, fontFamily: 'Satoshi')),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: TextColors.primary500,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      height: 25,
                                      width: 25,
                                      AppIcons.chatIcon,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Appcolors.secondary,
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.blue,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      height: 25,
                                      width: 25,
                                      color: Appcolors.action,
                                      AppIcons.shearIcon,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.hospitallocationIcon, color: Colors.blue),
                            SizedBox(width: 4),
                            Text(
                              "Sylhet Health Center",
                              style: TextStyle(
                                  color: TextColors.neutral500,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Satoshi',
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "Calle Ceiba #142, Urb. Alturas de Monte Verde, Trujillo Alto, PR 00976",
                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 20),

                        DateTimePickerSection(),
            
            
            
                                 ],
                    ),
                 ),
                ),
            
            ),
          ),
        ],
      ),
    );
  }

}


class DateTimePickerSection extends StatefulWidget {

  final void Function(DateTime? date, String? time)? onSelectionChanged;

  const DateTimePickerSection({Key? key, this.onSelectionChanged}) : super(key: key);

  @override
  State<DateTimePickerSection> createState() => _DateTimePickerSectionState();
}

class _DateTimePickerSectionState extends State<DateTimePickerSection> {
  DateTime currentMonth = DateTime.now();
  DateTime? selectedDate;
  String? selectedTime;

  List<String> timeSlots = [
    '11:45 am',
    '2:15 pm',
    '4:30 am',
    '6:20 pm',
    '10:05 pm',
    '7:00 pm',
    '1:55 am',
  ];

  @override
  void initState() {
    super.initState();
    // Auto-select today's date:
    selectedDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    widget.onSelectionChanged?.call(selectedDate, selectedTime); // optional callback
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Select your date ", style: TextStyle(fontWeight: FontWeight.w500,  fontFamily: 'Satoshi',
                    fontSize: 20,)),
                  Spacer(),
                  buildMonthNavigation(),
                ],
              ),
            ),
          ),

          SizedBox(height: 8),
          buildCalendarGrid(),
          SizedBox(height: 24),
          buildTimeSlots(),
          SizedBox(height: 24),

        ],
    );
  }


  Widget buildMonthNavigation() {
    final displayedMonth = "${getMonthName(currentMonth.month)} ${currentMonth.year}";

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: BorderColors.secondary,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => setState(() {
              currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
            }),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Appcolors.action,
              size: 16, // control the icon size
            ),
          ),
        ),

         SizedBox(width: 10,),
        Text(displayedMonth, style: Theme.of(context).textTheme.bodySmall),

        SizedBox(width: 10,),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: BorderColors.secondary,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => setState(() {
              currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
            }),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Appcolors.action,
              size: 16, // control the icon size
            ),
          ),
        ),

      ],
    );
  }

  Widget buildCalendarGrid() {

    int daysInMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
    List<DateTime> days = List.generate(
      daysInMonth,
          (i) => DateTime(currentMonth.year, currentMonth.month, i + 1),
    );

    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: days.map((date) {
        final isSelected = selectedDate == date;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = date;
            });
            // ✅ Call the callback
            widget.onSelectionChanged?.call(selectedDate, selectedTime);
          },
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? Appcolors.action: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              date.day.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildTimeSlots() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: timeSlots.map((time) {
        final isSelected = selectedTime == time;
        return ChoiceChip(
          clipBehavior: Clip.antiAlias,
          label: Text(
            time,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontSize: 14,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          selected: isSelected,
          selectedColor: TextColors.primary,
          backgroundColor: Appcolors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(width: 0, color: Colors.transparent),
          ),

          elevation: 0,         // flat chip
          pressElevation: 0,     // flat when pressed too
          onSelected: (_) {
            setState(() => selectedTime = time);
            widget.onSelectionChanged?.call(selectedDate, selectedTime);
          },
        );
      }).toList(),
    );
  }

  String getMonthName(int m) {
    return const [
      "", "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
    ][m];
  }
}

