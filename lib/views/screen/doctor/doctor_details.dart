import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wellbyn/controllers/dotor_details.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/doctor/book_report.dart';
import 'package:get/get.dart';
import 'package:wellbyn/views/screen/doctor/doctor.dart';
import 'package:wellbyn/views/screen/doctro_message/doctor_message.dart';

import '../../../controllers/date_picker_controller.dart';
import '../../../controllers/doctor.dart';
import '../../../utils/nab_ids.dart';
import '../../base/icon_text_button.dart';

class DoctorDetails extends StatelessWidget {
  final String doctorId;

  final DoctorDetailsController controller = Get.put(DoctorDetailsController());

  DoctorDetails({super.key, required this.doctorId});

  final List<String> timeSlots = [
    "11:45 am", "2:15 pm", "4:30 am",
    "6:20 pm", "10:05 pm", "7:00 pm",
    "1:55 am"
  ];

  final String selectedTime = "2:15 pm";

  void _shareText() {
    SharePlus.instance.share(
      ShareParams(text: 'Check out my website https://example.com'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Appcolors.page,
      body: Obx(()
      {
      if (controller.isloading.value) {
        return Center(
          child: Lottie.asset(
            'assets/animations/loading_2.json',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
        );
      } else {
        return Stack(
          children: [
            SizedBox(
              height: screenHeight / 3,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/image/doctor_image.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 15,
                    child: GestureDetector(
                      onTap: () => Get.back(id: NavIds.profile),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Appcolors.background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/arrow-left.svg',
                          color: Appcolors.brand222,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 15,
                    child: Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.toggleFavorite();
                          print("doctorid:$doctorId");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Appcolors.background,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            controller.isFavorite.value
                                ? AppIcons.heart01Icon
                                : AppIcons.heartIcon,
                            color: controller.isFavorite.value
                                ? Colors.red
                                : Appcolors.brand222,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Top image section
            // Bottom scrollable content
            Container(
              margin: EdgeInsets.only(top: 248.h),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Appcolors.page,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                    color: Appcolors.disabled.withOpacity(0.15),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: const Offset(0.3, 0.2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    Center(
                      child: Container(
                        height: 4,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Appcolors.background,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Doctor name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dr. Moule Marrk",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: TextColors.neutral900,
                                fontFamily: AppConstants.FONT_FAMILY,
                              ),
                            ),
                            const Text(
                              "Cardiology",
                              style: TextStyle(
                                color: TextColors.neutral500,
                                fontSize: 16,
                                fontFamily: AppConstants.FONT_FAMILY,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap:(){
                                Get.to(DoctorMessage());
                              },
                                child: _iconButton(
                                    AppIcons.chatIcon,
                                    Appcolors.action)),
                            const SizedBox(width: 8),

                            GestureDetector(
                              onTap: _shareText,
                              child: _iconButton(
                                AppIcons.shearIcon,
                                Appcolors.secondary,
                                iconColor: Appcolors.action,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Location
                    Row(
                      children: [
                        SvgPicture.asset(
                            AppIcons.hospitallocationIcon, color: Colors.blue),
                        const SizedBox(width: 4),
                        const Text(
                          "Sylhet Health Center",
                          style: TextStyle(
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Calle Ceiba #142, Urb. Alturas de Monte Verde, Trujillo Alto, PR 00976",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          fontFamily: AppConstants.FONT_FAMILY,
                          fontWeight: FontWeight.w500,
                          color: TextColors.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Date Picker
                    DateTimePickerSection(),

                    // Time Slots using Column
                    Obx(() =>
                        Column(
                          children: [
                            for (int i = 0; i < timeSlots.length; i += 3)
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: List.generate(3, (index) {
                                  if (i + index >= timeSlots.length) {
                                    return const SizedBox(width: 90);
                                  }
                                  final time = timeSlots[i + index];
                                  final isSelected = controller.selectedTime
                                      .value == time;

                                  return GestureDetector(
                                    onTap: () => controller.selectTime(time),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      width: 98,
                                      height: 40,

                                      decoration: BoxDecoration(
                                        color: isSelected ? TextColors.action : Appcolors.natral25,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFF0000001A).withOpacity(0.10),
                                            blurRadius: 4,
                                            offset: const Offset(0, 3),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            if (isSelected)
                                              const Icon(Icons.check,
                                                color: Appcolors.primary,
                                                size: 16,),
                                            if (isSelected) const SizedBox(
                                                width: 4),
                                            Text(
                                              time,
                                              style: TextStyle(
                                                fontFamily: AppConstants.FONT_FAMILY,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                          ],
                        )),

                    const SizedBox(height: 12),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child:InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              // padding controls width
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Appcolors.primary,
                                boxShadow: [
                                  BoxShadow(
                                    color: ShadowColor.shadowColors1.withOpacity(
                                      0.10,
                                    ),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 3),
                                    blurStyle: BlurStyle.normal,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppIcons.alamclock1Icon,color: Appcolors.action,),
                                  SizedBox(width: 6,),
                                  Text(
                                    "Waitlist",
                                    style: TextStyle(
                                      fontFamily: AppConstants.FONT_FAMILY,
                                      fontSize: 16,
                                      color: TextColors.action,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/book_report', id: NavIds.profile);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Appcolors.action,
                                boxShadow: [
                                  BoxShadow(
                                    color: ShadowColor.shadowColors1.withOpacity(0.10),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 3),
                                    blurStyle: BlurStyle.normal,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Next",
                                    style: TextStyle(
                                      fontFamily: AppConstants.FONT_FAMILY,
                                      fontSize: 14,
                                      color: TextColors.neutral200,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
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

          ],
        );
       }
      })
    );
  }

  Widget _iconButton(String iconAsset, Color bgColor, {Color? iconColor}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ShadowColor.shadowColors1.withOpacity(0.10),
            blurRadius: 4,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ]
      ),
      child: Center(
        child: SvgPicture.asset(
          iconAsset,
          height: 24,
          width: 24,
          color: iconColor,
        ),
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
  final DateTimePickerController controller = Get.put(DateTimePickerController(),);

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
                Text(
                  "Selected Date",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: "Inter",
                    color: TextColors.neutral900,

                  ),
                ),
                Spacer(),
                buildMonthNavigation(),
              ],
            ),
          ),

          const SizedBox(height: 8),
          const SizedBox(height: 8),

          day(),
          const SizedBox(height: 6),
          buildCalendarGrid(currentMonth, selectedDate),
          const SizedBox(height: 10),
          const SizedBox(height: 24),
        ],
      );
    });
  }

  Row day() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "Sun",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: AppConstants.FONT_FAMILY,
              ),
            ),
            Text(
              "Mon",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: AppConstants.FONT_FAMILY,
              ),
            ),
            Text(
              "Tue",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: AppConstants.FONT_FAMILY,
              ),
            ),
            Text(
              "Wed",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: AppConstants.FONT_FAMILY,
              ),
            ),
            Text(
              "Thu",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: AppConstants.FONT_FAMILY,
              ),
            ),
            Text(
              "Fri",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: AppConstants.FONT_FAMILY,
              ),
            ),
            Text(
              "Sat",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: AppConstants.FONT_FAMILY,
              ),
            ),
          ],
        );
  }



  Widget buildMonthNavigation() {
    return Row(
      children: [
        buildArrowButton(
          Icons.arrow_back_ios,
          () => controller.changeMonth(-1),
        ),
        const SizedBox(width: 10),
        Text(
          "${getMonthName(controller.currentMonth.value.month)} ${controller.currentMonth.value.year}",
          style: TextStyle(fontSize: 16,color: TextColors.secondary),
        ),
        const SizedBox(width: 10),
        buildArrowButton(
          Icons.arrow_forward_ios,
          () => controller.changeMonth(1),
        ),
      ],
    );
  }

  Widget buildArrowButton(IconData icon, VoidCallback onTap) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: TextColors.neutral500.withOpacity(0.20),
        //     offset: Offset(0, 0.3),
        //     blurRadius: 4
        //   )
        // ],
        borderRadius: BorderRadius.circular(5),
        color:TextColors.neutral300.withOpacity(0.30)
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Icon(icon, color: Appcolors.action, size: 13),
      ),
    );
  }

  Widget buildCalendarGrid(DateTime currentMonth, DateTime? selectedDate) {
    int daysInMonth = DateTime(
      currentMonth.year,
      currentMonth.month + 1,
      0,
    ).day;

    List<DateTime> days = List.generate(
      daysInMonth,
      (i) => DateTime(currentMonth.year, currentMonth.month, i + 1),
    );

    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: days.map((date) {
        final isSelected =
            selectedDate != null &&
            date.year == selectedDate.year &&
            date.month == selectedDate.month &&
            date.day == selectedDate.day;

        return GestureDetector(
          onTap: () => controller.selectDate(date),
          child: Container(
            width: 40.h,
            height: 30.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? Appcolors.action : Colors.transparent,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              date.day.toString(),
              style: TextStyle(
                fontFamily: AppConstants.FONT_FAMILY,
                fontSize: 16,
                color: isSelected ? Colors.white : TextColors.neutral900,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildTimeSlotsCustom(String selectedTime) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: controller.timeSlots.map((time) {
        final isSelected = selectedTime == time;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: TextColors.neutral900.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Material(
            color: Appcolors.page,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => controller.selectTime(time),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? TextColors.primary : Appcolors.natral25,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: ShadowColor.shadowColors1.withOpacity(0.10),
                      offset: Offset(0, 3),
                      blurRadius: 4,
                    )
                  ]
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSelected) ...[
                      const Icon(Icons.check, size: 16, color: Colors.white),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppConstants.FONT_FAMILY,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
  String getMonthName(int month) {
    const names = [
      "",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return names[month];
  }
}
