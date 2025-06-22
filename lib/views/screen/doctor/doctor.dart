import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/doctor/doctor_details.dart';

import '../../../controllers/tabcontroller.dart';
import '../../../utils/app_colors.dart';
import '../../base/custom_field.dart';

class Doctor extends StatelessWidget {
  Doctor({super.key});

  final TabControllerX controller = Get.put(TabControllerX());
  TextEditingController searchcontroller = TextEditingController();

  int selectedIndex = 0;

  List<String> tabs = ["All", "Favorite (4)"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctor",
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
            // change color dynamically
            semanticsLabel: 'App Logo',
            // for accessibility
            fit: BoxFit.contain,
            // control how the image fits
            alignment: Alignment.center, // position the image
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                filColor: Appcolors.primary,
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
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        tabs[index],
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: isSelected
                                              ? Colors.blue
                                              : Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                        height: 2,
                                        width: 40,
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.transparent,
                                      ),
                                    ],
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
                    // Ensures full width (alternative to width: MediaQuery)
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        left: 10,
                        right: 10,
                      ),
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Available Doctor",
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  // ✅ two items per row
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.57,
                  // Adjust for width/height ratio of cards
                  children: List.generate(9, (index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(DoctorDetails());

                      },
                      child: Card(
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 5,
                            right: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    // ✅ Border radius of 5
                                    child: Image.asset(
                                      "assets/image/doctor_image.png",
                                      height: 140.h,
                                      width: double.infinity,
                                      // ✅ Set height// ✅ Set width
                                      fit: BoxFit
                                          .cover, // Optional for proper scaling
                                    ),
                                  ),

                                  Positioned(
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                        "assets/icons/Heart.svg", // Your SVG file
                                        width: 4,
                                        // Simplified from 15.999979972839355
                                        height: 24,
                                        // For first image
                                        colorFilter: ColorFilter.mode(
                                          Colors.black,
                                          BlendMode.srcIn,
                                        ), // Optional color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  "Dr. Leo Marwick",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: TextColors.neutral900,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  // This handles text overflow
                                  maxLines: 1, // Typically used with overflow
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Text(
                                  "Heart Health Expert",
                                  style: TextStyle(
                                    color: TextColors.neutral500,
                                    fontFamily: 'Satoshi',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.hospitallocationIcon, // Your SVG file
                                    width: 4, // Simplified from 15.999979972839355
                                    height: 16, // For first image
                                    colorFilter: ColorFilter.mode(
                                      Appcolors.action,
                                      BlendMode.srcIn,
                                    ), // Optional color
                                  ),
                                  const SizedBox(width: 6),
                                  // space between icon and text (optional)
                                  Expanded(
                                    // ✅ allows the text to take remaining space
                                    child: Text(
                                      "Sylhet Health Center",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400,
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
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      "3 available time",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: TextColors.neutral900,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    AppIcons.shearIcon, // Your SVG file
                                    width: 4, // Simplified from 15.999979972839355
                                    height: 24, // For first image
                                    colorFilter: ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcIn,
                                    ), // Optional color
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
