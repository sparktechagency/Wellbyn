import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/doctor/doctor_details.dart';

import '../../../controllers/doctor.dart';
import '../../../controllers/tabcontroller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nab_ids.dart';
import '../../base/custom_field.dart';

class Doctor extends StatelessWidget {
  final void Function(String doctorId)? onDetailsTap;

  Doctor({super.key, this.onDetailsTap});

  final TabControllerX controller = Get.put(TabControllerX());
  final TextEditingController searchcontroller = TextEditingController();
  final DoctorController doctorController = Get.put(DoctorController());

  final List<String> tabs = ["All", "Favorite (4)"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Doctor",
          style: TextStyle(
            fontSize: 20,
            fontFamily: AppConstants.FONT_FAMILY,
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
      body: Obx(() {
        if (doctorController.isLoading.value) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading_2.json',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                    maxLines: 1,
                    borderColor: TextColors.neutral500,
                    filColor: Colors.white,
                    controller: searchcontroller,
                    hintText: 'Search for a doctor by name or designation...',
                    prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
                  ),
                  SizedBox(height: 16.h),
                  Stack(
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Row(
                          children: List.generate(tabs.length, (index) {
                            return Obx(() {
                              bool isSelected =
                                  controller.selectedIndex.value == index;
                              return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => controller.setTab(index),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        tabs[index],
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: isSelected
                                              ? TextColors.action
                                              : TextColors.secondary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                        height: 2,
                                        width: 40,
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

                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Available Doctor",
                        style: TextStyle(
                          fontFamily: AppConstants.FONT_FAMILY,
                          fontSize: 20,
                          color: HexColor("##3D3D3D"),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  Expanded(
                    child:  GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.56,
                        ),
                        itemCount: 20,
                        itemBuilder: (context,index){
                          return  GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                '/doctor_details',
                                id: NavIds.profile, // this matches nested key
                                arguments: {
                                  'doctorId': 'a1da1dad136adf4566adf1a',
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: ShadowColor.shadowColors1.withOpacity(0.10),
                                    blurRadius: 4,
                                    // reasonable softness
                                    spreadRadius: 0,
                                    offset: Offset(0, 3), // downward shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          "assets/image/doctor_image.png",
                                          height: 140.h,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: SvgPicture.asset(
                                            "assets/icons/Heart.svg",
                                            width: 20,
                                            height: 20,
                                            colorFilter: ColorFilter.mode(
                                              TextColors.neutral900,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      "Dr. Leo Marwick",
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 0.2,
                                        color: TextColors.neutral900,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Text(
                                    "Heart Health Expert",
                                    style: TextStyle(
                                      color: TextColors.neutral500,
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.hospitallocationIcon,
                                        width: 20,
                                        height: 20,
                                        colorFilter: ColorFilter.mode(
                                          Appcolors.action,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          "Sylhet Health Center",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                            //fontFamily: "Inter",       // <--- uncomment this
                                            color: TextColors.neutral900,
                                            fontWeight: FontWeight.w500,  // use w400 for italic because you have only 400 italic
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),

                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Text(
                                          "3 available time",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: TextColors.neutral900,
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.2,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      SvgPicture.asset(
                                        AppIcons.shearIcon,
                                        width: 20,
                                        height: 20,
                                        colorFilter: ColorFilter.mode(
                                          TextColors.neutral900,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
