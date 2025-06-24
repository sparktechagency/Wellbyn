import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/doctor/book_report.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/doctor/doctor.dart';

import '../../../controllers/date_picker_controller.dart';
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
      body: Stack(
        children: [
          Column(
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
                      left: 15,
                      child: GestureDetector(
                        onTap: (){

                          Get.back(id: NavIds.profile);

                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Appcolors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // child: IconButton(
                          //   onPressed: () {
                          //     Get.back(id: NavIds.profile);
                          //   },
                           child: SvgPicture.asset(
                              'assets/icons/arrow-left.svg',
                              width: 30.w,
                              height: 30.h,
                              color: Colors.black,
                            ),
                          ),
                      ),
                    ),

                    Positioned(
                      top: 40,
                      right: 15,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Appcolors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // child: IconButton(
                        //   onPressed: () {
                        //     Get.back(id: NavIds.profile);
                        //   },
                        child: SvgPicture.asset(
                          AppIcons.heartIcon,
                          width: 15,
                          height: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom info & scrollable section - 2/3 of screen heigh
            ],
          ),

          Expanded(
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(top: 260.h),
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
                      Row(
                        children: [
                          // Waitlist Button (Outlined)

                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: SvgPicture.asset(AppIcons.alarmIcon, color: Colors.blue),
                              label: Text(
                                "Waitlist",
                                style: TextStyle(fontFamily: 'Satoshi', color: Colors.blue),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.blue),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10), // vertical padding only
                              ),
                            ),
                          ),

                          const SizedBox(width: 10), // Space between buttons

                          // Next Button (Filled)
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed('/book_report',
                                    id: NavIds.profile,);
                                  // this matches nested key);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Appcolors.action,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "Next",
                                  style: TextStyle(fontFamily: 'Satoshi',color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),


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

  DateTimePickerSection({Key? key, this.onSelectionChanged}) : super(key: key);

  @override
  State<DateTimePickerSection> createState() => _DateTimePickerSectionState();
}

class _DateTimePickerSectionState extends State<DateTimePickerSection> {
  final DateTimePickerController controller = Get.put(DateTimePickerController());

  @override
  Widget build(BuildContext context) {
    controller.initDefaults(); // Set initial date

    return Obx(() {
      final currentMonth = controller.currentMonth.value;
      final selectedDate = controller.selectedDate.value;
      final selectedTime = controller.selectedTime.value;

      // callback
      widget.onSelectionChanged?.call(selectedDate, selectedTime);

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Text("Select your date ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                Spacer(),
                buildMonthNavigation(),
              ],
            ),
          ),

          const SizedBox(height: 8),
          buildCalendarGrid(currentMonth, selectedDate),
          const SizedBox(height: 10),
          buildTimeSlots(selectedTime),
          const SizedBox(height: 24),

        ],
      );
    });
  }

  Widget buildMonthNavigation() {
    return Row(
      children: [
        buildArrowButton(Icons.arrow_back_ios, () => controller.changeMonth(-1)),
        const SizedBox(width: 10),
        Text(
          "${getMonthName(controller.currentMonth.value.month)} ${controller.currentMonth.value.year}",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 10),
        buildArrowButton(Icons.arrow_forward_ios, () => controller.changeMonth(1)),
      ],
    );
  }

  Widget buildArrowButton(IconData icon, VoidCallback onTap) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Icon(icon,color: Appcolors.action, size: 16),
      ),
    );
  }

  Widget buildCalendarGrid(DateTime currentMonth, DateTime? selectedDate) {
    int daysInMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0).day;

    List<DateTime> days = List.generate(
      daysInMonth,
          (i) => DateTime(currentMonth.year, currentMonth.month, i + 1),
    );

    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: days.map((date) {
        final isSelected = selectedDate != null &&
            date.year == selectedDate.year &&
            date.month == selectedDate.month &&
            date.day == selectedDate.day;

        return GestureDetector(
          onTap: () => controller.selectDate(date),
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.grey[200],
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

  Widget buildTimeSlots(String selectedTime) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: controller.timeSlots.map((time) {
        final isSelected = selectedTime == time;
        return ChoiceChip(
          label: Text(
            time,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
          selected: isSelected,
          selectedColor: TextColors.primary,
          backgroundColor: Appcolors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(width: 0, color: Colors.transparent),
          ),
          onSelected: (_) => controller.selectTime(time),
        );
      }).toList(),
    );
  }

  String getMonthName(int month) {
    const names = ["", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return names[month];
  }
}
