import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/doctor/doctor_details.dart';

import '../../../controllers/tabcontroller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nab_ids.dart';
import '../../base/custom_field.dart';

class Doctor extends StatelessWidget {
  final void Function(String doctorId)? onDetailsTap;

  Doctor({super.key, this.onDetailsTap});

  final TabControllerX controller = Get.put(TabControllerX());
  final TextEditingController searchcontroller = TextEditingController();

  final List<String> tabs = ["All", "Favorite (4)"];

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
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    tabs[index],
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: isSelected ? Colors.blue : Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                    height: 2,
                                    width: 40,
                                    color: isSelected ? Colors.blue : Colors.transparent,
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
                      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.57,
                  children: List.generate(9, (index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/doctor_details',
                          id: NavIds.profile,  // this matches nested key
                          arguments: {'doctorId': 'some-id'},
                        );

                      },
                      child: Card(
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
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
                                        width: 4,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(
                                          Colors.black,
                                          BlendMode.srcIn,
                                        ),
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
                                  maxLines: 1,
                                ),
                              ),
                              Text(
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
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.hospitallocationIcon,
                                    width: 4,
                                    height: 16,
                                    colorFilter: ColorFilter.mode(
                                      Appcolors.action,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
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
                                    AppIcons.shearIcon,
                                    width: 4,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcIn,
                                    ),
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
