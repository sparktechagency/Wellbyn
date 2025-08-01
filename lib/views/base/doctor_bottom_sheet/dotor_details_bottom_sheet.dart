import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../controllers/date_picker_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/nab_ids.dart';
import '../../screen/doctor/doctor_details.dart';
import '../../screen/doctro_message/doctor_message.dart';

class DoctorBookingSheet extends StatelessWidget {
  final String doctorName;
  final String department;
  final String location;
  final List<String> timeSlots;
  final RxString selectedTime;
  final Function(String) onSelectTime;
  final VoidCallback onWaitlist;
  final VoidCallback onNext;


  const DoctorBookingSheet({
    super.key,
    required this.doctorName,
    required this.department,
    required this.location,
    required this.timeSlots,
    required this.selectedTime,
    required this.onSelectTime,
    required this.onWaitlist,
    required this.onNext,
  });

  void _shareText() {
    SharePlus.instance.share(
      ShareParams(text: 'Check out my website https://example.com'),
    );
  }

  @override
  Widget build(BuildContext context) {

    final DateTimePickerController controller = Get.put(DateTimePickerController(),);

    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, scrollController) {
      return  Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.95,
        ),
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
            controller: scrollController,
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
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            letterSpacing: 0.2,
                            color: TextColors.neutral900,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        const Text(
                          "Cardiology",
                          style: TextStyle(
                            color: TextColors.neutral500,
                            fontSize: 16,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w400,
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
                      AppIcons.hospitallocationIcon, color: Colors.blue,width: 24,height: 24,),
                    const SizedBox(width: 4),
                    const Text(
                      "Sylhet Health Center",
                      style: TextStyle(
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 0.2,
                        fontFamily: AppConstants.FONT_FAMILY,
                      ),
                    ),
                  ],
                ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Text(
                //     "Calle Ceiba #142, Urb. Alturas de Monte Verde, Trujillo Alto, PR 00976",
                //     style: TextStyle(
                //       fontStyle: FontStyle.italic,
                //       fontSize: 14,
                //       fontFamily: AppConstants.FONT_FAMILY,
                //       fontWeight: FontWeight.w600,
                //       color: TextColors.secondary,
                //     ),
                //   ),
                // ),
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
        );
      },
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
