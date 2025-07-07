import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/views/screen/canceled/canceled.dart';
import 'package:wellbyn/views/screen/compiled/compeleted.dart';
import 'package:wellbyn/views/screen/upcoming/upcoming.dart';

import '../../../controllers/appointment.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nab_ids.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final AppointmentController appointmentController = Get.put(AppointmentController());


  final List<String> tabs = ["Upcoming", "Compeleted", "Canceled"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "My appointment's",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: HexColor("#3D3D3D"),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back(id: NavIds.profile);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Appcolors.page,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(tabs.length, (index) {
                        return Obx(() {
                          bool isSelected = appointmentController.selectedIndex.value == index;
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              appointmentController.changeTab(index);
                              appointmentController.pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${tabs[index]}(2)",
                                    style: TextStyle(
                                      fontSize: isSelected ? 14.12 : 14,
                                      fontFamily: "Satoshi",
                                      overflow: TextOverflow.ellipsis,
                                      color: isSelected
                                          ? TextColors.action
                                          : TextColors.secondary,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 9),
                                  Container(
                                    height: 2,
                                    width: isSelected ? 82 : 80,
                                    color: isSelected
                                        ? TextColors.action
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      }),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        left: 10,
                        right: 10,
                      ),
                      height: 1,
                      color: Appcolors.disabled.withOpacity(0.25),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  switch (appointmentController.selectedIndex.value) {
                    case 0:
                      return Upcoming();
                    case 1:
                      return Compeleted();
                    case 2:
                      return Canceled();
                    default:
                      return SizedBox();
                  }
                }),
              ),

            ]
         )
       )
      )
    );
  }
}
